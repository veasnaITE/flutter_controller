import 'package:flutter/material.dart';

class MyPage extends StatefulWidget {
  @override
  _MyPageState createState() => _MyPageState();
}
class _MyPageState extends State<MyPage> {
  TextEditingController _controller = TextEditingController();
  String name ="";
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Text Editing Controller Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(name),
            Padding(
              padding: EdgeInsets.all(10),
              child: TextField(
                controller: _controller,
                decoration: const InputDecoration(
                  labelText: 'Enter name',
                ),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  name=_controller.text;
                });
              },
              child: const Text('Print name'),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: MyPage(),
  ));
}