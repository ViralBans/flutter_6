import 'package:flutter/material.dart';

class GridViewTest extends StatefulWidget {
  const GridViewTest({Key? key}) : super(key: key);

  @override
  State<GridViewTest> createState() => _GridViewTestState();
}

class _GridViewTestState extends State<GridViewTest> {
  final List<Map> testCases =
      List.generate(100, (index) => {"id": index, "name": "Test Case $index"})
          .toList();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          double width = constraints.constrainWidth();
          return width > 600
              ? GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: width > 600 ? 3 : 2,
                    childAspectRatio: width > 600 ? 3 : 2,
                  ),
                  itemCount: testCases.length,
                  itemBuilder: (BuildContext context, index) {
                    return Card(
                      child: Container(
                        alignment: Alignment.center,
                        child: Text(testCases[index]["name"]),
                      ),
                    );
                  })
              : ListView.builder(
                  itemCount: testCases.length,
                  itemBuilder: (context, index) => Card(
                    child: Center(
                      child: ListTile(
                        title: Text(testCases[index]["name"]),
                      ),
                    ),
                  ),
                );
        },
      ),
    );
  }
}
