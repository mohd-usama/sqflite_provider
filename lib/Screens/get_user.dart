import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sqflite_curd_demo/Database/local_database.dart';
import 'package:sqflite_curd_demo/Screens/add_user.dart';
import 'package:sqflite_curd_demo/Screens/user_provider.dart';

import '../Model/user_model.dart';
import '../Suppots/textfield_mixin.dart';

class GetUserDetails extends StatefulWidget {
  const GetUserDetails({super.key});

  @override
  State<GetUserDetails> createState() => _GetUserDetailsState();
}

class _GetUserDetailsState extends State<GetUserDetails> with CustomTextFieldWidgets {
  @override
  void initState() {
    super.initState();
    Provider.of<UserProvider>(context, listen: false).getUserDetails();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<UserProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text("Get User Details"),
      ),
      body: Consumer<UserProvider>(
        builder: (context, provider, child) {
          return ListView.builder(
                  padding: EdgeInsets.all(20),
                  itemCount: provider.getUserModelList.length,
                  itemBuilder: (BuildContext context, int index) {
                    final user = provider.getUserModelList[index];
                    return Column(
                      children: [
                        if(user.profileImg!.isNotEmpty)
                        CircleAvatar(
                          radius: 50,
                          child: ClipOval(
                            child: SizedBox(height: 100, width: 100, child: Image.memory(base64Decode(user.profileImg!), fit: BoxFit.cover)),
                          ),
                        ),
                        Row(
                          children: [
                            Text("Name : ", style: customTextStyle),
                            Text(user.name ?? "", style: customTextStyle),
                          ],
                        ),
                        Row(
                          children: [
                            Text("Mobile No : ", style: customTextStyle),
                            Text(user.mobileNo ?? "", style: customTextStyle),
                          ],
                        ),
                        Row(
                          children: [
                            Text("DOB : ", style: customTextStyle),
                            Text(user.dob ?? "", style: customTextStyle),
                          ],
                        ),
                        Row(
                          children: [
                            Text("Age : ", style: customTextStyle),
                            Text(user.age ?? "", style: customTextStyle),
                          ],
                        ),
                        Row(
                          children: [
                            Text("Qualification : ", style: customTextStyle),
                            Text(user.qualification ?? "", style: customTextStyle),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Expanded(
                                  child: ElevatedButton(
                                child: Text("Update", style: TextStyle(color: Colors.white)),
                                onPressed: () {
                                  provider.imageData = base64Encode(base64Decode(user.profileImg!));
                                  provider.nameCtr.text = user.name!;
                                  provider.mobileNoCtr.text = user.mobileNo!;
                                  provider.ageCtr.text = user.age!;
                                  provider.dobCtr.text = user.dob!;
                                  provider.qualificationValue = user.qualification!;

                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => AddUser(updateID: user.id)));
                                },
                                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                              )),
                              SizedBox(width: 10),
                              Expanded(
                                child: ElevatedButton(
                                    child: Text("Delete", style: TextStyle(color: Colors.white)),
                                    onPressed: () {
                                      provider.userDataDeleteSingle(user);
                                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("User data deleted successfully")));
                                    },
                                    style: ElevatedButton.styleFrom(backgroundColor: Colors.red)),
                              )
                            ],
                          ),
                        )
                      ],
                    );
                  },
                );
        },
      ),
    );
  }
}
