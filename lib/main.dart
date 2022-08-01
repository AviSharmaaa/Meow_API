import 'package:flutter/material.dart';
import 'package:meow_api/models/meow_model.dart';
import 'package:meow_api/services/meow_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: DisplayMeow()
    );
  }
}

class DisplayMeow extends StatefulWidget {
  const DisplayMeow({Key? key}) : super(key: key);

  @override
  State<DisplayMeow> createState() => _DisplayMeowState();
}

class _DisplayMeowState extends State<DisplayMeow> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {});
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: const Text("Meow Gif😼"),
        centerTitle: true,
      ),
      body: FutureBuilder<List<MeowwModel>>(
        future: MeowService().getMeow(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            MeowwModel meow = snapshot.data![0];
            return Center(
              child: Image.network(
                meow.url,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return const CircularProgressIndicator();
                },
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

