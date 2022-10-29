import 'package:flutter/material.dart';

class TextFieldTest extends StatefulWidget {
  const TextFieldTest({Key? key}) : super(key: key);

  @override
  State<TextFieldTest> createState() => _TextFieldTestState();
}

class _TextFieldTestState extends State<TextFieldTest> {
  TextEditingController editingController = TextEditingController();
  final titles = List<String>.generate(100, (counter) => "Title $counter");
  var searchTitles = [];

  @override
  void initState() {
    searchTitles.addAll(titles);
    super.initState();
  }

  void filterSearchResults(String query) {
    List<String> tSearchList = <String>[];
    tSearchList.addAll(titles);
    if (query.isNotEmpty) {
      List<String> tListData = <String>[];
      for (var item in tSearchList) {
        if (item.contains(query)) {
          tListData.add(item);
        }
      }
      setState(() {
        searchTitles.clear();
        searchTitles.addAll(tListData);
      });
      return;
    } else {
      setState(() {
        searchTitles.clear();
        searchTitles.addAll(titles);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(10),
          child: TextField(
            onChanged: (value) {
              filterSearchResults(value);
            },
            controller: editingController,
            decoration: const InputDecoration(
                labelText: "Поиск",
                hintText: "Укажите данные для поиска",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)))),
          ),
        ),
        Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: searchTitles.length,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  title: Text(searchTitles[index]),
                  leading: const CircleAvatar(
                      backgroundImage: NetworkImage(
                          "https://images.unsplash.com/photo-1547721064-da6cfb341d50")),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
