import 'package:flutter/material.dart';
import 'quizbrain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
void main() => runApp(Quizzler());

QuizBrain quizBrain = QuizBrain();
class Quizzler extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: QuizPage(),
                  ),
                ),
              );
            }
          
          }
          
  class QuizPage extends StatefulWidget{
  @override
  _QuizPageState createState() => _QuizPageState();
  }
  
  class _QuizPageState extends State<QuizPage>{

  List<Icon> scoreKeeper = [];
  int _totalScore=0;
  
  void addScoreKeeper({IconData iconType,Color color}) =>
                scoreKeeper.add(
                  Icon(
                    iconType,
                    color: color,
                  )
                );
              
  bool nextQuestion()
  {
    
      return quizBrain.nextQuestion();
      
    
  }
  void checkAnswer(bool pressedAns,BuildContext context){
    setState(() {  
                
                if(quizBrain.getAnswer()==pressedAns)
                {
                    addScoreKeeper(iconType: Icons.check,color: Colors.green);
                    _totalScore++;
                }
                else{
                    addScoreKeeper(iconType: Icons.close,color: Colors.red);
                }
                bool isCompleted= nextQuestion();
                if(isCompleted){
                  Alert(context: context,title: '!Finished',desc: 'You have Scored '+_totalScore.toString()+' Out of '
                  +quizBrain.getQuestionLength().toString()).show();
                  _totalScore=0;
                  scoreKeeper.removeRange(0,quizBrain.getQuestionLength());
                  quizBrain.resetQuestion();
                }
              
        });
  }
  @override
  Widget build(BuildContext context) {
    
    return Column(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: <Widget>[
    Expanded(
          flex: 5,
          child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Center(
          child: Text(
            (quizBrain.currentQuestionNumber()+1).toString()+'. '+quizBrain.getQuestion(),
            textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 25.0,
          ),),
          
        ),
      ),
    ),Expanded(
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: FlatButton(
            textColor: Colors.white,
            color: Colors.green,
            child: Text(
              'True',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
              ),
            ),
            onPressed: () {
              //The user picked true.
              bool pressedAns = true;
              checkAnswer(pressedAns,context);
              
            },
          ),
        ),
      ),
      Expanded(
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: FlatButton(
            color: Colors.red,
            child: Text(
              'False',
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.white,
              ),
            ),
            onPressed: () {
              //The user picked false.
              bool pressedAns = false;
              checkAnswer(pressedAns,context);
              
              
            },
          ),
        ),
      ),
      Row(
          children: scoreKeeper,
        ),
    ],
      );
  }
}

/*
question1: 'You can lead a cow down stairs but not up stairs.', false,
question2: 'Approximately one quarter of human bones are in the feet.', true,
question3: 'A slug\'s blood is green.', true,
*/