import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:quipu/screens/entry_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quipu/blocs/entry/entry_bloc.dart';
import 'package:quipu/model/entry/entry_response.dart';
import 'package:flutter_masonry_view/flutter_masonry_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Content> entries = List.empty(growable: true);
  bool light = false;
  final ScrollController _scrollController = ScrollController();
  final _scrollThreshold = 500.0;
  int page = 1;
  EntryResponse? entryResponse;

  _HomePageState() {
    _scrollController.addListener(_onScroll);
  }

  @override
  void initState() {
    super.initState();
    // _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _loadData() {
    final entryBloc = BlocProvider.of<EntryBloc>(context, listen: false);

    // entryBloc.stream.listen((event) {
    //   if (event is EntryInitial) {
    //     _scrollController.animateTo(
    //         _scrollController.position.maxScrollExtent + 100,
    //         duration: const Duration(milliseconds: 300),
    //         curve: Curves.fastOutSlowIn);
    //   }
    // });

    if (entryResponse != null) {
      if (!entryResponse!.last) {
        page = page + 1;
        entryBloc.add(LoadEntries(page: page, size: 10));
      }
    }
  }

  void _onScroll() {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;

    if (currentScroll + _scrollThreshold >= maxScroll) {
      _loadData();
      setState(() {});
    }
  }

  final navigationBar = [
    {
      "title": "Home",
      "icon": Icon(Icons.home),
      "navigateTo": (context) => {
            Navigator.of(context)
              ..push(MaterialPageRoute(
                builder: (context) => HomePage(),
              ))
          }
    },
    {
      "title": "Find",
      "icon": Icon(Icons.search),
      "navigateTo": (context) => {
            Navigator.of(context)
              ..push(MaterialPageRoute(
                builder: (context) => HomePage(),
              ))
          }
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            controller: _scrollController,
            child: SafeArea(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.end,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Switch(
                          // This bool value toggles the switch.
                          value: light,
                          activeColor: Colors.red,
                          onChanged: (bool value) {
                            // This is called when the user toggles the switch.
                            setState(() {
                              light = value;
                              entries = List.empty(growable: true);
                            });
                          },
                        ),
                      ],
                    ),
                    mansonryTimeline(context),
                  ]),
            ),
          ),
          Align(alignment: AlignmentDirectional.bottomCenter, child: _menu())
        ],
      ),
    );
  }

  Widget mansonryTimeline(BuildContext context) {
    final entryBloc = BlocProvider.of<EntryBloc>(context);

    return BlocBuilder<EntryBloc, EntryState>(
        bloc: entryBloc,
        builder: (context, state) {
          if (state is EntryInitial) {
            final response = state.response;

            if (response.content.isEmpty) {
              return const Center(child: CircularProgressIndicator());
            }

            entryResponse = response;

            entries.addAll(response.content);
            entries.add(_emptyContent());

            return MasonryView(
              listOfItem: entries,
              numberOfColumn: light ? 2 : 1,
              itemBuilder: (item) {
                return card(item);
              },
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }

  Content _emptyContent() {
    final emptyItem = {
      "id": "652d4b05f2c89ea612f65c96",
      "title": "aliquip dolore ullamco non cupidatat",
      "thumbnailUrl":
          "https://t4.ftcdn.net/jpg/05/40/64/19/360_F_540641991_V5z2WV16QRTyV0JlSJyl2GXEJWZblRod.jpg",
      "text":
          "Velit esse Lorem voluptate elit veniam nisi ad fugiat dolor Lorem fugiat. Fugiat consequat ut ea laboris excepteur sunt magna cupidatat ex laboris.",
      "keywords": ["member", "owner"],
      "creator": {
        "id": "652d490bef5230a1300ef770",
        "name": "Break",
        "image": "http://placehold.it/32x32",
        "about":
            "Ex qui magna esse culpa tempor velit cillum proident ex reprehenderit ex aliqua ex. Duis nulla sit ut exercitation nisi irure pariatur.",
        "location": {"latitude": -62.062174, "longitude": -152.662943}
      },
      "commentCount": 100,
      "comment": [],
      "dateCreated": "2012-12-30T03:21:47.050Z",
      "dateModified": "2014-04-28T09:45:27.228Z",
      "datePublished": "2014-01-07T11:16:51.649Z"
    };
    return Content.fromJson(emptyItem);
  }

  Widget card(Content item) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => EntryPage(content: item),
        ));
      },
      child: SizedBox(
        height: 250,
        child: Container(
          decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                  image: NetworkImage(item.thumbnailUrl), fit: BoxFit.cover)),
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            SizedBox(
              height: 50,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          item.creator.name,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Container(
                            height: 30,
                            width: 30,
                            margin: const EdgeInsetsDirectional.only(start: 10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: const DecorationImage(
                                    image: NetworkImage(
                                        "https://ui-avatars.com/api/?background=random"),
                                    fit: BoxFit.cover)))
                      ],
                    ),
                  ],
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }

  Widget _menu() {
    return BottomNavigationBar(
        elevation: 0, // to get rid of the shadow
        currentIndex: 1,
        selectedItemColor: Colors.blueGrey,
        backgroundColor: Colors.grey.withOpacity(
            0.3), // transparent, you could use 0x44aaaaff to make it slightly less transparent with a blue hue.
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: Colors.grey.shade700,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            // icon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore_rounded),
            // icon: Icon(Icons.explore_outlined),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            // icon: Icon(Icons.notifications),
            icon: Icon(Icons.notifications_outlined),
            label: 'Notification',
          ),
          BottomNavigationBarItem(
            // icon: Icon(Icons.account_circle),
            icon: Icon(Icons.account_circle_outlined),
            label: 'Profile',
          ),
        ]);
  }
}
