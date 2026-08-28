import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:saas_ui/src/core/network/models/certificate_item.dart';
import 'package:saas_ui/src/features/home/certificate_item/application/certificate_detail_notifier.dart';
import 'package:saas_ui/src/features/home/certificate_item/presentation/widgets/certificate_info_card.dart';
import 'package:saas_ui/src/features/home/certificate_item/presentation/widgets/certificate_api_key.dart';
import 'package:saas_ui/src/features/home/certificate_item/presentation/widgets/certificate_buy_package.dart';
import 'package:saas_ui/src/features/home/certificate_item/presentation/widgets/certificate_files.dart';
import 'package:saas_ui/src/features/home/certificate_item/presentation/widgets/certificate_ip_whitelist.dart';
import 'package:saas_ui/src/shared/widgets/app_header.dart';
import 'package:saas_ui/src/shared/widgets/padding_page_content.dart';

class CertificateScreen extends ConsumerWidget {
  const CertificateScreen({super.key, this.certificateId, this.showBuySection});

  final String? certificateId;
  final bool? showBuySection;

  int get _parsedId => int.tryParse(certificateId ?? '') ?? 0;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final id = _parsedId;
    final async = ref.watch(certificateDetailProvider(id));

    return Scaffold(
      appBar: AppHomeHeader(
        title: 'Сертификат',
        actions: [
          ElevatedButton.icon(
            onPressed: () => context.pop(),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: const Color(0xFF2C3E50),
              side: const BorderSide(color: Color(0xFFE0E0E0)),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            ),
            icon: const Icon(Icons.arrow_back, size: 16),
            label: const Text('Назад'),
          ),
        ],
      ),
      body: async.when(
        data: (data) {
          if (data == null) {
            return const Center(child: Text('Некорректный сертификат'));
          }
          return _buildBody(data.certificate.certificateItems);
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('$e')),
      ),
    );
  }

  Widget _buildBody(List<CertificateItem> certItems) => PaddingPageContent(
    padding: EdgeInsets.zero,
    child: ListView(
      padding: const EdgeInsets.only(left: 8, right: 8, bottom: 16),
      children: [
        Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1024),
            child: Column(
              spacing: 16,
              children: [
                CertificateBuyPackage(
                  certificateId: _parsedId,
                  highlightFromQuery: showBuySection ?? false,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 16,
                  children: [
                    _buildLeftSection(certItems),
                    Expanded(child: _buildRightSection()),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );

  Widget _buildLeftSection(List<CertificateItem> certItems) => ConstrainedBox(
    constraints: const BoxConstraints(maxWidth: 350),
    child: certItems.isEmpty
        ? const SizedBox.shrink()
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 12,
            children: [
              const Text(
                'История покупок:',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              ),
              for (final item in certItems)
                CertificateInfoCard(certificateItem: item),
            ],
          ),
  );

  Widget _buildRightSection() => Column(
    spacing: 12,
    children: [
      CertificateFiles(certificateId: _parsedId),
      CertificateApiKey(certificateId: _parsedId),
      CertificateIpWhitelist(certificateId: _parsedId),
    ],
  );
}
