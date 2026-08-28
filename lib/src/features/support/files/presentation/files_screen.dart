import 'package:desktop_drop/desktop_drop.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:saas_ui/src/core/network/models/product.dart';
import 'package:saas_ui/src/core/util/app_logger.dart';
import 'package:saas_ui/src/core/util/app_snackbar.dart';
import 'package:saas_ui/src/features/support/files/application/files_notifier.dart';
import 'package:saas_ui/src/features/support/files/presentation/files_edit_panel.dart';
import 'package:saas_ui/src/features/support/files/presentation/files_table.dart';
import 'package:saas_ui/src/shared/widgets/app_screen_with_panel.dart';
import 'package:saas_ui/src/shared/widgets/app_drop_file_panel.dart';
import 'package:saas_ui/src/shared/widgets/app_header.dart';
import 'package:saas_ui/src/shared/widgets/fields/dropdown.dart';
import 'package:saas_ui/src/shared/widgets/padding_page_content.dart';
import 'package:dio/dio.dart' as dio;

class FilesScreen extends ConsumerStatefulWidget {
  const FilesScreen({super.key});

  @override
  ConsumerState<FilesScreen> createState() => _FilesScreenState();
}

class _FilesScreenState extends ConsumerState<FilesScreen> {
  final TextEditingController _uploadUuidController = TextEditingController();
  int? _currentProductId;

  @override
  void dispose() {
    _uploadUuidController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final productsAsync = ref.watch(filesProductsProvider);
    final filesNotifier = ref.read(filesProvider.notifier);

    return Scaffold(
      appBar: const AppHomeHeader(title: 'Файлы'),
      body: AppScreenWithPanel(
        screen: PaddingPageContent(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 16,
            children: [
              const Expanded(child: FilesTable()),
              _buildDropFilePanel(context, productsAsync, filesNotifier),
            ],
          ),
        ),
        editPanel: const FilesEditPanel(),
      ),
    );
  }

  Widget _buildDropFilePanel(
    BuildContext context,
    AsyncValue<List<Product>> productsAsync,
    Files filesNotifier,
  ) => AppDropFilePanel(
    child: Column(
      children: [
        productsAsync.when(
          data: (products) => AppDropdown(
            onChanged: (value) => setState(() => _currentProductId = value?.id),
            items: products
                .map(
                  (product) => DropdownMenuItem(
                    value: product,
                    child: Text(product.name),
                  ),
                )
                .toList(),
            hint: 'Продукт',
            showClearButton: true,
          ),
          loading: () => const SizedBox(height: 48),
          error: (_, _) => const SizedBox.shrink(),
        ),
        const SizedBox(height: 12),
        TextField(
          controller: _uploadUuidController,
          decoration: const InputDecoration(
            hintText: 'UUID (необязательно)',
            labelText: 'UUID',
          ),
        ),
      ],
    ),
    onFileDrop: (DropItem dropItem) async {
      if (dropItem is DropItemDirectory) {
        AppSnackbar.showError(
          title: 'Ошибка',
          message:
              'Загрузка директорий не поддерживается. Пожалуйста, выберите файл.',
        );
        return;
      }
      try {
        dio.MultipartFile file;
        if (kIsWeb) {
          final bytes = await dropItem.readAsBytes();
          file = dio.MultipartFile.fromBytes(bytes, filename: dropItem.name);
        } else {
          file = dio.MultipartFile.fromFileSync(dropItem.path);
        }
        final uuidText = _uploadUuidController.text.trim();
        final result = await filesNotifier.uploadFile(
          file,
          _currentProductId,
          uuid: uuidText.isNotEmpty ? uuidText : null,
        );
        if (mounted && result != null) _uploadUuidController.clear();
      } catch (e) {
        AppLogger.error('Не удалось загрузить файл: ${e.toString()}');
        AppSnackbar.showError(
          title: 'Ошибка',
          message: 'Не удалось загрузить файл: ${e.toString()}',
        );
      }
    },
  );
}
