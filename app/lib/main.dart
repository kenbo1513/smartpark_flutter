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

class SmartParkHome extends StatefulWidget {
  const SmartParkHome({super.key});

  @override
  State<SmartParkHome> createState() => _SmartParkHomeState();
}

class _SmartParkHomeState extends State<SmartParkHome> {
  final _plateController = TextEditingController();
  String? _resultText;

  @override
  void dispose() {
    _plateController.dispose();
    super.dispose();
  }

  void _searchParking() {
    final plate = _plateController.text.trim();

    if (plate.isEmpty) {
      setState(() => _resultText = "車両ナンバーを入力してください");
      return;
    }

    // いまはダミー（後でAPIに置き換える）
    setState(() {
      _resultText = "車両ナンバー：$plate\n入庫時刻：12:40\n現在料金：¥800";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SmartPark Clone"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              "車両ナンバー",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _plateController,
              textInputAction: TextInputAction.search,
              onSubmitted: (_) => _searchParking(),
              decoration: const InputDecoration(
                hintText: "例）品川 300 あ 12-34",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: 48,
              child: ElevatedButton(
                onPressed: _searchParking,
                child: const Text("入庫情報を取得"),
              ),
            ),
            const SizedBox(height: 16),
            if (_resultText != null)
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black12),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  _resultText!,
                  style: const TextStyle(fontSize: 16),
                ),
              ),
          ],
        ),
      ),
    );
  }
}