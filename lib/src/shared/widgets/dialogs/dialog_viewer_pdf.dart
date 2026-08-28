import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pdfrx/pdfrx.dart';
import 'package:saas_ui/src/core/services/pdf_service_provider.dart';
import 'package:saas_ui/src/core/styles/app_colors.dart';
import 'package:saas_ui/src/shared/widgets/app_container.dart';

class PdfViewerDialog extends ConsumerStatefulWidget {
  const PdfViewerDialog({
    super.key,
    required this.invoiceId,
    required this.fileName,
    required this.pdfBytes,
  });

  final int invoiceId;
  final String fileName;
  final Uint8List pdfBytes;

  @override
  ConsumerState<PdfViewerDialog> createState() => _PdfViewerDialogState();
}

class _PdfViewerDialogState extends ConsumerState<PdfViewerDialog> {
  late final PdfViewerController _pdfViewerController;

  @override
  void initState() {
    super.initState();
    _pdfViewerController = PdfViewerController();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return AppContainer(
      constraints: BoxConstraints(
        maxWidth: 1000,
        maxHeight: MediaQuery.of(context).size.height * 0.9,
      ),
      padding: EdgeInsets.zero,
      child: Column(
        children: [
          _PdfViewerDialogHeader(
            invoiceId: widget.invoiceId,
            fileName: widget.fileName,
            pdfBytes: widget.pdfBytes,
          ),
          const Divider(height: 1, thickness: 1),
          Expanded(
            child: Container(
              color: isDark ? Colors.black26 : Colors.grey.shade100,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.1),
                          blurRadius: 15,
                          spreadRadius: 2,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: PdfViewer.data(
                      widget.pdfBytes,
                      sourceName: widget.fileName,
                      controller: _pdfViewerController,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _PdfViewerDialogHeader extends ConsumerWidget {
  const _PdfViewerDialogHeader({
    required this.invoiceId,
    required this.fileName,
    required this.pdfBytes,
  });

  final int invoiceId;
  final String fileName;
  final Uint8List pdfBytes;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pdfService = ref.read(pdfServiceProvider);
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      decoration: BoxDecoration(
        color: isDark ? Colors.black12 : Colors.white,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
      ),
      padding: const EdgeInsets.fromLTRB(24, 20, 16, 20),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  spacing: 12,
                  children: [
                    const Icon(
                      Icons.description_rounded,
                      color: AppColors.primary,
                      size: 24,
                    ),
                    Text(
                      'Просмотр счета',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: isDark
                            ? AppColors.textBoldDark
                            : AppColors.textBold,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 36),
                  child: Text(
                    fileName,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: isDark
                          ? AppColors.textGreyDark
                          : AppColors.textGrey,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            spacing: 12,
            children: [
              _ActionButton(
                onPressed: () => pdfService.savePdf(pdfBytes, fileName),
                icon: Icons.download_rounded,
                label: 'Скачать',
              ),
              _ActionButton(
                onPressed: () => pdfService.sendPdf(invoiceId),
                icon: Icons.alternate_email_rounded,
                label: 'На почту',
                isPrimary: true,
              ),
            ],
          ),
          const SizedBox(width: 16),
          Tooltip(
            message: 'Закрыть',
            child: IconButton.filledTonal(
              onPressed: () => context.pop(),
              icon: const Icon(Icons.close_rounded),
              style: IconButton.styleFrom(
                backgroundColor: isDark
                    ? Colors.white10
                    : Colors.black.withValues(alpha: 0.05),
                foregroundColor: isDark ? Colors.white70 : Colors.black54,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  const _ActionButton({
    required this.onPressed,
    required this.icon,
    required this.label,
    this.isPrimary = false,
  });

  final Future<void> Function() onPressed;
  final IconData icon;
  final String label;
  final bool isPrimary;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return ElevatedButton.icon(
      onPressed: () async {
        await onPressed();
        if (!context.mounted) return;
      },
      icon: Icon(icon, size: 18),
      label: Text(label),
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: isPrimary
            ? AppColors.primary
            : (isDark ? Colors.white10 : Colors.grey.shade100),
        foregroundColor: isPrimary
            ? Colors.white
            : (isDark ? Colors.white : AppColors.textColor),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}
