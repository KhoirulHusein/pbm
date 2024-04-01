import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'poor',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: Colors.green[900],
        ),
        backgroundColor: Colors.green,
        body: const Center(
          child: Image(
            image: AssetImage('images/kentang.png'),
          ),
        ),
      ),
    ),
  );
}
