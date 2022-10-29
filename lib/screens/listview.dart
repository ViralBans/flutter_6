import 'package:flutter/material.dart';

class ListViewTest extends StatefulWidget {
  const ListViewTest({Key? key}) : super(key: key);

  @override
  State<ListViewTest> createState() => _ListViewTestState();
}

class _ListViewTestState extends State<ListViewTest> with AutomaticKeepAliveClientMixin {
  final data = List<Map>.generate(100, (index) => {'id': index, 'title': 'Test Title $index','subtitle': 'Tet SubTitle $index' ,'isFavourite': false});

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
      itemCount: data.length,
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            title: Text(data[index]['title']),
            subtitle: Text(data[index]['subtitle']),
            leading: const CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://images.unsplash.com/photo-1547721064-da6cfb341d50")),
            trailing: Icon(
              Icons.star,
              color: data[index]['isFavourite'] ? Colors.yellow : Colors.grey,
            ),
            onTap: () {
              setState(() {
                data[index]['isFavourite'] = !data[index]['isFavourite'];
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
