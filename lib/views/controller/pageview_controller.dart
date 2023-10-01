import 'package:flutter/material.dart';

class PageControllerExample extends StatefulWidget {
  @override
  _PageControllerExampleState createState() => _PageControllerExampleState();
}

class _PageControllerExampleState extends State<PageControllerExample> {
 late PageController _pageController;
  int _currentPageIndex = 0;
  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentPageIndex);
  }
  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
  void _onPageChanged(int index) {
    setState(() {
      _currentPageIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PageController Example'),
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: _onPageChanged,
              children: [
                Container(
                  color: Colors.red,
                  child: Center(
                    child: Text('Page 1'),
                  ),
                ),
                Container(
                  color: Colors.green,
                  child: Center(
                    child: Text('Page 2'),
                  ),
                ),
                Container(
                  color: Colors.blue,
                  child: Center(
                    child: Text('Page 3'),
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  if (_currentPageIndex > 0) {
                    _pageController.previousPage(
                      duration: Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                    );
                  }
                },
              ),
              IconButton(
                icon: Icon(Icons.arrow_forward),
                onPressed: () {
                  if (_currentPageIndex < 2) {
                    _pageController.nextPage(
                      duration: Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                    );
                  }
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: PageControllerExample(),
  ));
}