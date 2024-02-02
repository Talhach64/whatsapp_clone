import 'package:flutter/material.dart';

class ListTileHome extends StatelessWidget {
  final String url, label, subLabel, time, count;

  const ListTileHome(
      {super.key,
      required this.label,
      required this.subLabel,
      required this.time,
      required this.count,
      required this.url});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 25,
        foregroundImage: NetworkImage(url),
      ),
      title: Text(
        label,
        style:
            const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
      ),
      subtitle: Text(subLabel,
          style: const TextStyle(
              fontWeight: FontWeight.bold, color: Color(0xFF849098))),
      trailing: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              time,
              style: const TextStyle(
                  fontWeight: FontWeight.bold, color: Color(0xFF00a884)),
            ),
            const SizedBox(height: 3),
            CircleAvatar(
              radius: 10,
              backgroundColor: const Color(0xFF00a884),
              child: Center(
                  child: Text(
                count,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 13),
              )),
            )
          ],
        ),
      ),
    );
  }
}
