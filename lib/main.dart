import 'package:flutter/material.dart';
import 'package:training_app/cards/people_detail_card.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

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

class PeopleModel {
  final String name;
  final String designation;
  final String imageURL;
  final String time;
  PeopleModel(
      {required this.name,
      required this.designation,
      required this.imageURL,
      required this.time});
  factory PeopleModel.fromJson(Map<String, dynamic> json) {
    return PeopleModel(
      name: json['name'],
      designation: json['designation'],
      imageURL: json['imageUrl'],
      time: json['timestamp'],
    );
  }
}

Future<List<PeopleModel>> fetchPeople() async {
  final response = await http.get(
      Uri.parse('https://mocki.io/v1/4dba0e04-1939-4386-b239-a7e887010885'));
  if (response.statusCode == 200) {
    List<dynamic> people = json.decode(response.body);
    return people.map((e) => PeopleModel.fromJson(e)).toList();
  } else {
    throw Exception('Failed to load People');
  }
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: FutureBuilder(
          future: fetchPeople(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    PeopleModel people = snapshot.data![index];
                    return PeopleDetailsCard(
                      name: people.name,
                      designation: people.designation,
                      imageURL: people.imageURL,
                      time: people.time,
                    );
                  });
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}
