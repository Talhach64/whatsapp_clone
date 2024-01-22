import 'package:flutter/material.dart';

class NewChannelContainer extends StatelessWidget {
  const NewChannelContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      width: 110,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),border: Border.all(width: 1,color: Color(0xFF1a232a))),
      child:  Column(
        children: [
          SizedBox(height: 10),

          Stack(children: [
            CircleAvatar(
              radius: 30,
              foregroundImage: NetworkImage(
                  'https://images.pexels.com/photos/1704488/pexels-photo-1704488.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
            ),
            Positioned(
                bottom: 0,
                right: 0,
                child: CircleAvatar(
                  backgroundColor: Color(0xFF00a884),
                  radius: 12,
                  child: Center(
                      child: Icon(
                    Icons.check,
                    color: Colors.white,
                  )),
                ))
          ]),
          SizedBox(height: 7),
          Text(
            'WhatsApp',
            style: TextStyle(color: Colors.white, fontSize: 12,fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 7),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Container(
              width: double.infinity,
              height: 22,
              decoration: BoxDecoration(
                  color: Color(0xFF0e3031), borderRadius: BorderRadius.circular(15)),
              child:   Center(
                child: Text(
                  'Follow',
                  style: TextStyle(color: Color(0xFFcff4e7), fontSize: 12,fontWeight: FontWeight.bold),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
