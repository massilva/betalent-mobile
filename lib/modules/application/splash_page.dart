import 'package:flutter/material.dart';

import '../../components/centered_logo.dart';
import '../../core/constants/constants.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppConstants.colors.primary,
      child: const CenteredLogo(),
    );
  }
}
