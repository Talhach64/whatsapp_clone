import 'package:flutter/material.dart';


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('ListView.separated Example'),
        ),
        body: MyListView(),
      ),
    );
  }
}

class MyListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 10, // Number of items in the list
      itemBuilder: (BuildContext context, int index) {
        // Builder for each item
        return ListTile(
          title: Text('Item $index'),
          tileColor: index % 2 == 0 ? Colors.lightBlue : Colors.grey,
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        // Builder for each separator
        return Container(
          height: 2.0,

        );
      },
    );
  }
}
