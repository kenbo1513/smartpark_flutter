import 'package:flutter/material.dart';

void main() {
  runApp(const SmartParkApp());
}

class SmartParkApp extends StatelessWidget {
  const SmartParkApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SmartParkHome(),
    );
  }
}

class SmartParkHome extends StatelessWidget {
  const SmartParkHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SmartPark Clone"),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          "車両ナンバーを入力してください",
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
