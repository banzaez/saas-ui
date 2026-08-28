import 'package:flutter/material.dart';
import 'package:saas_ui/src/shared/widgets/app_container.dart';
import 'controllers/log_json_controller.dart';
import 'widgets/log_json_header.dart';
import 'widgets/log_json_search_bar.dart';
import 'widgets/log_json_content.dart';
import 'widgets/log_json_footer.dart';
import 'styles/log_json_styles.dart';

class LogJsonViewer extends StatefulWidget {
  final String title;
  final String jsonString;
  final bool maxSize;
  final bool inDialog;

  const LogJsonViewer({
    super.key,
    required this.title,
    required this.jsonString,
    this.maxSize = false,
    this.inDialog = false,
  });

  @override
  State<LogJsonViewer> createState() => _LogJsonViewerState();
}

class _LogJsonViewerState extends State<LogJsonViewer> {
  late final LogJsonController _controller;

  @override
  void initState() {
    super.initState();
    _controller = LogJsonController();
    if (widget.inDialog) {
      _controller.setExpanded(true);
    }
    _controller.updateData(widget.jsonString);
  }

  @override
  void didUpdateWidget(LogJsonViewer oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.jsonString != widget.jsonString) {
      _controller.updateData(widget.jsonString);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.jsonString.isEmpty) return const SizedBox.shrink();

    final jsonContent = TapRegion(
      onTapInside: (_) => _controller.setActive(true),
      onTapOutside: (_) => _controller.setActive(false),
      child: ListenableBuilder(
        listenable: _controller,
        builder: (context, _) {
          return AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            constraints: widget.maxSize
                ? const BoxConstraints(minHeight: 200)
                : BoxConstraints(
                    minHeight: 100,
                    maxHeight: _controller.isExpanded ? 1000 : 300,
                  ),
            decoration: LogJsonStyles.getContainerDecoration(
              context,
              _controller.isActive,
            ),
            child: Column(
              mainAxisSize: widget.maxSize
                  ? MainAxisSize.max
                  : MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                if (_controller.isExpanded)
                  LogJsonSearchBar(controller: _controller),
                Flexible(child: LogJsonContent(controller: _controller)),
                LogJsonFooter(controller: _controller),
              ],
            ),
          );
        },
      ),
    );

    return SelectionArea(
      child: Column(
        mainAxisSize: widget.maxSize ? MainAxisSize.max : MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          LogJsonHeader(
            title: widget.title,
            jsonString: widget.jsonString,
            inDialog: widget.inDialog,
            controller: _controller,
          ),
          widget.maxSize ? Expanded(child: jsonContent) : jsonContent,
        ],
      ),
    );
  }
}

void showFullscreenDialog(
  BuildContext context,
  String title,
  String jsonString,
) {
  showDialog(
    context: context,
    builder: (context) => Material(
      type: MaterialType.transparency,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: AppContainer(
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(maxWidth: 1000),
            borderRadius: 16,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.85,
                child: LogJsonViewer(
                  title: title,
                  jsonString: jsonString,
                  maxSize: true,
                  inDialog: true,
                ),
              ),
            ),
          ),
        ),
      ),
    ),
    barrierColor: Colors.black.withValues(alpha: 0.5),
  );
}
