import 'package:flutter/material.dart';

void main() {
  runApp(const File1App());
}

class File1App extends StatelessWidget {
  const File1App({super.key});

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
      home: const File1Screen(),
    );
  }
}

class File1Screen extends StatefulWidget {
  const File1Screen({super.key});

  @override
  _File1ScreenState createState() => _File1ScreenState();
}

class _File1ScreenState extends State<File1Screen> {
  final TextEditingController _controllerA = TextEditingController();
  final TextEditingController _controllerB = TextEditingController();
  String? _errorText;

  bool _isNumeric(String str) {
    return double.tryParse(str) != null;
  }

  void _validateInput() {
    setState(() {
      _errorText = (!_isNumeric(_controllerA.text) || !_isNumeric(_controllerB.text))
          ? 'Vui lòng nhập số hợp lệ!'
          : null;
    });
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
              decoration: InputDecoration(
                labelText: 'Nhập số A',
                errorText: _isNumeric(_controllerA.text) ? null : _errorText,
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _controllerB,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Nhập số B',
                errorText: _isNumeric(_controllerB.text) ? null : _errorText,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _validateInput,
              child: const Text('Xác nhận'),
            ),
          ],
        ),
      ),
    );
  }
}
