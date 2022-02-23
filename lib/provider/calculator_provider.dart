
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorProvider extends ChangeNotifier{

  //輸入計算字串
  String userInput  = "" ;
  String answer = "0" ;
  String process = "" ;


  void removeUserInputOneChar(String userInput){
    String newUserInput = userInput.substring(0, userInput.length-1) ;
    this.userInput = newUserInput ;
    this.process = newUserInput ;
    notifyListeners() ;
  }

  void addUserInput(String userInput){
    this.userInput += userInput ;
    notifyListeners() ;
  }

  void addProcess(String process){
    this.process += process;
    notifyListeners() ;
  }

  void setUserInput(String userInput){
    this.userInput = userInput ;
    notifyListeners() ;
  }

  void setProcess(String process){
    this.process = process ;
    notifyListeners() ;
  }

  void setAnswer(String answer){
    this.answer = answer ;
    notifyListeners() ;
  }

  void clearAll(){
    setUserInput('') ;
    setProcess('') ;
    setAnswer('0') ;
  }


  String getResult(){

    try{
      String finaluserinput = userInput.replaceAll('x', '*').replaceAll('÷', '/').replaceAll('%', '/100');
      Parser p = Parser();
      Expression exp = p.parse(finaluserinput);
      ContextModel cm = ContextModel();
      double eval = exp.evaluate(EvaluationType.REAL, cm);
      // print(eval.ceilToDouble()) ;
      String res = eval.toStringAsFixed(8).toString();
      if(res.lastIndexOf('.0') > 0){
        res = double.parse(res).toInt().toString() ;
      }
      return res ;
    }catch(error){
      return 'error' ;
    }


  }

}