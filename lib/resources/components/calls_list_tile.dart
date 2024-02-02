import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CreateCallLink extends StatelessWidget {
  const CreateCallLink({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 12),
        ListTile(
          leading: CircleAvatar(
            backgroundColor: const Color(0xFF00a984),
            radius: 30,
            child: SvgPicture.asset('asset/svg/share.svg'),
          ),
          title: const Text(
            "Create call link",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
          subtitle: const Text(
            'Share a link for your WhatsApp call',
            style: TextStyle(color: Color(0xFF849098)),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 20.0, top: 8, bottom: 8),
          child: Text(
            'Recent',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
      ],
    );
  }
}

class CallsListTile extends StatelessWidget {
  final String label, subLabel;
  final Widget icon;
  final ImageProvider image;

  const CallsListTile(
      {super.key,
      required this.label,
      required this.image,
      required this.subLabel,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3.0),
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          foregroundImage: image,
        ),
        title: Text(
          label,
          style:
              const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        subtitle: Row(
          children: [
            SizedBox(child: icon),
            const SizedBox(width: 8),
            Text(
              subLabel,
              style: const TextStyle(color: Color(0xFF849098)),
            ),
          ],
        ),
        trailing: const Icon(Icons.phone, color: Color(0xFF00a984)),
      ),
    );
  }
}
