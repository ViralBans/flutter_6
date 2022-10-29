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
      child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 2,
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
          ),
          itemCount: testCases.length,
          itemBuilder: (BuildContext context, index) {
            return Card(
              child: Container(
                alignment: Alignment.center,
                child: Text(testCases[index]["name"]),
              ),
            );
          }),
    );
  }
}
