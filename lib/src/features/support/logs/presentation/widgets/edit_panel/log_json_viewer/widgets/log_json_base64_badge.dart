import 'package:flutter/material.dart';
import 'package:saas_ui/src/features/support/logs/presentation/widgets/edit_panel/log_json_viewer/styles/log_json_styles.dart';
import 'package:saas_ui/src/shared/widgets/clipboard_helper/clipboard_helper.dart';

class LogJsonBase64Badge extends StatelessWidget {
  final String text;

  const LogJsonBase64Badge({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    final Color badgeBg = LogJsonStyles.getBadgeBg(isDark);
    final Color badgeBorder = LogJsonStyles.getBadgeBorder(isDark);
    final Color badgeIcon = LogJsonStyles.getBadgeIcon(isDark);
    // ignore: unused_local_variable
    final TextStyle badgeTextStyle = TextStyle(
      fontSize: 10,
      fontWeight: FontWeight.w600,
      color: badgeIcon,
    );

    return Tooltip(
      message: 'Скопировать Base64',
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () {
            String base64String = text;
            if (base64String.startsWith('"')) {
              base64String = base64String.substring(1);
            }
            if (base64String.endsWith('"')) {
              base64String = base64String.substring(0, base64String.length - 1);
            }
            ClipboardHelper.copy(base64String);
          },
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 2),
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 0),
            decoration: BoxDecoration(
              color: badgeBg,
              borderRadius: BorderRadius.circular(4),
              border: Border.all(color: badgeBorder),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.data_object_rounded, size: 12, color: badgeIcon),
                const SizedBox(width: 4),
                Text(
                  'BASE64',
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                    color: badgeIcon,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
