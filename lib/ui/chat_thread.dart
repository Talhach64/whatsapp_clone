import 'dart:math';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';
import 'package:untitled/components/calls_list_tile.dart';
import 'package:untitled/model/conversations.dart';

import '../components/channel_container.dart';
import '../components/list_tile.dart';
import '../components/new_channel_container.dart';

class ChatThread extends StatefulWidget {
  const ChatThread({super.key});

  @override
  State<ChatThread> createState() => _ChatThreadState();
}

class _ChatThreadState extends State<ChatThread> {
  ScrollController _controller1 = ScrollController();
  ScrollController _controller2 = ScrollController();

  @override
  void initState() {
    super.initState();
    _controller1.addListener(_scrollListener);
    _controller2.addListener(_scrollListener);
  }

  void _scrollListener() {
    if (_controller1.position.userScrollDirection == ScrollDirection.forward ||
        _controller1.position.userScrollDirection == ScrollDirection.reverse) {
      _controller2.jumpTo(_controller1.position.pixels);
    } else if (_controller2.position.userScrollDirection ==
            ScrollDirection.forward ||
        _controller2.position.userScrollDirection == ScrollDirection.reverse) {
      _controller1.jumpTo(_controller2.position.pixels);
    }
  }

  @override
  void dispose() {
    _controller1.dispose();
    _controller2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 4,
      child: Scaffold(
        backgroundColor: const Color(0xFF121b22),
        appBar: AppBar(
          title: const Text(
            'WhatsApp',
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          backgroundColor: const Color(0xFF1f2c34),
          actions: [
            const Icon((Icons.camera_alt_outlined)),
            const SizedBox(width: 25),
            SvgPicture.asset('asset/svg/Search.svg'),
            const SizedBox(width: 25),
            SvgPicture.asset('asset/svg/Group 42.svg'),
            const SizedBox(width: 15),
          ],
          iconTheme: const IconThemeData(color: Colors.white),
          bottom: const TabBar(
              labelStyle: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w900,
                  color: Color(0xFF00a884)),
              unselectedLabelStyle: TextStyle(
                  color: Color(
                      0xFF849098) // Set the permanent color for unselected tabs
                  ),
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorColor: Color(0xFF00a884),
              indicatorWeight: 3,
              tabs: [
                Tab(icon: Icon(Icons.groups_rounded)),
                Tab(
                  child: Row(
                    children: [
                      Text('Chats'),
                      SizedBox(width: 8),
                      CircleAvatar(
                        radius: 10,
                        backgroundColor: Color(0xFF00a884),
                        child: Center(
                          child: Text(
                            '2',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 13),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Tab(text: "Updates"),
                Tab(text: "Calls"),
              ]),
        ),
        body: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height -
                    AppBar().preferredSize.height -
                    40),
            child: TabBarView(
              children: [
                const Center(
                    child: Text('Content for Tab 1',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white))),
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
                Column(
                  children: [
                    const SizedBox(height: 10),
                    ListTile(
                      leading: const Text(
                        "Status",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 18),
                      ),
                      trailing: Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: SvgPicture.asset('asset/svg/Group 42.svg'),
                      ),
                    ),
                    SizedBox(
                      height: 60,
                      child: ListView.builder(
                        itemCount: listData.length,
                        controller: _controller1,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          if (index == 0) {
                            return Stack(children: [
                              CircleAvatar(
                                radius: 45,
                                foregroundImage:
                                    NetworkImage(listData[index].url),
                              ),
                              const Positioned(
                                  bottom: 0,
                                  right: 10,
                                  child: CircleAvatar(
                                    backgroundColor: Color(0xFF00a884),
                                    radius: 12,
                                    child: Center(
                                        child: Icon(
                                      Icons.add_rounded,
                                      color: Colors.white,
                                    )),
                                  ))
                            ]);
                          } else {
                            // Normal avatar for the rest of the indices
                            return DottedBorder(
                              color: const Color(0xFF00a884),
                              borderType: BorderType.Circle,
                              radius: const Radius.circular(27),
                              dashPattern: [
                                (2 * pi * 27) / listData[index].dash,
                                listData[index].space
                              ],
                              strokeWidth: 3,
                              child: CircleAvatar(
                                radius: 35,
                                foregroundImage:
                                    NetworkImage(listData[index].url),
                              ),
                            );
                          }
                        },
                      ),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      height: 30,
                      child: ListView.builder(
                        controller: _controller2,
                        itemCount: listData.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          if (index == 0) {
                            return const Padding(
                              padding: EdgeInsets.only(left: 18.0, right: 15),
                              child: Text(
                                'My status',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12),
                              ),
                            );
                          } else {
                            // Normal avatar for the rest of the indices
                            return const Padding(
                              padding: EdgeInsets.only(left: 12.0, right: 7),
                              child: Text('My status',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12)),
                            );
                          }
                        },
                      ),
                    ),
                    const Divider(
                      height: 2,
                    ),
                    const SizedBox(height: 6),
                    const ListTile(
                      leading: Text(
                        "Channels",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 18),
                      ),
                      trailing: Icon(
                        Icons.add_rounded,
                        color: Colors.white,
                      ),
                    ),
                    const ChannelContainer(),
                    const ChannelContainer(),
                    ListTile(
                      leading: const Text(
                        "Find channels",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 18),
                      ),
                      trailing: Container(
                        // color: Colors.red,
                        height: 30,
                        width: 80,
                        child: const Row(
                          children: [
                            Text(
                              'See all',
                              style: TextStyle(
                                  color: Color(0xFF00a884), fontSize: 13),
                            ),
                            SizedBox(width: 6),
                            Icon(Icons.arrow_forward_ios_rounded,
                                color: Color(0xFF00a884)),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: SizedBox(
                        height: 140,
                        width: double.infinity,
                        child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (ctx, i) {
                              return const NewChannelContainer();
                            },
                            separatorBuilder: (ctx, i) {
                              return const SizedBox(width: 10);
                            },
                            itemCount: 10),
                      ),
                    )
                  ],
                ),
                ListView.builder(
                    itemCount: listData.length,
                    itemBuilder: (context, index) {
                      if (index == 0) {
                        return const CreateCallLink();
                      } else {
                        return CallsListTile(
                          image: NetworkImage(listData[index - 1].url),
                          label: listData[index - 1].title,
                          subLabel: 'Yesterday, ${listData[index - 1].time}',
                          icon: listData[index - 1].call
                              ? const Icon(
                                  Icons.call_received_outlined,
                                  color: Colors.green,
                                  size: 18,
                                )
                              : const Icon(
                                  Icons.call_made_outlined,
                                  color: Colors.red,
                                  size: 18,
                                ),
                        );
                      }
                    }),
              ],
            ),
          ),
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
        call: true,
        dash: 3,
        space: 4.5,
        url:
            'https://images.pexels.com/photos/1704488/pexels-photo-1704488.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
    CustomListItem(
        title: 'Abdullah',
        subtitle: 'Hello how are you',
        call: true,
        time: '10:10 am',
        dash: 1,
        space: 0,
        count: '4',
        url:
            'https://images.pexels.com/photos/415829/pexels-photo-415829.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
    CustomListItem(
        title: 'Ali Raza',
        subtitle: "We will manage,you don't worry",
        time: '7:45 am',
        call: true,
        count: '7',
        dash: 5,
        space: 2.5,
        url:
            'https://images.pexels.com/photos/1310522/pexels-photo-1310522.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
    CustomListItem(
        title: 'Rashid Saleem',
        subtitle: 'Yes i have it',
        time: '11:11 pm',
        call: false,
        count: '12',
        dash: 2,
        space: 3.5,
        url:
            'https://images.pexels.com/photos/1043471/pexels-photo-1043471.jpeg?auto=compress&cs=tinysrgb&w=600'),
    CustomListItem(
        title: 'Afzal Azeem',
        subtitle: 'Lorem ipsum',
        time: '1:10 am',
        call: false,
        count: '10',
        dash: 4,
        space: 3,
        url:
            'https://images.pexels.com/photos/34534/people-peoples-homeless-male.jpg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
    CustomListItem(
        title: 'Noman Sarwar',
        subtitle: 'Do it please',
        call: true,
        time: '8:30 am',
        count: '99',
        dash: 1,
        space: 0,
        url:
            'https://images.pexels.com/photos/697509/pexels-photo-697509.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
    CustomListItem(
        title: 'Talha Arshad',
        subtitle: 'Announcement Mid Journey',
        time: '2:15 am',
        count: '2',
        call: true,
        dash: 3,
        space: 4.5,
        url:
            'https://images.pexels.com/photos/1704488/pexels-photo-1704488.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
    CustomListItem(
        title: 'Abdullah',
        subtitle: 'Hello how are you',
        call: true,
        time: '10:10 am',
        dash: 1,
        space: 0,
        count: '4',
        url:
            'https://images.pexels.com/photos/415829/pexels-photo-415829.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
    CustomListItem(
        title: 'Ali Raza',
        subtitle: "We will manage,you don't worry",
        time: '7:45 am',
        call: true,
        count: '7',
        dash: 5,
        space: 2.5,
        url:
            'https://images.pexels.com/photos/1310522/pexels-photo-1310522.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
    CustomListItem(
        title: 'Rashid Saleem',
        subtitle: 'Yes i have it',
        time: '11:11 pm',
        call: false,
        count: '12',
        dash: 2,
        space: 3.5,
        url:
            'https://images.pexels.com/photos/1043471/pexels-photo-1043471.jpeg?auto=compress&cs=tinysrgb&w=600'),
    CustomListItem(
        title: 'Afzal Azeem',
        subtitle: 'Lorem ipsum',
        time: '1:10 am',
        call: false,
        count: '10',
        dash: 4,
        space: 3,
        url:
            'https://images.pexels.com/photos/34534/people-peoples-homeless-male.jpg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
    CustomListItem(
        title: 'Noman Sarwar',
        subtitle: 'Do it please',
        call: true,
        time: '8:30 am',
        count: '99',
        dash: 1,
        space: 0,
        url:
            'https://images.pexels.com/photos/697509/pexels-photo-697509.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
    CustomListItem(
        title: 'Talha Arshad',
        subtitle: 'Announcement Mid Journey',
        time: '2:15 am',
        count: '2',
        call: true,
        dash: 3,
        space: 4.5,
        url:
            'https://images.pexels.com/photos/1704488/pexels-photo-1704488.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
    CustomListItem(
        title: 'Abdullah',
        subtitle: 'Hello how are you',
        call: true,
        time: '10:10 am',
        dash: 1,
        space: 0,
        count: '4',
        url:
            'https://images.pexels.com/photos/415829/pexels-photo-415829.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
    CustomListItem(
        title: 'Ali Raza',
        subtitle: "We will manage,you don't worry",
        time: '7:45 am',
        call: true,
        count: '7',
        dash: 5,
        space: 2.5,
        url:
            'https://images.pexels.com/photos/1310522/pexels-photo-1310522.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
    CustomListItem(
        title: 'Rashid Saleem',
        subtitle: 'Yes i have it',
        time: '11:11 pm',
        call: false,
        count: '12',
        dash: 2,
        space: 3.5,
        url:
            'https://images.pexels.com/photos/1043471/pexels-photo-1043471.jpeg?auto=compress&cs=tinysrgb&w=600'),
    CustomListItem(
        title: 'Afzal Azeem',
        subtitle: 'Lorem ipsum',
        time: '1:10 am',
        call: false,
        count: '10',
        dash: 4,
        space: 3,
        url:
            'https://images.pexels.com/photos/34534/people-peoples-homeless-male.jpg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
    CustomListItem(
        title: 'Noman Sarwar',
        subtitle: 'Do it please',
        call: true,
        time: '8:30 am',
        count: '99',
        dash: 1,
        space: 0,
        url:
            'https://images.pexels.com/photos/697509/pexels-photo-697509.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
  ];
}
