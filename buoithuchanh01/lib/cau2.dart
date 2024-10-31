import 'package:flutter/material.dart';

void main() {
  runApp(const File2App());
}

class File2App extends StatelessWidget {
  const File2App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Buổi thực hành 01',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF6112E7)),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF6112E7),
          titleTextStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
      home: const File2Screen(),
    );
  }
}

class File2Screen extends StatefulWidget {
  const File2Screen({super.key});

  @override
  _File2ScreenState createState() => _File2ScreenState();
}

class _File2ScreenState extends State<File2Screen> {
  final TextEditingController _controllerA = TextEditingController();
  final TextEditingController _controllerB = TextEditingController();
  String? _result;

  bool _isNumeric(String str) {
    return double.tryParse(str) != null;
  }

  void _calculate(String operation) {
    if (_isNumeric(_controllerA.text) && _isNumeric(_controllerB.text)) {
      double a = double.parse(_controllerA.text);
      double b = double.parse(_controllerB.text);
      double? result;
      switch (operation) {
        case '+':
          result = a + b;
          break;
        case '-':
          result = a - b;
          break;
        case '*':
          result = a * b;
          break;
        case '/':
          result = b != 0 ? a / b : double.nan;
          break;
      }
      setState(() {
        _result = 'Kết quả: $result';
      });
    } else {
      setState(() {
        _result = 'Vui lòng nhập số hợp lệ!';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Buổi thực hành 01')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _controllerA,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Nhập số A'),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _controllerB,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Nhập số B'),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(onPressed: () => _calculate('+'), child: const Text('+')),
                ElevatedButton(onPressed: () => _calculate('-'), child: const Text('-')),
                ElevatedButton(onPressed: () => _calculate('*'), child: const Text('*')),
                ElevatedButton(onPressed: () => _calculate('/'), child: const Text('/')),
              ],
            ),
            const SizedBox(height: 20),
            if (_result != null) Text(_result!),
          ],
        ),
      ),
    );
  }
}
