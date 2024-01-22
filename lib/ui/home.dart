import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:untitled/model/conversations.dart';

import '../components/list_tile.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 4,
      child: Scaffold(
        backgroundColor:Color(0xFF121b22),
        appBar: AppBar(
          title: const Text(
            'WhatsApp',
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          backgroundColor: const Color(0xFF1f2c34),
          actions:  [
          SvgPicture.asset('asset/svg/Search.svg'
          ),
            const SizedBox(width: 25),
            SvgPicture.asset('asset/svg/Group 42.svg'
            ),
            const SizedBox(width: 15),
          ],
          iconTheme: const IconThemeData(color: Colors.white),
          bottom: const TabBar(
              labelStyle: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w900,
                  color: Color(0xFF00a884)),
              unselectedLabelStyle: TextStyle(
                color:
                    Color(0xFF849098) // Set the permanent color for unselected tabs
              ),
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorColor: Color(0xFF00a884),
              indicatorWeight: 3,
              tabs: [
                Tab(icon: Icon(Icons.camera_alt_outlined)),
                Tab(child: Row(
                  children: [
                    Text('Chats'),
                    SizedBox(width: 8),
                    CircleAvatar(
                      radius: 10,
                      backgroundColor: const Color(0xFF00a884),
                      child: Center(
                          child: Text(
                            '2',
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 13),
                          )),
                    )
                  ],
                )),
                Tab(text: "Updates"),
                Tab(text: "Calls"),
              ]),
        ),
        body: TabBarView(
          children: [
            const Center(child: Text('Content for Tab 1',style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white))),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: ListView.builder(
                  itemCount: listData.length,
                  itemBuilder: (BuildContext context, int index) {
                    // Build and return the widget for the given index
                    return ListTileHome(
                      url: listData[index].url,
                      label: listData[index].title,
                      subLabel: listData[index].subtitle,
                      time: listData[index].time,
                      count: listData[index].count,
                    );
                  }),
            ),
            const Center(child: Text('Content for Tab 3',style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white))),
            const Center(child: Text('Content for Tab 4',style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white))),
          ],
        ),
      ),
    );
  }

  List<CustomListItem> listData = [
    CustomListItem(
        title: 'Talha Arshad',
        subtitle: 'Announcement Mid Journey',
        time: '2:15 am',
        count: '2',
        url:
        'https://images.pexels.com/photos/1704488/pexels-photo-1704488.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
    CustomListItem(
        title: 'Abdullah',
        subtitle: 'Hello how are you',
        time: '10:10 am',
        count: '4',
        url:'https://images.pexels.com/photos/415829/pexels-photo-415829.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
    CustomListItem(
        title: 'Ali Raza',
        subtitle: "We will manage,you don't worry",
        time: '7:45 am',
        count: '7',
        url:'https://images.pexels.com/photos/1310522/pexels-photo-1310522.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
    CustomListItem(
        title: 'Rashid Saleem',
        subtitle: 'Yes i have it',
        time: '11:11 pm',
        count: '12',
        url:'https://images.pexels.com/photos/1043471/pexels-photo-1043471.jpeg?auto=compress&cs=tinysrgb&w=600'),
    CustomListItem(
        title: 'Afzal Azeem',
        subtitle: 'Lorem ipsum',
        time: '1:10 am',
        count: '10',
        url:'https://images.pexels.com/photos/34534/people-peoples-homeless-male.jpg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
    CustomListItem(
        title: 'Noman Sarwar',
        subtitle: 'Do it please',
        time: '8:30 am',
        count: '99',
        url:'https://images.pexels.com/photos/697509/pexels-photo-697509.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
    CustomListItem(
        title: 'Talha Arshad',
        subtitle: 'Announcement Mid Journey',
        time: '2:15 am',
        count: '2',
        url:
        'https://images.pexels.com/photos/1704488/pexels-photo-1704488.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
    CustomListItem(
        title: 'Abdullah',
        subtitle: 'Hello how are you',
        time: '10:10 am',
        count: '4',
        url:'https://images.pexels.com/photos/415829/pexels-photo-415829.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
    CustomListItem(
        title: 'Ali Raza',
        subtitle: "We will manage,you don't worry",
        time: '7:45 am',
        count: '7',
        url:'https://images.pexels.com/photos/1310522/pexels-photo-1310522.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
    CustomListItem(
        title: 'Rashid Saleem',
        subtitle: 'Yes i have it',
        time: '11:11 pm',
        count: '12',
        url:'https://images.pexels.com/photos/1043471/pexels-photo-1043471.jpeg?auto=compress&cs=tinysrgb&w=600'),
    CustomListItem(
        title: 'Afzal Azeem',
        subtitle: 'Lorem ipsum',
        time: '1:10 am',
        count: '10',
        url:'https://images.pexels.com/photos/34534/people-peoples-homeless-male.jpg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
    CustomListItem(
        title: 'Noman Sarwar',
        subtitle: 'Do it please',
        time: '8:30 am',
        count: '99',
        url:'https://images.pexels.com/photos/697509/pexels-photo-697509.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
    CustomListItem(
        title: 'Talha Arshad',
        subtitle: 'Announcement Mid Journey',
        time: '2:15 am',
        count: '2',
        url:
        'https://images.pexels.com/photos/1704488/pexels-photo-1704488.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
    CustomListItem(
        title: 'Abdullah',
        subtitle: 'Hello how are you',
        time: '10:10 am',
        count: '4',
        url:'https://images.pexels.com/photos/415829/pexels-photo-415829.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
    CustomListItem(
        title: 'Ali Raza',
        subtitle: "We will manage,you don't worry",
        time: '7:45 am',
        count: '7',
        url:'https://images.pexels.com/photos/1310522/pexels-photo-1310522.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
    CustomListItem(
        title: 'Rashid Saleem',
        subtitle: 'Yes i have it',
        time: '11:11 pm',
        count: '12',
        url:'https://images.pexels.com/photos/1043471/pexels-photo-1043471.jpeg?auto=compress&cs=tinysrgb&w=600'),
    CustomListItem(
        title: 'Afzal Azeem',
        subtitle: 'Lorem ipsum',
        time: '1:10 am',
        count: '10',
        url:'https://images.pexels.com/photos/34534/people-peoples-homeless-male.jpg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
    CustomListItem(
        title: 'Noman Sarwar',
        subtitle: 'Do it please',
        time: '8:30 am',
        count: '99',
        url:'https://images.pexels.com/photos/697509/pexels-photo-697509.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
  ];
}
