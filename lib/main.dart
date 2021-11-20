import 'package:flutter/material.dart';
import 'package:flutter_hive/people.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'infoScreen.dart';

main() async {
  // Initialize hive
  await Hive.initFlutter();
  //Registering the adapter
  Hive.registerAdapter(PeopleAdapter());
  // Open the peopleBox
  await Hive.openBox('peopleBox');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hive Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      debugShowCheckedModeBanner: false,
      home: InfoScreen(),
    );
  }
}
