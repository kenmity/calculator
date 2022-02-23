
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
  child: MaterialApp(
    home: MyHomePage(title: '計算機'),
  ),
);

void main(){
  test('1+1=2' , () async{
    // ARRANGE
    CalculatorProvider calculatorProvider = CalculatorProvider() ;

    // ACT
    calculatorProvider.setUserInput('1+1') ;
    String answer = calculatorProvider.getResult() ;

    // ASSERT
    expect(answer, '2') ;
  });

  test('2-1=1' , () async{
    // ARRANGE
    CalculatorProvider calculatorProvider = CalculatorProvider() ;

    // ACT
    calculatorProvider.setUserInput('2-1') ;
    String answer = calculatorProvider.getResult() ;

    // ASSERT
    expect(answer, '1') ;
  });

  test('2x2=4' , () async{
    // ARRANGE
    CalculatorProvider calculatorProvider = CalculatorProvider() ;

    // ACT
    calculatorProvider.setUserInput('2x2') ;
    String answer = calculatorProvider.getResult() ;

    // ASSERT
    expect(answer, '4') ;
  });

  test('4÷2=2' , () async{
    // ARRANGE
    CalculatorProvider calculatorProvider = CalculatorProvider() ;

    // ACT
    calculatorProvider.setUserInput('4÷2') ;
    String answer = calculatorProvider.getResult() ;

    // ASSERT
    expect(answer, '2') ;
  });

  test('4÷*=error' , () async{
    // ARRANGE
    CalculatorProvider calculatorProvider = CalculatorProvider() ;

    // ACT
    calculatorProvider.setUserInput('4÷*') ;
    String answer = calculatorProvider.getResult() ;

    // ASSERT
    expect(answer, 'error') ;
  });
}