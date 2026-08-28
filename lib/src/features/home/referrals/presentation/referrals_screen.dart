import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:saas_ui/src/core/network/models/company.dart';
import 'package:saas_ui/src/core/network/models/company_referral.dart';
import 'package:saas_ui/src/core/util/app_snackbar.dart';
import 'package:saas_ui/src/features/home/referrals/application/referrals_company_notifier.dart';
import 'package:saas_ui/src/shared/widgets/app_container.dart';
import 'package:saas_ui/src/shared/widgets/app_header.dart';
import 'package:saas_ui/src/shared/widgets/app_progress_indicator.dart';
import 'package:saas_ui/src/shared/widgets/clipboard_helper/clipboard_helper.dart';
import 'package:saas_ui/src/shared/widgets/padding_page_content.dart';

class ReferralsScreen extends ConsumerStatefulWidget {
  const ReferralsScreen({super.key});

  @override
  ConsumerState<ReferralsScreen> createState() => _ReferralsScreenState();
}

class _ReferralsScreenState extends ConsumerState<ReferralsScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _referralCodeController = TextEditingController();
  String _referralCodeInput = '';
  bool _isCodeHovered = false;
  bool _submitting = false;

  @override
  void dispose() {
    _referralCodeController.dispose();
    super.dispose();
  }

  Future<void> _refresh() async {
    ref.invalidate(referralsCompanyProvider);
    await ref.read(referralsCompanyProvider.future);
  }

  Future<void> _attachPartner() async {
    if (!(_formKey.currentState?.validate() ?? false)) return;
    final code = _referralCodeController.text.trim();
    if (code.isEmpty) return;

    final company = switch (ref.read(referralsCompanyProvider)) {
      AsyncData(:final value) => value,
      _ => null,
    };
    if (code == company?.referralCode) {
      AppSnackbar.showError(
        title: 'Ошибка',
        message: 'Нельзя использовать собственный реферальный код',
      );
      return;
    }

    setState(() => _submitting = true);
    final ok = await ref
        .read(referralsCompanyProvider.notifier)
        .attachPartner(code);
    if (!mounted) return;
    setState(() => _submitting = false);

    if (ok) {
      AppSnackbar.showSuccess(title: 'Успешно', message: 'Код активирован');
      _referralCodeController.clear();
      setState(() => _referralCodeInput = '');
    }
  }

  void _copyReferralCode(String? code) {
    if (code != null && code.isNotEmpty) {
      ClipboardHelper.copy(code);
    }
  }

  @override
  Widget build(BuildContext context) {
    final async = ref.watch(referralsCompanyProvider);
    final company = async.value;
    final loadingInitial = async.isLoading && !async.hasValue;
    final refreshing = async.isLoading && async.hasValue;

    return Scaffold(
      appBar: AppHomeHeader(
        title: 'Реферальная программа',
        actions: [
          IconButton(
            onPressed: refreshing ? null : _refresh,
            icon: refreshing
                ? const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : const Icon(Icons.refresh),
            tooltip: 'Обновить данные',
          ),
        ],
      ),
      body: loadingInitial
          ? const Center(child: AppProgressIndicator())
          : RefreshIndicator(
              onRefresh: _refresh,
              child: SelectionArea(
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: PaddingPageContent(
                    child: Center(
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 1000),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          spacing: 24,
                          children: [
                            _buildAccountReferralSection(context, company),
                            _buildReferralsSection(company),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
    );
  }

  Widget _buildAccountReferralSection(BuildContext context, Company? company) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        spacing: 16,
        children: [
          Expanded(child: _buildMyReferralCodeBlock(context, company)),
          Expanded(child: _buildAttachPartnerBlock(company)),
        ],
      ),
    );
  }

  Widget _buildMyReferralCodeBlock(BuildContext context, Company? company) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isCodeHovered = true),
      onExit: (_) => setState(() => _isCodeHovered = false),
      cursor: SystemMouseCursors.click,
      child: InkWell(
        onTap: () => _copyReferralCode(company?.referralCode),
        borderRadius: BorderRadius.circular(12),
        child: Builder(
          builder: (context) {
            final code = company?.referralCode ?? '...';
            return AppContainer(
              borderColor: _isCodeHovered
                  ? Theme.of(context).colorScheme.primary
                  : null,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 12,
                children: [
                  const Text(
                    'Ваш реферальный код',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          code,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.2,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                      const Icon(Icons.copy, size: 16, color: Colors.blue),
                    ],
                  ),
                  Visibility(
                    visible: _isCodeHovered,
                    maintainSize: true,
                    maintainAnimation: true,
                    maintainState: true,
                    child: const Text(
                      'Нажмите, чтобы скопировать',
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildAttachPartnerBlock(Company? company) {
    return AppContainer(
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 12,
          children: [
            const Text(
              'Код приглашения',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 8,
              children: [
                Expanded(
                  child: TextFormField(
                    controller: _referralCodeController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    onChanged: (value) =>
                        setState(() => _referralCodeInput = value.trim()),
                    decoration: const InputDecoration(
                      hintText: 'Введите реферальный код',
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 16,
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) return null;
                      if (value.trim() == company?.referralCode) {
                        return 'Нельзя использовать свой код';
                      }
                      return null;
                    },
                  ),
                ),
                ElevatedButton(
                  onPressed:
                      _submitting ||
                          _referralCodeInput.isEmpty ||
                          _referralCodeInput == company?.referralCode
                      ? null
                      : _attachPartner,
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size.fromHeight(48),
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                  ),
                  child: _submitting
                      ? const SizedBox(
                          width: 18,
                          height: 18,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Colors.white,
                          ),
                        )
                      : const Text('Активировать'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildReferralsSection(Company? company) {
    final List<CompanyReferral> referrals = company?.referrals ?? [];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
          child: Text(
            'Привязанные клиенты (${referrals.length})',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        if (referrals.isEmpty)
          const AppContainer(
            child: Center(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'У вас пока нет привязанных клиентов',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ),
          )
        else
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: referrals.length,
            separatorBuilder: (context, index) => const SizedBox(height: 8),
            itemBuilder: (context, index) {
              final r = referrals[index];
              return _buildReferralItem(r);
            },
          ),
      ],
    );
  }

  Widget _buildReferralItem(CompanyReferral referral) {
    return AppContainer(
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: const CircleAvatar(child: Icon(Icons.business)),
        title: Text(
          referral.displayName,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        subtitle: Text('GUID: ${referral.guid ?? '—'}'),
      ),
    );
  }
}
