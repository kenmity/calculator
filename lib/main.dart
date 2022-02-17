import 'package:calculator/style/my_themes.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'style/material_colors.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      themeMode: ThemeMode.light,
      theme: MyThemes.lightTheme,
      darkTheme:MyThemes.darkTheme,
      home: const MyHomePage(title: 'calculator demo'),
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
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color:Color.fromRGBO(157, 169, 117, 1.0)
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
                            press: (){
                              setState(() {

                                //刪除一個字
                                if(userInput != ""){
                                  String newUserInput = userInput.substring(0, userInput.length-1) ;
                                  print(newUserInput) ;
                                  userInput = newUserInput;
                                  process = newUserInput;
                                }else{
                                  //全刪
                                  userInput = "" ;
                                  process = "" ;
                                  answer = "0" ;
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
                                userInput += '%' ;
                                process += '%' ;
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
                                userInput += '÷' ;
                                process += '÷' ;
                              });
                            })
                    ),
                    Expanded(
                        flex: 1,
                        child: RadiusButton(
                            text: 'x',
                            press: (){
                              setState(() {
                                userInput += 'x' ;
                                process += 'x' ;
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
                                userInput += '7' ;
                                process += '7' ;
                              });
                            })
                    ),
                    Expanded(
                        flex: 1,
                        child: RadiusButton(
                            text: '8',
                            press: () {
                              setState(() {
                                userInput += '8' ;
                                process += '8' ;
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
                                userInput += '9' ;
                                process += '9' ;
                              });
                            })
                    ),
                    Expanded(
                        flex: 1,
                        child: RadiusButton(text: '-',press: (){
                          setState(() {
                            userInput += '-' ;
                            process += '-' ;
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
                                userInput += '4' ;
                                process += '4' ;
                              });
                            })
                    ),
                    Expanded(
                        flex: 1,
                        child: RadiusButton(
                            text: '5',
                            press: (){
                              setState(() {
                                userInput += '5' ;
                                process += '5' ;
                              });
                            })
                    ),
                    Expanded(
                        flex: 1,
                        child: RadiusButton(
                            text: '6',
                            press: (){
                              setState(() {
                                userInput += '6' ;
                                process += '6' ;
                              });
                            })
                    ),
                    Expanded(
                        flex: 1,
                        child: RadiusButton(
                            text: '+',
                            press: (){
                              setState(() {
                                userInput += '+' ;
                                process += '+' ;
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
                                          userInput += '1' ;
                                          process += '1' ;
                                        });
                                      })
                              ),
                              Expanded(
                                  flex: 1,
                                  child: RadiusButton(
                                      text: '2',
                                      press: (){
                                        setState(() {
                                          userInput += '2' ;
                                          process += '2' ;
                                        });
                                      })
                              ),
                              Expanded(
                                  flex: 1,
                                  child: RadiusButton(
                                      text: '3',
                                      press: (){
                                        setState(() {
                                          userInput += '3' ;
                                          process += '3' ;
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
                                          userInput += '0' ;
                                          process += '0' ;
                                        });
                                      })
                              ),
                              Expanded(
                                  flex: 1,
                                  child: RadiusButton(
                                      text: '.',
                                      press: (){
                                        setState(() {
                                          userInput += '.' ;
                                          process += '.' ;
                                        });
                                      })
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Expanded(
                        flex: 1,
                        child: RadiusButton(
                            text: '=',
                            height: 170,
                            color: Colors.white,
                            backgroundColor: Colors.deepOrangeAccent,
                            press: () {
                              // String userInput = "3-2x3÷3";
                              String finaluserinput = userInput;
                              finaluserinput = userInput.replaceAll('x', '*').replaceAll('÷', '/').replaceAll('%', '/100');
                              print(finaluserinput) ;

                              try{
                                Parser p = Parser();
                                Expression exp = p.parse(finaluserinput);
                                ContextModel cm = ContextModel();
                                double eval = exp.evaluate(EvaluationType.REAL, cm);
                                String res = eval.toString();
                                setState(() {
                                  userInput = "" ;
                                  process = "" ;
                                  answer = res ;
                                });
                              }catch(error){
                                print(error) ;
                                setState(() {
                                  userInput = "" ;
                                  process = "" ;
                                  answer = "0";
                                });
                              }
                            }
                        )
                    ),
                  ],
                ),
              ],
            ),
            Container(
                width: double.infinity,
                color: Colors.green,
                child: Row(
                  children: [
                    Expanded(
                      child: RadiusButton(
                          text: 'Dark',
                          color: Colors.black,
                          backgroundColor: Colors.white,
                          press: (){

                          }),
                    ),
                    Expanded(
                      child: RadiusButton(
                          text: 'Light',
                          color: Colors.black,
                          backgroundColor: Colors.white,
                          press: (){

                          }),
                    ),
                    Expanded(
                      child: RadiusButton(
                          text: 'Red',
                          color: Colors.black,
                          backgroundColor: Colors.white,
                          press: (){

                          }),
                    ),
                    Expanded(
                      child: RadiusButton(
                          text: 'Blue',
                          color: Colors.black,
                          backgroundColor: Colors.white,
                          press: (){

                          }),
                    ),
                  ],
                )
            )

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
            backgroundColor: backgroundColor ?? materialBlack.shade400,
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
