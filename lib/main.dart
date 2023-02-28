import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:mezcreen/env.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:mezcreen/sampleData.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await checkForTestData();
  runApp(const MyApp());
}

Future<void> checkForTestData() async {
  DataSnapshot dataSnapshot =
      await FirebaseDatabase.instance.ref().child(rootNode).get();
  if (dataSnapshot.value != null) return;
  await FirebaseDatabase.instance.ref().child(rootNode).set(data);
}

FirebaseDatabase database = FirebaseDatabase.instance;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String _title = "App for $rootNode";

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: RoomsPage(),
    );
  }
}

class RoomsPage extends StatefulWidget {
  const RoomsPage({super.key});

  @override
  State<RoomsPage> createState() => _RoomsPageState();
}

class _RoomsPageState extends State<RoomsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Rooms")),
      body: DefaultTextStyle(
        style: Theme.of(context).textTheme.displayMedium!,
        textAlign: TextAlign.center,
        child: FutureBuilder<DataSnapshot>(
          future: FirebaseDatabase.instance
              .ref()
              .child(rootNode)
              .get(), // a previously-obtained Future<String> or null
          builder:
              (BuildContext context, AsyncSnapshot<DataSnapshot> snapshot) {
            List<Widget> children = <Widget>[];
            if (snapshot.hasData) {
              Map<dynamic, dynamic> rooms =
                  snapshot.data!.value as Map<dynamic, dynamic>;
              rooms.forEach((key, value) {
                children.add(TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              DevicesPage(roomKey: key, roomValue: value),
                        ),
                      );
                    },
                    child: Text(value['name'])));
              });
            } else if (snapshot.hasError) {
              children = <Widget>[
                const Icon(
                  Icons.error_outline,
                  color: Colors.red,
                  size: 60,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Text('Error: ${snapshot.error}'),
                ),
              ];
            } else {
              children = const <Widget>[
                SizedBox(
                  width: 60,
                  height: 60,
                  child: CircularProgressIndicator(),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 16),
                  child: Text('Awaiting result...'),
                ),
              ];
            }
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: children,
              ),
            );
          },
        ),
      ),
    );
  }
}

class DevicesPage extends StatefulWidget {
  String roomKey;
  dynamic roomValue;
  DevicesPage({super.key, required this.roomKey, required this.roomValue});

  @override
  State<DevicesPage> createState() => _DevicesPageState();
}

class _DevicesPageState extends State<DevicesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.roomValue['name'])),
      body: DefaultTextStyle(
        style: Theme.of(context).textTheme.displayMedium!,
        textAlign: TextAlign.center,
        child: FutureBuilder<DataSnapshot>(
          future: FirebaseDatabase.instance
              .ref()
              .child("$rootNode/${widget.roomKey}/devices")
              .get(), // a previously-obtained Future<String> or null
          builder:
              (BuildContext context, AsyncSnapshot<DataSnapshot> snapshot) {
            List<Widget> children = <Widget>[];
            if (snapshot.hasData) {
              Map<dynamic, dynamic> rooms =
                  snapshot.data!.value as Map<dynamic, dynamic>;
              rooms.forEach((key, value) {
                children.add(
                    TextButton(onPressed: () {}, child: Text(value['name'])));
              });
            } else if (snapshot.hasError) {
              children = <Widget>[
                const Icon(
                  Icons.error_outline,
                  color: Colors.red,
                  size: 60,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Text('Error: ${snapshot.error}'),
                ),
              ];
            } else {
              children = const <Widget>[
                SizedBox(
                  width: 60,
                  height: 60,
                  child: CircularProgressIndicator(),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 16),
                  child: Text('Awaiting result...'),
                ),
              ];
            }
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: children,
              ),
            );
          },
        ),
      ),
    );
  }
}
