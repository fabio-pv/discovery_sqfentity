import 'dart:convert';

import 'package:database_test/database/database_model.dart';
import 'package:database_test/models/category.dart';
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
        primarySwatch: Colors.blue,
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
  Future<void> _select() async {
    final categories = await Category().select().toJson();

    print(categories);
  }

  Future<void> _selectFilter() async {
    final categories = await Category().select().name.contains('Jo').toJson();

    print(categories);
  }

  Future<void> _save() async {
    Category.fromJson(
      jsonDecode('{"id": 1, "name": "Fábio", "lastName": "Silva"}'),
    ).save();
  }

  Future<void> _deleteAll() async {
    await CategoryDB().select().id.greaterThan(0).delete();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: _select,
              child: const Text('Select'),
            ),
            ElevatedButton(
              onPressed: _selectFilter,
              child: const Text('Select Filter'),
            ),
            ElevatedButton(
              onPressed: _save,
              child: const Text('Save'),
            ),
            ElevatedButton(
              onPressed: _deleteAll,
              child: const Text('Delete All'),
            ),
          ],
        ),
      ),
    );
  }
}
