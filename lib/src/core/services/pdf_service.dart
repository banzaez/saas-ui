import 'dart:typed_data';

import 'package:file_saver/file_saver.dart';
import 'package:saas_ui/src/core/network/repository/invoices_repository.dart';
import 'package:saas_ui/src/core/util/app_logger.dart';
import 'package:saas_ui/src/core/util/app_snackbar.dart';

class PdfService {
  PdfService(this._invoicesRepository);

  final InvoicesRepository _invoicesRepository;

  Future<Uint8List?> fetchPdf(int invoiceId) async {
    final response = await _invoicesRepository.getPdf(invoiceId);

    if (response.isSuccess) {
      return Uint8List.fromList(response.result ?? []);
    }

    AppLogger.error(
      'Failed to fetch PDF. ${response.errorString} (invoiceId: $invoiceId)',
    );
    response.showError();

    return null;
  }

  Future<void> savePdf(Uint8List pdf, String fileName) async {
    try {
      await FileSaver.instance.saveFile(name: fileName, bytes: pdf);
      AppLogger.success('PDF saved successfully: $fileName');
      AppSnackbar.showSuccess(
        title: 'Сохранено',
        message: 'Файл $fileName сохранен в папку "Загрузки"',
      );
    } catch (e) {
      AppLogger.error('Failed to save PDF: $fileName', error: e);
      AppSnackbar.showError(
        title: 'Ошибка',
        message: 'Не удалось сохранить файл',
      );
    }
  }

  Future<void> sendPdf(int invoiceId) async {
    final response = await _invoicesRepository.sendEmail(invoiceId);

    if (response.isSuccess) {
      AppLogger.success('Email with PDF sent for invoiceId: $invoiceId');
      AppSnackbar.showSuccess(
        title: 'Письмо отправлено',
        message: 'Проверьте вашу электронную почту',
      );
    } else {
      AppLogger.error('Failed to send PDF email: ${response.errorString}');
      response.showError();
    }
  }
}
