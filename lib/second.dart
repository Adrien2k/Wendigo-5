import 'dart:convert';  //Imports package to convert to different data representation format form the json file
import 'package:flutter/material.dart'; //base package for constructing app
//The import code below for the syncfusion package might be flagged as
//unused if ever written before using it in the code of the body.
import 'package:syncfusion_flutter_charts/charts.dart'; //syncfusion chart package to implement charts in the app
import 'package:http/http.dart' as http; // This package contains a set of high-level functions and classes that make it easy to consume HTTP resources.
String s ='https://api.thingspeak.com/channels/1721182/feeds.json?api_key=MQFPBQZ78M4E1F4T&results=3';

class SecondPage extends StatefulWidget {                                    //
  const SecondPage({Key? key, required this.title}) : super(key: key);       // Those lines are for creating the page
  final String title;                                                        //

  @override
  State<SecondPage> createState() => _SecondPageState();
}


class _SecondPageState extends State<SecondPage> {

  @override
  void initState()
  {
    loadArduinoData();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.

    return Scaffold(

      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Text('Live Monitoring'),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.

        //Addition of scaffold as child below so that I can add the sfcartesianChart which will be used to build the graph
        child: FutureBuilder(
            future: getJsonFromThingspeakRestAPI(),
            builder: (context, snapShot) {
              if (snapShot.hasData) {
                //The body makes use of the sfcartesian chart and we will implement and customize it below

                return SfCartesianChart(
                  primaryXAxis: CategoryAxis(),
                  title: ChartTitle(text: 'Water level'), // title of chart
                  plotAreaBackgroundColor: Colors.white30, //plot area colour
                  borderColor: Colors.white, //bordercolour of the graph
                  borderWidth: 10,
                  series: <ChartSeries<ArduinoData, String>>[
                    LineSeries<ArduinoData, String>(dataSource: chartData,
                        //Line 57 below will implement the data into the graph
                        xValueMapper: (ArduinoData data, _) => data.created_at,
                        yValueMapper: (ArduinoData data, _) => data.field1)
                  ],
                );
              } else {
                return Card(
                    elevation: 5.0,
                    child: Container(
                        height: 100,
                        width: 400,
                        child:Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text('Retrieving water level data...',
                                style: TextStyle(fontSize: 20.0)),
                            Container(
                              height: 40,
                              width: 40,
                              child: CircularProgressIndicator(
                                semanticsLabel: 'Retrieving data',
                                valueColor: AlwaysStoppedAnimation<Color>(
                                    Colors.purpleAccent),
                                backgroundColor: Colors.grey[300],
                              ),
                            )
                          ],
                        )
                    )

                );

              }

            }),
      ),
    );
  }


  //This code below is to set the data source to the chart
  List<ArduinoData> chartData = [];
  Future loadArduinoData () async {
    List<ArduinoData> jsonString = await getJsonFromThingspeakRestAPI();

    setState(() {
      chartData = jsonString;
      }
    );
  }
}

//Retrieving raw data from the Json
Future <List<ArduinoData>> getJsonFromThingspeakRestAPI() async {
  String url = s;
  http.Response response = await http.get(Uri.parse(url));

  Map<String, dynamic> user = jsonDecode(response.body);

  List<ArduinoData> data = [];
  for (var element in user['feeds']){
    data.add(ArduinoData.fromJson(element));
  }
  return data;
}



//Creating a new class to implement a line chart
class ArduinoData{
  ArduinoData(this.created_at, this.field1);
  final String created_at;
  final int field1;

  //mapping the jsonbody retrieved to the class objects
  factory ArduinoData.fromJson(Map<String, dynamic> parsedJson) {
    return ArduinoData(
      parsedJson['created_at'],
      int.parse(parsedJson['field1']),
    );
  }
}

