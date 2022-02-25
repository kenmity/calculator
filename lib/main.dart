import 'package:calculator/provider/calculator_provider.dart';
import 'package:calculator/provider/theme_provider.dart';
import 'package:calculator/style/my_themes.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:math_expressions/math_expressions.dart';
import 'package:provider/provider.dart';
void main() {

  LicenseRegistry.addLicense(() async* {
    final license = await rootBundle.loadString('assets/fonts/noto_sans_tc/OFL.txt');
    yield LicenseEntryWithLineBreaks(['assets'], license);
  });

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        ChangeNotifierProvider(create: (context) => CalculatorProvider()),
        // Provider(create: (context) => SomeOtherClass()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      themeMode: Provider.of<ThemeProvider>(context).themeMode,
      // theme: MyThemes.lightTheme,
      // darkTheme:MyThemes.darkTheme,

      theme: themeTypeData[Provider.of<ThemeProvider>(context).themeType],
      darkTheme:themeTypeData[Provider.of<ThemeProvider>(context).themeDarkType],
      home: const MyHomePage(title: '計算機'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  String userInput = "" ;
  String answer = "0" ;
  String process = "" ;

  @override
  Widget build(BuildContext context) {

    // ThemeProvider themeProvider = Provider.of<ThemeProvider>(context) ;
    CalculatorProvider calculatorProvider = Provider.of<CalculatorProvider>(context);

    userInput = calculatorProvider.userInput ;
    answer = calculatorProvider.answer ;
    process = calculatorProvider.process ;

    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          actions: const <Widget>[
            ChangeThemeDarkSwitchButton()
          ],
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color:const Color.fromRGBO(157, 169, 117, 1.0)
                ),
                width: double.infinity,
                height: 50,
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: Text(
                      (process == "") ? answer: process ,
                      style: const TextStyle(
                          fontSize: 30
                      )
                  ),
                ),
              ),
            ),
            Column(
              children: [
                Row(
                  children: [
                    Expanded(
                        flex: 1,
                        child: RadiusButton(
                            text: 'CE',
                            backgroundColor: const Color.fromRGBO(251, 85, 85, 1.0),
                            press: (){
                              setState(() {

                                //刪除一個字
                                if(userInput != ""){
                                  calculatorProvider.removeUserInputOneChar(userInput);
                                  // calculatorProvider.setUserInput(newUserInput) ;
                                  // calculatorProvider.setProcess(newUserInput) ;
                                  // String newUserInput = userInput.substring(0, userInput.length-1) ;
                                  // print(newUserInput) ;
                                  // userInput = newUserInput;
                                  // process = newUserInput;
                                }else{
                                  //全刪
                                  calculatorProvider.clearAll() ;
                                  // userInput = "" ;
                                  // process = "" ;
                                  // answer = "0" ;
                                }

                              });
                            }
                        )
                    ),
                    Expanded(
                        flex: 1,
                        child: RadiusButton(
                            text: '%',
                            press: () {
                              setState(() {
                                // userInput += '%' ;
                                // process += '%' ;
                                calculatorProvider.addUserInput('%') ;
                                calculatorProvider.addProcess('%') ;
                              });
                            }
                        )
                    ),
                    Expanded(
                        flex: 1,
                        child: RadiusButton(
                            text: '÷',
                            press: (){
                              setState(() {
                                // userInput += '÷' ;
                                // process += '÷' ;

                                calculatorProvider.addUserInput('÷') ;
                                calculatorProvider.addProcess('÷') ;
                              });
                            })
                    ),
                    Expanded(
                        flex: 1,
                        child: RadiusButton(
                            text: 'x',
                            press: (){
                              setState(() {
                                // userInput += 'x' ;
                                // process += 'x' ;

                                calculatorProvider.addUserInput('x') ;
                                calculatorProvider.addProcess('x') ;
                              });
                            })
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                        flex: 1,
                        child: RadiusButton(
                            text: '7',
                            press: () {
                              setState(() {
                                // userInput += '7' ;
                                // process += '7' ;

                                calculatorProvider.addUserInput('7') ;
                                calculatorProvider.addProcess('7') ;
                              });
                            })
                    ),
                    Expanded(
                        flex: 1,
                        child: RadiusButton(
                            text: '8',
                            press: () {
                              setState(() {
                                // userInput += '8' ;
                                // process += '8' ;

                                calculatorProvider.addUserInput('8') ;
                                calculatorProvider.addProcess('8') ;
                              });
                            }
                        )
                    ),
                    Expanded(
                        flex: 1,
                        child: RadiusButton(
                            text: '9',
                            press: (){
                              setState(() {
                                // userInput += '9' ;
                                // process += '9' ;

                                calculatorProvider.addUserInput('9') ;
                                calculatorProvider.addProcess('9') ;
                              });
                            })
                    ),
                    Expanded(
                        flex: 1,
                        child: RadiusButton(text: '-',press: (){
                          setState(() {
                            // userInput += '-' ;
                            // process += '-' ;

                            calculatorProvider.addUserInput('-') ;
                            calculatorProvider.addProcess('-') ;
                          });
                        })
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                        flex: 1,
                        child: RadiusButton(
                            text: '4',
                            press: (){
                              setState(() {
                                // userInput += '4' ;
                                // process += '4' ;

                                calculatorProvider.addUserInput('4') ;
                                calculatorProvider.addProcess('4') ;
                              });
                            })
                    ),
                    Expanded(
                        flex: 1,
                        child: RadiusButton(
                            text: '5',
                            press: (){
                              setState(() {
                                // userInput += '5' ;
                                // process += '5' ;

                                calculatorProvider.addUserInput('5') ;
                                calculatorProvider.addProcess('5') ;
                              });
                            })
                    ),
                    Expanded(
                        flex: 1,
                        child: RadiusButton(
                            text: '6',
                            press: (){
                              setState(() {
                                // userInput += '6' ;
                                // process += '6' ;

                                calculatorProvider.addUserInput('6') ;
                                calculatorProvider.addProcess('6') ;
                              });
                            })
                    ),
                    Expanded(
                        flex: 1,
                        child: RadiusButton(
                            text: '+',
                            press: (){
                              setState(() {
                                // userInput += '+' ;
                                // process += '+' ;

                                calculatorProvider.addUserInput('+') ;
                                calculatorProvider.addProcess('+') ;
                              });
                            })
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child:  Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                  flex: 1,
                                  child: RadiusButton(
                                      text: '1',
                                      press: (){
                                        setState(() {
                                          // userInput += '1' ;
                                          // process += '1' ;

                                          calculatorProvider.addUserInput('1') ;
                                          calculatorProvider.addProcess('1') ;
                                        });
                                      })
                              ),
                              Expanded(
                                  flex: 1,
                                  child: RadiusButton(
                                      text: '2',
                                      press: (){
                                        setState(() {
                                          // userInput += '2' ;
                                          // process += '2' ;

                                          calculatorProvider.addUserInput('2') ;
                                          calculatorProvider.addProcess('2') ;
                                        });
                                      })
                              ),
                              Expanded(
                                  flex: 1,
                                  child: RadiusButton(
                                      text: '3',
                                      press: (){
                                        setState(() {
                                          // userInput += '3' ;
                                          // process += '3' ;

                                          calculatorProvider.addUserInput('3') ;
                                          calculatorProvider.addProcess('3') ;
                                        });
                                      })
                              ),
                              Expanded(
                                  flex: 1,
                                  child: RadiusButton(
                                      text: '.',
                                      press: (){
                                        setState(() {
                                          // userInput += '.' ;
                                          // process += '.' ;

                                          calculatorProvider.addUserInput('.') ;
                                          calculatorProvider.addProcess('.') ;
                                        });
                                      })
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                  flex: 2,
                                  child: RadiusButton(
                                      text: '0',
                                      press: (){
                                        setState(() {
                                          // userInput += '0' ;
                                          // process += '0' ;

                                          calculatorProvider.addUserInput('0') ;
                                          calculatorProvider.addProcess('0') ;
                                        });
                                      })
                              ),
                              Expanded(
                                  flex: 2,
                                  child: RadiusButton(
                                      text: '=',
                                      color: Colors.white,
                                      backgroundColor: const Color.fromRGBO(
                                          249, 147, 84, 1.0),
                                      press: () {
                                        String res = calculatorProvider.getResult() ;
                                        if(res == 'error'){
                                          setState(() {
                                            calculatorProvider.clearAll() ;
                                          });
                                        }else{
                                          setState(() {
                                            calculatorProvider.setUserInput('');
                                            calculatorProvider.setProcess('');
                                            calculatorProvider.setAnswer(res);
                                          });
                                        }
                                      }
                                  )
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            // SizedBox(height: 10),
            // const Divider(
            //   height: 1,
            //   thickness: 0,
            //   indent: 0,
            //   endIndent: 0,
            //   color: Colors.black,
            // ),
            // Container(
            //     width: double.infinity,
            //     child: Row(
            //       children: const [
            //         Expanded(
            //             child: Text(
            //               '主題顏色切換',
            //               style: TextStyle(
            //                   fontSize: 20
            //               ),
            //             )
            //         ),
            //       ],
            //     )
            // ),
            // SizedBox(height: 10),
            // Container(
            //     width: double.infinity,
            //     child: Row(
            //       children: [
            //         Expanded(
            //           child: RadiusButton(
            //               text: 'Red',
            //               color: Colors.black,
            //               backgroundColor: Colors.red,
            //               press: (){
            //                 themeProvider.setThemeType(ThemeType.red, ThemeType.redDark) ;
            //               }),
            //         ),
            //         Expanded(
            //           child: RadiusButton(
            //               text: 'Blue',
            //               color: Colors.black,
            //               backgroundColor: Colors.blue,
            //               press: (){
            //                 themeProvider.setThemeType(ThemeType.blue, ThemeType.blueDark) ;
            //               }),
            //         ),
            //       ],
            //     )
            // ),


          ],

        )
    );
  }
}


//圓角按鈕
class RadiusButton extends StatelessWidget {
  const RadiusButton({
    Key? key,
    this.text,
    this.width,
    this.height,
    this.color,
    this.backgroundColor,
    this.press,
  }) : super(key: key);
  final String? text;
  final double? width;
  final double? height;
  final Color? color;
  final Color? backgroundColor;
  final Function? press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: SizedBox(
        width: width ?? 0,
        height: height ?? 80,
        child: TextButton(
          style: TextButton.styleFrom(
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
            primary: Colors.white,
            backgroundColor: backgroundColor ?? Theme.of(context).primaryColorDark,
          ),
          onPressed: press as void Function()?,
          child: Text(
            text!,
            style: TextStyle(
              fontSize: 30,
              color: color ?? Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

// class SwitchButton extends StatelessWidget {
//   const SwitchButton({
//     Key? key,
//     this.isDarkMode,
//     this.press
//   }) : super(key: key);
//
//   final bool? isDarkMode;
//   final Function? press;
//
//   @override
//   Widget build(BuildContext context) {
//     return Switch.adaptive(
//         value: isDarkMode ?? false,
//         onChanged: press as bool Function(bool),
//     );
//   }
// }


class ChangeThemeDarkSwitchButton extends StatelessWidget {
  const ChangeThemeDarkSwitchButton({
    Key? key
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context) ;
    return Switch.adaptive(
      value:themeProvider.isDarkMode,
      onChanged: (value){
        themeProvider.toggleTheme(value) ;
      },
    );
  }
}