import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScrenn extends StatelessWidget {
  final message = "hello I'm from homescreen";
  const HomeScrenn({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 200,),
            const Text("home page"),
            ElevatedButton(onPressed:(){
              Navigator.pushNamed(context, '/details');
            }, child: const Text("DetailPage"))
          ],
        ),
      ),
    );
  }
}
