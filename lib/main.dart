import 'package:calculator_flutter/buttons.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final List <String> buttons = [
    'C' , 'DEL' ,  '%' , '/' ,
    '9' , '8' ,  '7' , 'x' ,
    '6' , '5' ,  '4' , '-' ,
    '3' , '2' ,  '1' , '+' ,
    '0' , '.' ,  'ANS' , '=' ,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[100],
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(),
          ),
          Expanded(
            flex: 3,
            child: Container(
              child: GridView.builder(
                itemCount: buttons.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
                itemBuilder: (BuildContext context, int index) {

                  if(index == 0) {
                    return MyButton(
                    buttonText: buttons[index],
                    color: Colors.green,
                    textColor: Colors.white
                  );
                  }else if (index == 1) {
                    return MyButton(
                    buttonText: buttons[index],
                    color: Colors.red,
                    textColor: Colors.white
                  );
                  }else {
                    return MyButton(
                    buttonText: buttons[index],
                    color: isOperator(buttons[index]) ? Colors.deepPurple : Colors.deepPurple[50],
                    textColor: isOperator(buttons[index]) ? Colors.white : Colors.deepPurple
                  );
                  }
                  
                },
              )
            ),
          )
        ],
      ),
    );
  }

  bool isOperator(String x) {
    if(x == '%' || x == '/' || x == 'x' || x == '-' || x == '+' || x == '=') {
      return true;
    }
    return false;
  }
}
