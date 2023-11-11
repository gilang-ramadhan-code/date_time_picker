import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DateTime? dateTimeNow = DateTime.now(), dateTimeTomorrow, picked_date;

  var year, month, day;

  TimeOfDay? picked_time, selectedTime = TimeOfDay.now();

  Future<Null> getDate(BuildContext context) async {
    picked_date = await showDatePicker(
        context: context,
        initialDate: dateTimeNow!,
        firstDate: DateTime(dateTimeNow!.year - 1),
        lastDate: DateTime(dateTimeNow!.year + 1));

    if (picked_date != null && picked_date != dateTimeNow) {
      setState(() {
        dateTimeNow = picked_date;
      });
    }
  }

  Future<Null> getTime(BuildContext context) async {
    picked_time =
        await showTimePicker(context: context, initialTime: selectedTime!);

    if (picked_time != null && picked_time != selectedTime) {
      setState(() {
        selectedTime = picked_time;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(children: <Widget>[
            MaterialButton(
              onPressed: () {
                getDate(context);
              },
              child: Text("Test Date Picker"),
            ),
            MaterialButton(
              onPressed: () {
                getTime(context);
              },
              child: Text("Test Time Picker"),
            ),
            Text("${dateTimeNow.toString().substring(0, 10)}"),
            Text("${selectedTime.toString().substring(10, 15)}")
          ]),
        ));
  }
}
