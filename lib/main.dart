import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sqflite_curd_demo/Screens/user_provider.dart';

import 'Database/local_database.dart';
import 'Screens/mainscreen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DatabaseHelper.initDatabase();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => UserProvider(),
      child: MaterialApp(
          title: 'SQFLITE PROVIDER',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
            useMaterial3: true,
          ),
          home: Mainscreen()),
    );
  }
}
