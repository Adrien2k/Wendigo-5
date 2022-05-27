import 'package:app/second.dart'; //Importing second.dart lib/page so as to link the two pages (codes at line 80 onwards)
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';//Adding the google map package to implement the map
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'login.dart';
double a = -20.23826966605565;
double b = 57.49531422433988;

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

        primarySwatch: Colors.deepPurple,
      ),
      home: const MyHomePage(title: 'MyHomePage'),
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


//extracting data for location before creating the map
Future <List<Location>> getJsonFromThingspeaklocation() async {
  String url = "https://api.thingspeak.com/channels/1721182/fields/2.json?results=2";
  http.Response response = await http.get(Uri.parse(url));

  Map<String, dynamic> user = jsonDecode(response.body);

  List<Location> loc = [];
  for (var element in user['channel']){
    loc.add(Location.fromJson(element));
  }
  return loc;
}

//Implementation of class to map json (Arduino location) values to variables
class Location{
  Location(this.latitude, this.longitude);
  late String latitude;
  late String longitude;

  //mapping the jsonbody retrieved to the class objects (for location)
  factory Location.fromJson(Map<String, dynamic> parsedJson) {
    return Location(
        parsedJson['latitude'],
        parsedJson['longitude'],

    );
  }
}

/*var a = Location('latitude', 'longitude').latitude;
double b = double.parse(a);

var c = Location('latitude', 'longitude').longitude;
double d = double.parse(c);*/


class _MyHomePageState extends State<MyHomePage> {
  late GoogleMapController mapController;

  late LatLng _center = LatLng (a,b); //I had changed this from final to late

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

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
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.deepPurple,
              ),
              child: Text('Choose your preferred location', style: TextStyle(fontSize: 30, color: Colors.white),
              ),
            ),
            ListTile(
              title: const Text('Moka', style: TextStyle(fontSize: 20)),
              onTap: () {
                a = -20.23826966605565;
                b = 57.49531422433988;
                s ='https://api.thingspeak.com/channels/1721182/fields/2.json?results=7';
                // Update the state of the app.
                // ...
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const MyHomePage(title: 'MyHomePage');
                }));
              },
            ),
            ListTile(
              title: const Text('Flacq-Rivière du poste', style: TextStyle(fontSize: 20)),
              onTap: () {
                a = 45.521563;
                b = -122.677433;
                s ='https://api.thingspeak.com/channels/1721182/fields/2.json?results=2';
                // Update the state of the app.
                // ...
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const MyHomePage(title: 'MyHomePage');
                }));

              },
            ),
            ListTile(
              title: const Text('Flacq-Rivière Sèche', style: TextStyle(fontSize: 20)),
              onTap: () {
                a = 45.521563;
                b = -122.677433;
                s ='https://api.thingspeak.com/channels/1721182/fields/2.json?results=2';
                // Update the state of the app.
                // ...
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const MyHomePage(title: 'MyHomePage');
                }));

              },
            ),
            ListTile(
              title: const Text('Flacq', style: TextStyle(fontSize: 20)),
              onTap: () {
                a = 45.521563;
                b = -122.677433;
                s ='https://api.thingspeak.com/channels/1721182/fields/2.json?results=2';
                // Update the state of the app.
                // ...
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const MyHomePage(title: 'MyHomePage');
                }));

              },
            ),
            ListTile(
              title: const Text('Flacq', style: TextStyle(fontSize: 20)),
              onTap: () {
                a = 45.521563;
                b = -122.677433;
                s ='https://api.thingspeak.com/channels/1721182/fields/2.json?results=2';
                // Update the state of the app.
                // ...
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const MyHomePage(title: 'MyHomePage');
                }));

              },
            ),
            ListTile(
              title: const Text('Flacq', style: TextStyle(fontSize: 20)),
              onTap: () {
                a = 45.521563;
                b = -122.677433;
                s ='https://api.thingspeak.com/channels/1721182/fields/2.json?results=2';
                // Update the state of the app.
                // ...
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const MyHomePage(title: 'MyHomePage');
                }));

              },
            ),
            ListTile(
              title: const Text('Flacq', style: TextStyle(fontSize: 20)),
              onTap: () {
                a = 45.521563;
                b = -122.677433;
                s ='https://api.thingspeak.com/channels/1721182/fields/2.json?results=2';
                // Update the state of the app.
                // ...
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const MyHomePage(title: 'MyHomePage');
                }));

              },
            ),
            ListTile(
              title: const Text('Flacq', style: TextStyle(fontSize: 20)),
              onTap: () {
                a = 45.521563;
                b = -122.677433;
                s ='https://api.thingspeak.com/channels/1721182/fields/2.json?results=2';
                // Update the state of the app.
                // ...
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const MyHomePage(title: 'MyHomePage');
                }));

              },
            ),
          ],
        ),// Populate the Drawer in the next step.
      ),
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Text('Sensor location'),
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
        //adding stack that will contain the google map and other stuff
          child: Stack(
            children: [
              Align(
                  alignment: const AlignmentDirectional(0.05,-0.85),
                  //adding container that will be used for google map
                  child: Container(
                    width: 340,
                    height: 300,
                    decoration: const BoxDecoration(
                      color: Color(0xFFEEEEEE),
                    ),
                    //adding the google map with previously set coordinates
                    child: GoogleMap(
                      onMapCreated: _onMapCreated,
                      tiltGesturesEnabled: false,
                      initialCameraPosition: CameraPosition(
                        target: _center,
                        zoom: 15.0,
                        //To be set *IMPORTANT*
                      ),
                    ),
                  )
              ),
              //Inserting a container to contain the stack that will hold the text widget
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
                                      alignment: AlignmentDirectional(0.42, -0.40),
                                      child: Icon(Icons.analytics),
                                    ),
                                    Align(
                                      alignment: AlignmentDirectional(0,0.29),
                                      child: Text(
                                        'Click on the  \'analytics\' icon       in the top right corner of the app bar to view live chart for water level',
                                        style: TextStyle(fontSize: 20),

                                      ),
                                    ),

                                  ]
                              )
                          )
                      )
                  )
              ),
              Align(
                alignment: AlignmentDirectional(0, 0.92),
                child: Container(
                  width: 300,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Color(0xFFEEEEEE),
                  ),
                  child: Stack(
                    children: [
                      Align(
                        alignment: AlignmentDirectional(-1.1, 0.06),
                        child: Text(
                          '     SMS warning system signup>>>',
                          textAlign: TextAlign.start,
                          style: TextStyle(color: Colors.deepPurpleAccent, fontSize: 17),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0.96, 0.03),
                        child: Container(
                            height: 50,
                            padding: const EdgeInsets.fromLTRB(30, 0, 10, 0),
                            child: ElevatedButton(
                              child: const Text('Signup'),
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) {
                                  return const login();
                                }));
                              },
                            )
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )
      ),
    );
  }
  }