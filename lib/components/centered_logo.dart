import 'package:flutter/material.dart';

import 'logo.dart';

class CenteredLogo extends StatelessWidget {
  const CenteredLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Logo(),
    );
  }
}
