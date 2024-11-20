import 'package:flutter/material.dart';

import '../core/constants/constants.dart';

class Logo extends StatelessWidget {
  final double height, width;
  const Logo({super.key, this.width = 200, this.height = 40});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AppConstants.assets.images.logo,
      width: width,
      height: height,
    );
  }
}
