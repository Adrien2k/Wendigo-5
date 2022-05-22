import 'package:app/second.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wendigo app',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.deepPurple,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.


    //This line below will create a Scaffold widget which can be used to display the graph

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Text('Live Monitoring'),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const SecondPage(title: 'Second');
                }));
              },
              child: const Icon(Icons.analytics),
            ),)
        ],
      ),

      body: SafeArea(
          child: Stack(
            children: [
              Align(
                  alignment: const AlignmentDirectional(0.05,-0.85),
                  child: Container(
                    width: 340,
                    height: 300,
                    decoration: const BoxDecoration(
                      color: Color(0xFFEEEEEE),
                    ),
                  )
              ),
              //Inserting a container to containe the stack that will hold the text widget
              Align(
                  alignment: AlignmentDirectional(-0.75,0.2),
                  child: Container(
                      width: 500,
                      height: 700,
                      alignment: AlignmentDirectional(-0.25,-0.050000000000000044),
                      child: Align(
                          alignment: AlignmentDirectional(0,0.2),
                          child: Container(
                              width:300,
                              height:100,
                              child: Stack(
                                  children:[
                                    Align(
                                      alignment: AlignmentDirectional(0, 0),
                                      child: Icon(Icons.analytics),
                                    ),
                                    Align(
                                      alignment: AlignmentDirectional(0,0.29),
                                      child: Text(
                                        'Click on the  \'analytics\' icon          in the top right corner of the app bar to view live chart for water level',

                                      ),
                                    )
                                  ]
                              )
                          )
                      )
                  )
              )
            ],
          )
      ),
    );
  }
  }