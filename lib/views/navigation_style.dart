import 'package:flutter/material.dart';

void main() {
  runApp(BottomNavigationBarExampleState());
}

class BottomNavigationBarExampleState extends StatefulWidget {
  const BottomNavigationBarExampleState({Key? key}) : super(key: key);

  @override
  _BottomNavigationBarExampleStateState createState() =>
      _BottomNavigationBarExampleStateState();
}

class _BottomNavigationBarExampleStateState
    extends State<BottomNavigationBarExampleState> {
  int _currentIndex = 0;

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bottom Navigation Bar Example',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Bottom Navigation Bar Example'),
        ),
        body: Center(
          child: Text('Selected Tab: $_currentIndex'),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: _onTabTapped,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
