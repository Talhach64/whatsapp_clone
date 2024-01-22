import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Synchronized ListViews'),
        ),
        body: SynchronizedListViews(),
      ),
    );
  }
}

class SynchronizedListViews extends StatefulWidget {
  @override
  _SynchronizedListViewsState createState() => _SynchronizedListViewsState();
}

class _SynchronizedListViewsState extends State<SynchronizedListViews> {
  // Create a ScrollController to control the scroll position
  ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // First ListView
        Container(
          height: 70,
          width: 150,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            controller: _controller,
            itemCount: 20,
            itemBuilder: (context, index) {
              return Container(
                width: 70,
                height: 70,
                color: Colors.blue,
                alignment: Alignment.center,
                child: Text('Item $index'),
              );
            },
          ),
        ),
        // Spacer between ListViews
        SizedBox(width: 10),
        // Second ListView
        Container(
          height: 70,
          width: 150,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            controller: _controller,
            itemCount: 20,
            itemBuilder: (context, index) {
              return Container(
                width: 70,
                height: 70,
                color: Colors.green,
                alignment: Alignment.center,
                child: Text('Item $index'),
              );
            },
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    // Dispose the ScrollController when the widget is disposed
    _controller.dispose();
    super.dispose();
  }
}
