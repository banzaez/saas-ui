import 'package:flutter/material.dart';
import 'package:saas_ui/src/core/styles/app_colors.dart';
import 'package:saas_ui/src/shared/widgets/clipboard_helper/clipboard_helper.dart';

class LogSection extends StatelessWidget {
  final String title;
  final IconData icon;
  final List<Widget> children;

  const LogSection({
    super.key,
    required this.title,
    required this.icon,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(
              icon,
              size: 16,
              color: AppColors.primary.withValues(alpha: 0.7),
            ),
            const SizedBox(width: 8),
            Text(
              title.toUpperCase(),
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w700,
                color: AppColors.primary.withValues(alpha: 0.7),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        ...children,
      ],
    );
  }
}

class LogInfoGrid extends StatelessWidget {
  final List<Widget> children;
  const LogInfoGrid({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 24,
      children: children.map((e) => Expanded(child: e)).toList(),
    );
  }
}

class LogInfoItem extends StatelessWidget {
  final String label;
  final String value;
  final String? subValue;
  final Widget? valueWidget;

  const LogInfoItem({
    super.key,
    required this.label,
    required this.value,
    this.subValue,
    this.valueWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: AppColors.textGrey,
          ),
        ),
        const SizedBox(height: 4),
        if (valueWidget != null)
          valueWidget!
        else
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Flexible(
                child: SelectableText(
                  value.isEmpty ? '-' : value,
                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                ),
              ),
              if (subValue != null) ...[
                const SizedBox(width: 8),
                Text(
                  subValue!,
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w400,
                    color: AppColors.textGrey,
                  ),
                ),
              ],
            ],
          ),
      ],
    );
  }
}

class LogMethodBadge extends StatelessWidget {
  final String method;
  const LogMethodBadge({super.key, required this.method});

  @override
  Widget build(BuildContext context) {
    Color color = AppColors.primary;
    if (method == 'GET') color = Colors.green;
    if (method == 'POST') color = Colors.blue;
    if (method == 'PUT') color = Colors.orange;
    if (method == 'DELETE') color = Colors.red;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        method,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w700,
          color: color,
        ),
      ),
    );
  }
}

class LogStatusBadge extends StatelessWidget {
  final int status;
  const LogStatusBadge({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    Color color = AppColors.primary;
    if (status >= 200 && status < 300) color = Colors.green;
    if (status >= 400) color = Colors.red;
    if (status >= 500) color = Colors.purple;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        status.toString(),
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w700,
          color: color,
        ),
      ),
    );
  }

  static String getHttpStatusText(int status) {
    return switch (status) {
      200 => 'OK',
      201 => 'Created',
      204 => 'No Content',
      301 => 'Moved Permanently',
      302 => 'Found',
      304 => 'Not Modified',
      400 => 'Bad Request',
      401 => 'Unauthorized',
      403 => 'Forbidden',
      404 => 'Not Found',
      500 => 'Internal Server Error',
      _ => '',
    };
  }

  static Color getHttpStatusColor(int status) {
    if (status >= 200 && status < 300) return Colors.green;
    if (status >= 400) return Colors.red;
    if (status >= 500) return Colors.purple;
    return AppColors.primary;
  }
}

class LogBadge extends StatelessWidget {
  final String text;
  final Color? color;
  const LogBadge({super.key, required this.text, this.color});

  @override
  Widget build(BuildContext context) {
    final effectiveColor = color ?? AppColors.textGrey;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: effectiveColor.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: effectiveColor,
        ),
      ),
    );
  }
}

class LogDurationBadge extends StatelessWidget {
  final int duration;
  const LogDurationBadge({super.key, required this.duration});

  @override
  Widget build(BuildContext context) {
    Color color;
    if (duration < 300) {
      color = Colors.green;
    } else if (duration < 1000) {
      color = Colors.orange;
    } else {
      color = Colors.red;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        '$duration мс',
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w700,
          color: color,
        ),
      ),
    );
  }
}

class LogPathBadge extends StatelessWidget {
  final String path;
  const LogPathBadge({super.key, required this.path});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _copyToClipboard(path),
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
        decoration: BoxDecoration(
          color: AppColors.foregroundColor,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: AppColors.primary.withValues(alpha: 0.15),
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.03),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.alternate_email_rounded,
              size: 14,
              color: AppColors.primary.withValues(alpha: 0.7),
            ),
            const SizedBox(width: 8),
            Flexible(
              child: Text(
                path,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primary.withValues(alpha: 0.9),
                ).copyWith(fontFamily: 'monospace', letterSpacing: -0.5),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LogUrlBadge extends StatelessWidget {
  final String url;
  const LogUrlBadge({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _copyToClipboard(url),
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
        decoration: BoxDecoration(
          color: AppColors.foregroundColor,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: AppColors.primary.withValues(alpha: 0.15),
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.03),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.link_rounded,
              size: 14,
              color: AppColors.primary.withValues(alpha: 0.7),
            ),
            const SizedBox(width: 8),
            Flexible(
              child: Text(
                url,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primary.withValues(alpha: 0.9),
                ).copyWith(fontFamily: 'monospace', letterSpacing: -0.5),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Future<void> _copyToClipboard(String text) async {
  if (text.trim().isEmpty) return;
  await ClipboardHelper.copy(text);
}
