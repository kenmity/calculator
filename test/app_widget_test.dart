
import 'package:calculator/provider/calculator_provider.dart';
import 'package:calculator/provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:calculator/main.dart';
import 'package:provider/provider.dart';

// Widget createHomeScreen() => ChangeNotifierProvider<CalculatorProvider>(
//   create: (context) => CalculatorProvider(),
//   child: MaterialApp(
//     home: MyHomePage(title: '計算機'),
//   ),
// );

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

  testWidgets('點擊1+1=2', (WidgetTester tester) async {
    // ARRANGE
    await tester.pumpWidget(createHomeScreen());
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
    // ASSERT
    expect(find.text('2'), findsNWidgets(2));
  });
  
  testWidgets('測試RadiusButton widgets，文字設定1和點擊後回傳true', (WidgetTester tester) async {
      // ARRANGE
      bool flag = false;
      await tester.pumpWidget(MaterialApp(
        home: Material(
          child:RadiusButton(
            text: '2',
            press: (){
              flag = true ;
            }),
        ),
      ));

      final text= find.text('2');
      final button = find.byType(RadiusButton);
      // ACT
      await tester.tap(button);
      await tester.pump();
      // final titleFinder = find.text('計算機');
      // final nultiplyFinder = find.text('x');
      // ASSERT
      expect(text, findsOneWidget);
      expect(flag, true);
      // expect(titleFinder, findsOneWidget);
      // expect(nultiplyFinder, findsOneWidget);
  });
}