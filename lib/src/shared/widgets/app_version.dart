import 'package:flutter/widgets.dart';
import 'package:saas_ui/src/core/constants/app_constants.dart';
import 'package:saas_ui/src/core/styles/app_colors.dart';
import 'package:saas_ui/src/shared/widgets/app_container.dart';

class AppVersion extends StatelessWidget {
  const AppVersion({super.key});

  @override
  Widget build(BuildContext context) => AppContainer(
    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
    child: Text(
      AppConstants.appVersion,
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 12, color: AppColors.greyDarker),
    ),
  );
}
