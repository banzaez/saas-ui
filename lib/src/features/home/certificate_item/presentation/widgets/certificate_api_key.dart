import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:saas_ui/src/features/home/certificate_item/application/certificate_detail_notifier.dart';
import 'package:saas_ui/src/shared/widgets/app_container.dart';

class CertificateApiKey extends ConsumerStatefulWidget {
  const CertificateApiKey({super.key, required this.certificateId});

  final int certificateId;

  @override
  ConsumerState<CertificateApiKey> createState() => _CertificateApiKeyState();
}

class _CertificateApiKeyState extends ConsumerState<CertificateApiKey> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final async = ref.watch(certificateDetailProvider(widget.certificateId));

    return async.when(
      data: (data) {
        if (data == null) return const SizedBox.shrink();
        final apiKey = data.certificate.apiKey;
        if (apiKey.isEmpty) return const SizedBox.shrink();

        return MouseRegion(
          onEnter: (_) => setState(() => _isHovered = true),
          onExit: (_) => setState(() => _isHovered = false),
          child: AppContainer(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 12,
              children: [
                Text(
                  'API-ключ',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                ),
                InkWell(
                  onTap: () => ref
                      .read(
                        certificateDetailProvider(
                          widget.certificateId,
                        ).notifier,
                      )
                      .copyApiKey(),
                  borderRadius: BorderRadius.circular(8),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      color: Theme.of(context)
                          .colorScheme
                          .surfaceContainerHighest
                          .withValues(alpha: 0.3),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: _isHovered
                            ? Theme.of(context).colorScheme.primary
                            : Theme.of(
                                context,
                              ).colorScheme.outline.withValues(alpha: 0.2),
                      ),
                    ),
                    child: Row(
                      spacing: 8,
                      children: [
                        Expanded(
                          child: Text(
                            apiKey,
                            style: TextStyle(
                              fontSize: 15,
                              fontFamily: 'monospace',
                              fontWeight: FontWeight.w500,
                              letterSpacing: 0.5,
                              color: Theme.of(context).colorScheme.onSurface,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Icon(
                          Icons.copy_rounded,
                          size: 18,
                          color: Theme.of(
                            context,
                          ).colorScheme.onSurfaceVariant.withValues(alpha: 0.5),
                        ),
                      ],
                    ),
                  ),
                ),
                const Text(
                  'Нажмите на поле, чтобы скопировать',
                  style: TextStyle(color: Colors.grey, fontSize: 11),
                ),
              ],
            ),
          ),
        );
      },
      loading: () => const SizedBox.shrink(),
      error: (_, _) => const SizedBox.shrink(),
    );
  }
}
