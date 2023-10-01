import 'package:flutter/material.dart';

class AnimationControllerExample extends StatefulWidget {
  @override
  _AnimationControllerExampleState createState() =>
      _AnimationControllerExampleState();
}
class _AnimationControllerExampleState extends State<AnimationControllerExample>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    _animationController.addListener(() {
      setState(() {});
    });
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _animationController.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _animationController.forward();
      }
    });
    _animationController.forward();
  }
  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AnimationController Example'),
      ),
      body: Center(
        child: Container(
          width: _animationController.value * 200,
          height: _animationController.value * 200,
          color: Colors.blue,
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: AnimationControllerExample(),
  ));
}