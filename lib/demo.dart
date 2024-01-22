import 'package:flutter/material.dart';

import 'components/new_channel_container.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Text and Image Example'),
        ),
        body: Center(
          child: NewChannelContainer(),
        ),
      ),
    );
  }
}

