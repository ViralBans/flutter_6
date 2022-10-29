import 'package:flutter/material.dart';

class ListViewTest extends StatefulWidget {
  const ListViewTest({Key? key}) : super(key: key);

  @override
  State<ListViewTest> createState() => _ListViewTestState();
}

class _ListViewTestState extends State<ListViewTest> with AutomaticKeepAliveClientMixin {
  bool isFavourite = false;
  final titles = List<String>.generate(100, (counter) => "Title $counter");
  final subtitles = List<String>.generate(100, (counter) => "Subtitle $counter");

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ListView.builder(
      itemCount: titles.length,
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            title: Text(titles[index]),
            subtitle: Text(subtitles[index]),
            leading: const CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://images.unsplash.com/photo-1547721064-da6cfb341d50")),
            trailing: Icon(
              Icons.star,
              color: isFavourite ? Colors.yellow : Colors.grey,
            ),
            onTap: () {
              setState(() {
                isFavourite = true;
              });
            },
          ),
        );
      },
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
