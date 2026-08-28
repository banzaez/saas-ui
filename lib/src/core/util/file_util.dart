import 'package:flutter/material.dart';

class FileUtil {
  static const _extensionMeta = <String, (String, Color)>{
    'epf': ('Обработка 1С', Colors.orange),
    'txt': ('Текстовый файл', Colors.blueGrey),
    'pdf': ('Документ PDF', Colors.red),
    'zip': ('Архив', Colors.orange),
    'rar': ('Архив', Colors.orange),
    '7z': ('Архив', Colors.orange),
    'doc': ('Документ Word', Colors.blue),
    'docx': ('Документ Word', Colors.blue),
    'xls': ('Таблица Excel', Colors.green),
    'xlsx': ('Таблица Excel', Colors.green),
    'jpg': ('Изображение', Colors.purple),
    'jpeg': ('Изображение', Colors.purple),
    'png': ('Изображение', Colors.purple),
    'svg': ('Изображение', Colors.purple),
  };

  static String getFileCategory(String filename) {
    final extension = filename.split('.').last.toLowerCase();
    return _extensionMeta[extension]?.$1 ?? 'Файл';
  }

  static Widget buildFileBadge(String filename) {
    final extension = filename.split('.').last.toLowerCase();
    final color = _extensionMeta[extension]?.$2 ?? Colors.blueGrey;

    return UnconstrainedBox(
      child: Container(
        width: 38,
        margin: const EdgeInsets.only(right: 8),
        padding: const EdgeInsets.symmetric(vertical: 4),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: color.withValues(alpha: 0.2)),
        ),
        child: Center(
          child: Text(
            extension.toUpperCase(),
            style: TextStyle(
              fontSize: 9,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
        ),
      ),
    );
  }

  static String formatBytes(int bytes) {
    if (bytes < 1024) return '$bytes B';
    if (bytes < 1024 * 1024) return '${(bytes / 1024).toStringAsFixed(1)} KB';
    if (bytes < 1024 * 1024 * 1024) {
      return '${(bytes / (1024 * 1024)).toStringAsFixed(1)} MB';
    }
    return '${(bytes / (1024 * 1024 * 1024)).toStringAsFixed(1)} GB';
  }
}
