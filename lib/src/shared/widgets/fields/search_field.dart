import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  final String hintText;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onTap;

  const SearchField({
    super.key,
    this.hintText = 'Поиск...',
    this.onChanged,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) => TextField(
    onChanged: onChanged,
    onTap: onTap,
    decoration: InputDecoration(
      hintText: hintText,
      hintStyle: const TextStyle(color: Color(0xFF9CA3AF)),
      prefixIcon: const Icon(Icons.search, color: Color(0xFF9CA3AF)),
    ),
  );
}
