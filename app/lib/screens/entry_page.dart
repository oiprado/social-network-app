import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:quipu/widget/featured_widget.dart';
import 'package:quipu/widget/suggestions_widget.dart';
import 'package:quipu/model/entry/entry_response.dart';

class EntryPage extends StatelessWidget {
  static const double actionIconSize = 30;
  final Content content;
  const EntryPage({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    final f = DateFormat('yyyy-MM-dd hh:mm');
    // for (var item in content.keywords) {
    //   print(item);
    // }

    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverAppBar(
          title: Text(content.title),
          expandedHeight: 400,
          flexibleSpace: FlexibleSpaceBar(background: _expandedImage()),
        ),
        SliverList(
            delegate: SliverChildListDelegate([
          _header(),
          _content(),
          _keyboards(),
          _actions(),
          const SuggestionWidget(),
          const FeaturedWidget()
        ])),
      ],
    ));
  }

  Row _keyboards() {
    return Row(
        children: content.keywords
            .map((e) => Container(
                padding: const EdgeInsetsDirectional.all(8),
                child: Text('#${e}')))
            .toList());
  }

  Widget _expandedImage() {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(content.thumbnailUrl), fit: BoxFit.fill)),
    );
  }

  Widget _header() {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        SizedBox(
          height: 50,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                          height: 30,
                          width: 30,
                          margin: const EdgeInsetsDirectional.only(
                              start: 8, end: 8),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: const DecorationImage(
                                  image: NetworkImage(
                                      "https://ui-avatars.com/api/?background=random"),
                                  fit: BoxFit.cover))),
                      Text(
                        content.creator.name,
                        overflow: TextOverflow.ellipsis,
                      )
                    ],
                  ),
                  Container(
                    margin: EdgeInsetsDirectional.only(end: 8),
                    child:
                        ElevatedButton(onPressed: () {}, child: Text("Follow")),
                  )
                ],
              ),
            ],
          ),
        )
      ]),
    );
  }

  Widget _actions() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        IconButton(
            onPressed: () {},
            icon: const Icon(Icons.favorite_outline, size: actionIconSize)),
        IconButton(
            onPressed: () {},
            icon: const Icon(Icons.bookmark_border, size: actionIconSize)),
        IconButton(
            onPressed: () {},
            icon: const Icon(Icons.share, size: actionIconSize)),
        // IconButton(onPressed: () {}, icon: Icon(Icons.place, size: 40))
      ],
    );
  }

  Widget _content() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            content.text,
            style: const TextStyle(fontSize: 15),
          ),
        ),
      ],
    );
  }
}
