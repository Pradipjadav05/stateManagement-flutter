import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'provider/count_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CountProvide(),
      child: const MaterialApp(
        title: "Change Notifier Provider",
        home: Home(),
      ),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    print("build");
    final countProvide = Provider.of<CountProvide>(context,listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Change Notifier Demo"),
        centerTitle: true,
      ),
      body: Container(
          alignment: Alignment.center,
          child: Consumer<CountProvide>(
            builder: (context, value, child) {
              print("this widget build");
              return Text(
                value.count.toString(),
                style: const TextStyle(fontSize: 50),
              );
            },
          )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          countProvide.setCount();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
