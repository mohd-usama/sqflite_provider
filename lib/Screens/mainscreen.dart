import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sqflite_curd_demo/Screens/add_user.dart';
import 'package:sqflite_curd_demo/Screens/get_user.dart';
import 'package:sqflite_curd_demo/Screens/user_provider.dart';

class Mainscreen extends StatelessWidget {
  const Mainscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sqflite Database")),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Provider.of<UserProvider>(context, listen: false).reset();
                  Navigator.push(context, MaterialPageRoute(builder: (context) => AddUser()));
                },
                child: Text("Add User")),
            SizedBox(height: 25),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (contex) => GetUserDetails()));
                },
                child: Text("Get User")),
          ],
        ),
      ),
    );
  }
}
