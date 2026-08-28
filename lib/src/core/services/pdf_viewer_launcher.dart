import 'package:flutter/material.dart';
import 'package:saas_ui/src/core/routers/app_routers.dart';
import 'package:saas_ui/src/core/services/pdf_service.dart';
import 'package:saas_ui/src/core/util/app_logger.dart';
import 'package:saas_ui/src/shared/widgets/dialogs/dialog_viewer_pdf.dart';

extension PdfViewerLaunch on PdfService {
  Future<void> showDialogPdf(int invoiceId, String fileName) async {
    final checkedName = fileName
        .replaceAll(RegExp(r'[\\/:*?"<>|]'), '_')
        .trim();

    AppLogger.info('Opening PDF viewer for invoiceId: $invoiceId');

    final pdf = await fetchPdf(invoiceId);
    if (pdf == null) return;

    await showDialog(
      context: AppRouters.rootNavigatorKey.currentContext!,
      builder: (context) => Dialog(
        child: PdfViewerDialog(
          invoiceId: invoiceId,
          fileName: checkedName,
          pdfBytes: pdf,
        ),
      ),
    );
  }
}
