import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Challange 01'),
      ),
      body: RefreshIndicator(
        onRefresh: loadData,
        child: FutureBuilder<List<Widget>>(
            future: loadData(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const SizedBox.shrink();
              }
              return ListView(children: snapshot.data!);
            }),
      ),
    );
  }

  Future<List<Widget>> loadData() async {
    return List.generate(
      100000,
      (index) => ListTile(
        title: Text('List Tile $index'),
      ),
    );
  }
}
