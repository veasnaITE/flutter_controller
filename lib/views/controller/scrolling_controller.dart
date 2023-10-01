import 'package:flutter/material.dart';

class ScrollControllerExample extends StatefulWidget {
  @override
  _ScrollControllerExampleState createState() => _ScrollControllerExampleState();
}

class _ScrollControllerExampleState extends State<ScrollControllerExample> {
  ScrollController _scrollController = ScrollController();
  bool _showButton = false;
  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }
  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }
  void _scrollListener() {
    if (_scrollController.offset >= 200 && !_scrollController.position.outOfRange) {
      setState(() {
        _showButton = true;
      });
    } else {
      setState(() {
        _showButton = false;
      });
    }
  }
  void _scrollToTop() {
    _scrollController.animateTo(
      0,
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ScrollController Example'),
      ),
      body: ListView.builder(
        controller: _scrollController,
        itemCount: 100,
        itemBuilder: (context, index) => ListTile(
          title: Text('Item $index'),
        ),
      ),
      floatingActionButton: _showButton
          ? FloatingActionButton(
        onPressed: _scrollToTop,
        child: Icon(Icons.arrow_upward),
      )
          : null,
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: ScrollControllerExample(),
  ));
}