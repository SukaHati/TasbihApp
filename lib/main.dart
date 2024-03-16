import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tasbih',
      theme: ThemeData(
        textTheme: Theme.of(context).textTheme.apply(
          bodyColor: Colors.white,
          displayColor: Colors.white,
        ),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  var _tword = [
    {
      "pic" : "assets/tasbih3.png",
      "word" : "Subhanallah",
      "max" : 33,
      "counter" : 0
    },
    {
      "pic" : "assets/tasbih2.png",
      "word" : "Alhamdulillah",
      "max" : 33,
      "counter" : 0
    },
    {
      "pic" : "assets/tasbih1.png",
      "word" : "Allahuakbar",
      "max" : 34,
      "counter" : 0
    }
  ];
  int _numpic = 0;

  late var _mainpic = _tword[_numpic]["pic"];
  late var _mainword = _tword[_numpic]["word"];
  late var _mainmax = _tword[_numpic]["max"] as int;

  updateNumber(int number) {
    _mainpic = _tword[number]["pic"];
    _mainword = _tword[number]["word"];
    _mainmax = _tword[number]["max"] as int;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(title: Text("Tasbih"), backgroundColor: Colors.green,),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 8,),
            Image.asset("$_mainpic"),
            Text("$_mainword: $_counter / $_mainmax"),
            SizedBox(height: 8,),
            TextButton.icon(onPressed: () {
              _counter += 1;
              if(_counter >= _mainmax) {
                _counter = 0;
                _numpic += 1;
                if(_numpic >= _tword.length) {
                  _numpic = 0;
                }
                updateNumber(_numpic);
              }
              setState(() {

              });
            }, icon: Icon(Icons.plus_one, size: 72), label: Text("Increase"), style: TextButton.styleFrom(foregroundColor: Colors.lightBlue),
            ),
            SizedBox(height: 8,),
            TextButton.icon(onPressed: () {
              _counter -= 1;
              if(_counter < 0) {
                _numpic -= 1;
                if(_numpic < 0) {
                  _numpic = _tword.length - 1;
                }
                updateNumber(_numpic);
                _counter = _mainmax;
              }
              setState(() {

              });
            }, icon: Icon(Icons.exposure_minus_1, size: 72), label: Text("Decrease"), style: TextButton.styleFrom(foregroundColor: Colors.red),
            ),
            SizedBox(height: 8,),
            TextButton.icon(onPressed: () {
              _counter = 0;
              updateNumber(0);
              setState(() {

              });
            }, icon: Icon(Icons.exposure_zero), label: Text("Reset")),
          ],
        ),
      )
    );
  }
}
