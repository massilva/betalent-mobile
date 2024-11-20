import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:mobile_test/modules/application/application_page.dart';

void main() {
  testWidgets('A tela de Splash é mostrada com o componente CenteredLogo',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    var splashKey = const Key('SplashPage');
    var centeredLogoKey = const Key('CenteredLogo');

    expect(find.byKey(splashKey), findsOneWidget);
    expect(find.byKey(centeredLogoKey), findsOneWidget);
  });
}
