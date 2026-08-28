import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EditPanelInfoItem extends StatelessWidget {
  const EditPanelInfoItem({
    super.key,
    this.title,
    this.value,
    this.titleWidget,
    this.valueWidget,
  });

  final String? title;
  final String? value;

  final Widget? titleWidget;
  final Widget? valueWidget;

  @override
  Widget build(BuildContext context) => InkWell(
    onTap: () => Clipboard.setData(ClipboardData(text: value ?? '')),
    child: Row(
      children: [
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 150),
          child:
              titleWidget ??
              Text(
                title!,
                style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
              ),
        ),
        const Spacer(),
        ConstrainedBox(
          constraints: const BoxConstraints(maxHeight: 100),
          child:
              valueWidget ??
              Text(
                value ?? '',
                style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
              ),
        ),
        const SizedBox(width: 24),
        Icon(
          Icons.copy,
          size: 16,
          color: Theme.of(context).colorScheme.primary.withAlpha(128),
        ),
      ],
    ),
  );
}
