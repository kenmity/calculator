import 'package:calculator/main.dart';
import 'package:calculator/provider/calculator_provider.dart';
import 'package:calculator/provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:provider/provider.dart';

Widget createHomeScreen() => MultiProvider(
  providers: [
    ChangeNotifierProvider(create: (context) => ThemeProvider()),
    ChangeNotifierProvider(create: (context) => CalculatorProvider()),
  ],
  child: const MaterialApp(
    home: MyHomePage(title: '計算機'),
  ),
);

void main(){

  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();

  testWidgets('點擊1+1=2',
          (WidgetTester tester) async {

    // ARRANGE
        // load the PlantsApp widget
        await tester.pumpWidget(createHomeScreen());

        // wait for data to load
        await tester.pumpAndSettle();

        final text1 = find.text('1');
        final text2 = find.text('+');
        final text3 = find.text('1');
        final text4 = find.text('=');
    // ACT
        await tester.tap(text1);
        await tester.pump();
        await tester.tap(text2);
        await tester.pump();
        await tester.tap(text3);
        await tester.pump();
        await tester.tap(text4);
        await tester.pump();

        // await tester.pumpAndSettle();
    // ASSERT
        expect(find.text('2'), findsNWidgets(2));
      });
}