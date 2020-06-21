import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Calculator'),
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
  
  String out = "0";

  String out1 = "0";
  double n1 = 0.0;
  double n2 = 0.0;
  String opr = "";
  int n,len,f;
  buttonPressed(String but){
    if(but == "C")
    {
      out = "0";
      out1 = "0";
      n1 = 0;
      n2 = 0;
      opr = "";
    }
    else if(but == "+" || but == "-" || but == "*" || but == "/")
    {
      n1 = double.parse(out);
      opr = but;
      out1 = "0";
    }
    else if(but == ".")
    {
      if(out1.contains("."))
      {
        print("Already contains decimal point");
      }
      else
      {
        out1 = out1 + but;
      }
    }
    else if(but == "=")
    {
      setState(() {
        if(out1.contains("."))
        {
          out = double.parse(out1).toString();
          
        }
        else
          out = int.parse(out1).toString();
      });
      n2 = double.parse(out);
      if(opr == "+")
      {
        out1 = (n1 + n2).toString();
      }
      if(opr == "-")
      {
        out1 = (n1 - n2).toString();
      }
      if(opr == "*")
      {
        out1 = (n1 * n2).toString();
      }
      if(opr == "/")
      {
        out1 = (n1 / n2).toString();
      }

      n1 = 0.0;
      n2 = 0.0;
      opr = "";
    }
    else{
      out1 = out1 + but;
    }
    print(out1);
    print(out);
    setState(() {
      if(but == "C")
      {
        out = "0";
      }
      
      else
      {
        len = out1.length;
        f = out1.indexOf('.');
         
        if(out1.contains("."))
        {
          out = double.parse(out1).toStringAsFixed(8);
          
        }
        else
          out = int.parse(out1).toString();
      }
      
    });
  }
  
 
  Widget buildButton(String but){
      return new Expanded(  
                    child: new OutlineButton(
                      padding: EdgeInsets.all(24.0),
                      child: new Text(but,
                      style: TextStyle(
                        fontSize:20.0,
                        fontWeight:FontWeight.bold,
                      ),),
                      onPressed: () => 
                        buttonPressed(but),
                      
                    ),
                  );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        title: Text(widget.title),
      ),
      body: new Container(
        child: new Column(
          children:<Widget>[
            Container(
              alignment: Alignment.centerRight,
              padding: new EdgeInsets.symmetric(
                vertical:70.0,
                horizontal:30.0,
              ),
              child: new Text(out,
            style: new TextStyle(
              fontSize:48.0,
              fontWeight:FontWeight.bold,
            ) 
            ,)),
            new Expanded(child: Divider(),
            ),
            new Column(
                      children: [
                      new Row(children: [ 
                          buildButton("9"),
                          buildButton("8"),
                          buildButton("7"),
                          buildButton("/"),      
                          ]),
                      new Row(children: [ 
                          buildButton("6"),
                          buildButton("5"),
                          buildButton("4"),
                          buildButton("*")      
                          ]),
                      new Row(children: [ 
                          buildButton("3"),
                          buildButton("2"),
                          buildButton("1"),
                          buildButton("+")      
                          ]),
                      new Row(children: [ 
                          buildButton("."),
                          buildButton("0"),
                          buildButton("00"),
                          buildButton("-")     
                          ]),

                      new Row(children: [ 
                          buildButton("C"),
                          buildButton("="),
                                
                          ]),
                ]
            )
          ],
        ),
      )
    );
  }
}
