import 'package:flutter/material.dart';
import 'package:saas_ui/src/shared/widgets/app_progress_indicator.dart';

class ListViewWithPagination extends StatefulWidget {
  final VoidCallback onPagination;
  final bool isLoading;
  final IndexedWidgetBuilder separatorBuilder;
  final int itemCount;
  final IndexedWidgetBuilder itemBuilder;
  final EdgeInsetsGeometry padding;
  final ScrollController? controller;

  const ListViewWithPagination({
    super.key,
    required this.onPagination,
    this.isLoading = false,
    required this.separatorBuilder,
    required this.itemCount,
    required this.itemBuilder,
    this.padding = EdgeInsets.zero,
    this.controller,
  });

  @override
  State<ListViewWithPagination> createState() => _ListViewWithPaginationState();
}

class _ListViewWithPaginationState extends State<ListViewWithPagination> {
  late ScrollController _scrollController;
  bool _internalController = false;

  @override
  void initState() {
    super.initState();
    if (widget.controller != null) {
      _scrollController = widget.controller!;
    } else {
      _scrollController = ScrollController();
      _internalController = true;
    }
  }

  @override
  void dispose() {
    if (_internalController) {
      _scrollController.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) =>
      NotificationListener<ScrollUpdateNotification>(
        onNotification: (ScrollNotification n) {
          if (widget.isLoading) return false;

          final state = Scrollable.of(n.context!);
          if (state.widget.controller != _scrollController) return false;

          if (n.metrics.pixels == n.metrics.maxScrollExtent) {
            widget.onPagination();
          }
          return false;
        },
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            _buildList(),
            if (widget.isLoading)
              Positioned(bottom: 50, child: _buildLoading()),
          ],
        ),
      );

  Widget _buildList() => ListView.separated(
    controller: _scrollController,
    padding: widget.padding,
    separatorBuilder: widget.separatorBuilder,
    itemCount: widget.itemCount,
    itemBuilder: widget.itemBuilder,
  );

  Widget _buildLoading() => Container(
    decoration: const BoxDecoration(
      color: Colors.white,
      shape: BoxShape.circle,
    ),
    height: 48,
    width: 48,
    child: const Center(
      child: SizedBox(
        height: 24,
        width: 24,
        child: AppProgressIndicator(strokeWidth: 3),
      ),
    ),
  );
}
