import 'package:flutter/material.dart';

class SliverTest extends StatefulWidget {
  const SliverTest({Key? key}) : super(key: key);

  @override
  State<SliverTest> createState() => _SliverTestState();
}

class _SliverTestState extends State<SliverTest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            backgroundColor: Colors.green,
            title: Text('Sliver App Bar'),
            expandedHeight: 30,
            collapsedHeight: 150,
          ),
          const SliverAppBar(
            backgroundColor: Colors.blue,
            title: Text('Sliver Float App Bar'),
            floating: true,
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                return Card(
                  margin: const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    height: 60,
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Item sliver $index",
                    ),
                  ),
                );
              },
              childCount: 100,
            ),
          ),
        ],
      ),
    );
  }
}
