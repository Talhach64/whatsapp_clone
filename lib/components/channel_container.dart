import 'package:flutter/material.dart';

class ChannelContainer extends StatelessWidget {
  const ChannelContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 8),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            children: [
              CircleAvatar(
                foregroundImage: NetworkImage(
                    'https://images.pexels.com/photos/1704488/pexels-photo-1704488.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
                radius: 20,
              ),
              SizedBox(width: 8),
              Text(
                'Two brothers solar energy company',
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.only(right: 25, left: 22),
          child: Row(
            children: [
              Flexible(
                child: Text(
                  'This is a multiline text. It can span up to 3 lines before it gets truncated. Adjust the content as needed.',
                  style: TextStyle(color: Colors.grey.shade600),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Container(
                width: 50.0,
                height: 50.0,
                decoration: BoxDecoration(
                  color: Colors.blue, // Change the color as needed
                  borderRadius: BorderRadius.circular(
                      8.0), // Adjust the border radius as needed
                ),
                // Add your image here, for example:
                child: const Icon(
                  Icons.image,
                  color: Colors.white, // Change the color as needed
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 3),
        Padding(
          padding: const EdgeInsets.only(left: 22.0),
          child: Text(
            '1/11/24',
            style: TextStyle(color: Colors.grey.shade600),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        const Divider(
          indent: 18,
          endIndent: 25,
        ),
      ],
    );
  }
}
