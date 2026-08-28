import 'package:flutter/material.dart';

class AppInitials extends StatelessWidget {
  const AppInitials({
    super.key,
    required this.text,
    this.size = 32,
    this.fontSize,
  });

  final String text;
  final double size;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    final initials = _generateInitials(text);
    final baseColor = _getColorFromText(text);

    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: baseColor.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(size * 0.3),
        border: Border.all(color: baseColor.withValues(alpha: 0.2), width: 1),
      ),
      child: Center(
        child: Text(
          initials,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w700,
            color: baseColor,
          ).copyWith(fontSize: fontSize ?? (size * 0.38), letterSpacing: -0.5),
        ),
      ),
    );
  }

  String _generateInitials(String text) {
    if (text.isEmpty) return '??';

    final cleanText = text
        .replaceAll(RegExp(r'[()""«»]+'), '')
        .replaceAll(RegExp(r'^ООО|ИП|ЗАО|ТД\s+'), '')
        .replaceAll('_', ' ')
        .trim();

    // 1. Сначала разбиваем по явным разделителям (пробелы, точки и т.д.)
    final parts = cleanText
        .split(RegExp(r'[\s._@-]+'))
        .where((word) => word.isNotEmpty)
        .toList();

    if (parts.length >= 2) {
      // "AI Content" -> "AC"
      return (parts[0][0] + parts[1][0]).toUpperCase();
    }

    // 2. Если слово одно, пробуем разбить его по CamelCase (напр. "IvanIvanov" -> "II")
    final singleWord = parts.isNotEmpty ? parts[0] : '';
    if (singleWord.isEmpty) return '??';

    final camelParts = singleWord
        .split(RegExp(r'(?=[A-ZА-Я])'))
        .where((word) => word.isNotEmpty)
        .toList();

    if (camelParts.length >= 2) {
      return (camelParts[0][0] + camelParts[1][0]).toUpperCase();
    }

    // 3. Крайний случай: берем первые две буквы слова
    return singleWord.length >= 2
        ? singleWord.substring(0, 2).toUpperCase()
        : singleWord[0].toUpperCase();
  }

  Color _getColorFromText(String text) {
    // Расширенная палитра современных и сбалансированных цветов
    final List<Color> palette = [
      const Color(0xFF6366F1), // Indigo
      const Color(0xFF10B981), // Emerald
      const Color(0xFFF59E0B), // Amber
      const Color(0xFFEF4444), // Red
      const Color(0xFF8B5CF6), // Violet
      const Color(0xFFEC4899), // Pink
      const Color(0xFF06B6D4), // Cyan
      const Color(0xFFF97316), // Orange
      const Color(0xFF64748B), // Slate
      const Color(0xFFF43F5E), // Rose
      const Color(0xFF84CC16), // Lime
      const Color(0xFF0EA5E9), // Sky
      const Color(0xFF14B8A6), // Teal
      const Color(0xFFD946EF), // Fuchsia
      const Color(0xFF3B82F6), // Blue
      const Color(0xFFEAB308), // Yellow
      const Color(0xFF22C55E), // Green
      const Color(0xFFA855F7), // Purple
      const Color(0xFF0891B2), // Cyan Deep
      const Color(0xFFBE185D), // Pink Intense
    ];

    final int hash = text.hashCode.abs();
    return palette[hash % palette.length];
  }
}
