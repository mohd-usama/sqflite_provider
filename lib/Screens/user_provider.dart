import 'dart:convert';

import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sqflite_curd_demo/Model/user_model.dart';

import '../Database/local_database.dart';
import '../Suppots/camera_and_gallery.dart';

class UserProvider with ChangeNotifier {
  String imageData = "";

  String get imageDataGet => imageData;
  String get qualificationValueGet => qualificationValue;

  String qualificationValue = "";
  List<String> qualificationList = ["Select", "BCA", "B-TECH", "MCA", "M-TECH", "BA", "MA", "M-COM", "B-COM"];
  List<UserModel> getUserModelList = [];

  TextEditingController nameCtr = TextEditingController();
  TextEditingController mobileNoCtr = TextEditingController();
  TextEditingController dobCtr = TextEditingController();
  TextEditingController ageCtr = TextEditingController();

  FocusNode nameFocus = FocusNode();
  FocusNode mobileNoFocus = FocusNode();
  FocusNode dobFocus = FocusNode();
  FocusNode ageFocus = FocusNode();

  Future<void> addUserData(UserModel usermodel, BuildContext context) async {
    await DatabaseHelper.insert(usermodel);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("User data added successfully")));
    notifyListeners();
    reset();
  }

  getUserDetails() async {
    List<Map<String, dynamic>> dummyList = await DatabaseHelper.query();
    getUserModelList.clear();
    for (var data in dummyList) {
      getUserModelList.add(UserModel.fromJson(data));
    }
    notifyListeners();
  }

  void imageChooseBottomSheet(BuildContext context) {
    showModalBottomSheet(
        isScrollControlled: false,
        context: context,
        builder: (c) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                onTap: () async {
                  Navigator.pop(context);
                  var imageResult = await Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return CameraAndGallery("camera");
                  }));

                  if (imageResult != null) {
                    imageData = imageResult["image64"];
                  }
                  notifyListeners();
                },
                title: Text("Camera"),
                trailing: Icon(Icons.camera),
              ),
              ListTile(
                onTap: () async {
                  Navigator.pop(context);
                  var imageResult = await Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return CameraAndGallery("gallery");
                  }));

                  if (imageResult != null) {
                    imageData = imageResult["image64"];
                  }
                  notifyListeners();
                },
                title: Text("Gallery"),
                trailing: Icon(Icons.photo),
              ),
            ],
          );
        });
  }

  void getSetQualificationData(String? v) {
    if (v != null) {
      qualificationValue = v;
      notifyListeners();
    }
  }

  void reset() {
    imageData = "";
    nameCtr.clear();
    mobileNoCtr.clear();
    ageCtr.clear();
    dobCtr.clear();
    qualificationValue = "";
    notifyListeners();
  }

  Future<String> selectDate(BuildContext context) async {
    var data = await showDatePicker(context: context, firstDate: DateTime(1950), lastDate: DateTime.now());
    if (data != null) {
      return DateFormat('dd-MM-yyyy').format(data);
    } else {
      return "";
    }
  }

  Future userUpdateData(UserModel userModel, BuildContext context) async {
    await DatabaseHelper.update(userModel);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("User data update successfully")));
    notifyListeners();
    reset();
  }

  void userDataDeleteSingle(UserModel userModel) async {
    await DatabaseHelper.delete(userModel);
    getUserDetails();
    notifyListeners();
  }

  bool checkValidation(BuildContext context) {
    if (nameCtr.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Please enter name")));
      return false;
    } else if (mobileNoCtr.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Please enter mobile no")));
      return false;
    } else if (ageCtr.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Please enter age")));
      return false;
    } else if (dobCtr.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Please select data of birth")));
      return false;
    } else if (qualificationValue.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Please select qualification")));
      return false;
    }

    return true;
  }
}
