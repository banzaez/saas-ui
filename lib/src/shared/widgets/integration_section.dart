import 'package:flutter/material.dart';
import 'package:saas_ui/src/shared/widgets/edit_panel/section_header.dart';

class IntegrationSection extends StatelessWidget {
  const IntegrationSection({
    super.key,
    required this.children,
  });

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDark
            ? Colors.white.withValues(alpha: 0.02)
            : theme.colorScheme.primary.withValues(alpha: 0.03),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isDark
              ? Colors.white.withValues(alpha: 0.08)
              : theme.colorScheme.primary.withValues(alpha: 0.1),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 16,
        children: [
          const EditPanelSectionHeader(
            title: 'Интеграция',
            icon: Icons.sync_alt_rounded,
          ),
          ...children,
        ],
      ),
    );
  }
}

class IntegrationGroup extends StatelessWidget {
  const IntegrationGroup({
    super.key,
    required this.title,
    required this.logo,
    required this.children,
  });

  final String title;
  final Widget logo;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8,
      children: [
        Row(
          spacing: 8,
          children: [
            SizedBox(
              width: 18,
              height: 18,
              child: logo,
            ),
            Text(
              title,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 12,
            children: children,
          ),
        ),
      ],
    );
  }
}

class ConfirmedTextField extends StatefulWidget {
  const ConfirmedTextField({
    super.key,
    required this.initialValue,
    required this.onChanged,
    required this.label,
    required this.helperText,
    this.prefixIcon,
  });

  final String? initialValue;
  final ValueChanged<String> onChanged;
  final String label;
  final String helperText;
  final Widget? prefixIcon;

  @override
  State<ConfirmedTextField> createState() => _ConfirmedTextFieldState();
}

class _ConfirmedTextFieldState extends State<ConfirmedTextField> {
  late final TextEditingController _controller;
  bool _isEditing = false;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialValue);
  }

  @override
  void didUpdateWidget(covariant ConfirmedTextField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.initialValue != oldWidget.initialValue && !_isEditing) {
      _controller.text = widget.initialValue ?? '';
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,
      readOnly: !_isEditing,
      decoration: InputDecoration(
        labelText: widget.label,
        helperText: widget.helperText,
        prefixIcon: widget.prefixIcon != null
            ? Padding(
                padding: const EdgeInsets.only(left: 12, right: 8),
                child: widget.prefixIcon,
              )
            : null,
        prefixIconConstraints: const BoxConstraints(
          minWidth: 40,
          minHeight: 24,
        ),
        suffixIcon: _isEditing
            ? Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.close_rounded, color: Colors.red, size: 20),
                    tooltip: 'Отменить',
                    onPressed: () {
                      setState(() {
                        _isEditing = false;
                        _controller.text = widget.initialValue ?? '';
                      });
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.check_rounded, color: Colors.green, size: 20),
                    tooltip: 'Подтвердить',
                    onPressed: () {
                      widget.onChanged(_controller.text);
                      setState(() {
                        _isEditing = false;
                      });
                    },
                  ),
                ],
              )
            : Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.lock_outline, size: 16, color: Colors.grey),
                  IconButton(
                    icon: const Icon(Icons.edit_rounded, size: 20),
                    tooltip: 'Редактировать',
                    onPressed: () {
                      setState(() {
                        _isEditing = true;
                      });
                    },
                  ),
                ],
              ),
      ),
    );
  }
}
