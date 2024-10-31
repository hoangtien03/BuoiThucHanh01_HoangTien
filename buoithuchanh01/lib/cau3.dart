import 'package:flutter/material.dart';

void main() {
  runApp(const File3App());
}

class File3App extends StatelessWidget {
  const File3App({super.key});

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
      home: const File3Screen(),
    );
  }
}

class File3Screen extends StatefulWidget {
  const File3Screen({super.key});

  @override
  _File3ScreenState createState() => _File3ScreenState();
}

class _File3ScreenState extends State<File3Screen> {
  final TextEditingController _controller = TextEditingController();

  bool _isPrime(int n) {
    if (n <= 1) return false;
    for (int i = 2; i <= n ~/ 2; i++) {
      if (n % i == 0) return false;
    }
    return true;
  }

  void _checkPrime() {
    final input = _controller.text;
    if (int.tryParse(input) == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Vui lòng nhập một số nguyên hợp lệ!')),
      );
    } else {
      final number = int.parse(input);
      final message = _isPrime(number) ? '$number là số nguyên tố.' : '$number không phải là số nguyên tố.';
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
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
              controller: _controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Nhập số n'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _checkPrime,
              child: const Text('Kiểm tra số nguyên tố'),
            ),
          ],
        ),
      ),
    );
  }
}
