import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Text and Image Example'),
        ),
        body: Center(
          child: TextAndImageRow(),
        ),
      ),
    );
  }
}

class TextAndImageRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Container for the image
        Container(
          width: 50.0,
          height: 50.0,
          decoration: BoxDecoration(
            color: Colors.blue, // Change the color as needed
            borderRadius: BorderRadius.circular(8.0), // Adjust the border radius as needed
          ),
          // Add your image here, for example:
          child: Icon(
            Icons.image,
            color: Colors.white, // Change the color as needed
          ),
        ),
        // Spacer between text and image
        SizedBox(width: 10.0),
        // Flexible widget for the text (max 3 lines)
        Flexible(
          child: Text(
            'This is a multiline text. It can span up to 3 lines before it gets truncated. Adjust the content as needed.',
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
