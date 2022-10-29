import 'package:flutter/material.dart';
import 'package:flutter_6/screens/gridview.dart';
import 'package:flutter_6/screens/listview.dart';
import 'package:flutter_6/screens/sliver.dart';
import 'package:flutter_6/screens/textfield.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'HomeWork 6'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  // Экраны
  final _pages = [const ListViewTest(), const GridViewTest(), const SliverTest(), const TextFieldTest()];

  // Контроллер табов
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _tabController.animateTo(2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        bottom: TabBar(
          indicatorPadding: const EdgeInsets.all(5),
          indicator: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.red,
          ),
          controller: _tabController,
          tabs: const [
            Tab(
              icon: Icon(Icons.list),
              child: Text('ListView'),
            ),
            Tab(
              icon: Icon(Icons.list),
              child: Text('GridView'),
            ),
            Tab(
              icon: Icon(Icons.list),
              child: Text('Sliver'),
            ),
            Tab(
              icon: Icon(Icons.list),
              child: Text('TextField'),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: TabBarView(
          controller: _tabController,
          children: [
            _pages[0],
            _pages[1],
            _pages[2],
            _pages[3],
          ],
        ),
      ),
    );
  }
}
