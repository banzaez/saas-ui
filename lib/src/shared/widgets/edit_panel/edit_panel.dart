import 'package:flutter/material.dart';
import 'package:saas_ui/src/core/styles/app_colors.dart';
import 'package:saas_ui/src/shared/widgets/app_container.dart';
import 'package:saas_ui/src/shared/widgets/app_divider.dart';
import 'package:saas_ui/src/shared/widgets/edit_panel/info_item.dart';

class AppEditPanel extends StatefulWidget {
  const AppEditPanel({
    super.key,
    this.onSave,
    this.onCancel,
    this.onClose,
    required this.title,
    required this.children,
    this.info,
    this.maxWidth = 350,
    this.spacing,
    this.padding,
    this.actionsPrefix,
    this.isScrollable = true,
    this.saveLabel = 'Сохранить',
    this.cancelLabel = 'Отменить',
  });

  final bool isScrollable;
  final EdgeInsets? padding;

  final VoidCallback? onSave;
  final VoidCallback? onCancel;
  final VoidCallback? onClose;

  final String title;
  final String saveLabel;
  final String cancelLabel;

  final double? spacing;

  final double maxWidth;
  final List<Widget> children;
  final List<EditPanelInfoItem>? info;
  final Widget? actionsPrefix;

  @override
  State<AppEditPanel> createState() => _AppEditPanelState();
}

class _AppEditPanelState extends State<AppEditPanel> {
  final ScrollController scrollController = ScrollController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool get _hasButtons => widget.onSave != null || widget.onCancel != null;

  @override
  Widget build(BuildContext context) => _buildPanelContainer(
    child: Column(
      children: [
        _buildHeader(),
        Expanded(child: _buildFormSection()),
        if (widget.info != null && widget.info!.isNotEmpty) _buildInfo(context),
      ],
    ),
  );

  Widget _buildPanelContainer({required Widget child}) => Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(16),
      border: Border.all(color: Colors.grey.withValues(alpha: .18)),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.22),
          blurRadius: 36,
          spreadRadius: 2,
          offset: const Offset(-4, 4),
        ),
      ],
    ),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(15.5),
      child: AppContainer(
        padding: EdgeInsets.zero,
        borderRadius: 16,
        constraints: BoxConstraints(maxWidth: widget.maxWidth),
        boxShadow: const [],
        child: child,
      ),
    ),
  );

  Widget _buildFormSection() => Padding(
    padding: const EdgeInsets.fromLTRB(20, 18, 20, 0),
    child: Column(
      spacing: 16,
      children: [
        Expanded(child: _buildForm()),
        if (_hasButtons) ...[const AppDivider(), _buildButtons()],
        const SizedBox(height: 16),
      ],
    ),
  );

  Widget _buildHeader() => Container(
    decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: [AppColors.primary, AppColors.primary.shade800],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
    ),
    padding: const EdgeInsets.fromLTRB(8, 12, 20, 12),
    child: Row(
      children: [
        _buildCloseButton(),
        const SizedBox(width: 6),
        Expanded(
          child: Text(
            widget.title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    ),
  );

  Widget _buildCloseButton() => Material(
    color: Colors.transparent,
    borderRadius: BorderRadius.circular(20),
    child: InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: _onClose,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Icon(
          Icons.close_rounded,
          size: 20,
          color: Colors.white.withValues(alpha: .8),
        ),
      ),
    ),
  );

  Widget _buildForm() => Form(
    key: _formKey,
    child: widget.isScrollable
        ? SingleChildScrollView(
            controller: scrollController,
            padding: widget.padding ?? const EdgeInsets.only(right: 4),
            child: Column(
              spacing: widget.spacing ?? 0,
              children: widget.children,
            ),
          )
        : Padding(
            padding: widget.padding ?? const EdgeInsets.only(right: 4),
            child: Column(
              spacing: widget.spacing ?? 0,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: widget.children,
            ),
          ),
  );

  Widget _buildButtons() => Row(
    mainAxisAlignment: MainAxisAlignment.end,
    spacing: 10,
    children: [
      if (widget.actionsPrefix != null) ...[
        widget.actionsPrefix!,
        const Spacer(),
      ],
      if (widget.onCancel != null) _buildCancelButton(),
      if (widget.onSave != null) _buildSaveButton(),
    ],
  );

  Widget _buildCancelButton() => OutlinedButton(
    onPressed: _onCancel,
    style: OutlinedButton.styleFrom(
      foregroundColor: AppColors.textGrey,
      side: BorderSide(color: Colors.grey.withValues(alpha: .4)),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
    ),
    child: Text(widget.cancelLabel),
  );

  Widget _buildSaveButton() => ElevatedButton(
    onPressed: _onSave,
    style: ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
    ),
    child: Text(widget.saveLabel),
  );

  Widget _buildInfo(BuildContext context) => Container(
    decoration: BoxDecoration(
      color: AppColors.primary.withValues(alpha: .04),
      border: Border(
        top: BorderSide(color: AppColors.primary.withValues(alpha: .12)),
      ),
    ),
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
    child: Column(
      spacing: 8,
      children: [
        for (var i = 0; i < widget.info!.length; i++) ...[
          widget.info![i],
          if (i < widget.info!.length - 1) const AppDivider(),
        ],
      ],
    ),
  );

  void _onClose() {
    if (widget.onClose != null) return widget.onClose!();
    if (widget.onCancel != null) return widget.onCancel!();
  }

  void _onCancel() => widget.onCancel?.call();

  void _onSave() {
    final isValid = _formKey.currentState?.validate() ?? false;
    if (isValid) widget.onSave?.call();
  }
}
