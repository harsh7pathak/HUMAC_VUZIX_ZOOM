import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';


// ignore: camel_case_types
class camerapage extends StatefulWidget {

  @override
  _camerapageState createState() => _camerapageState();
}

// ignore: camel_case_types
class _camerapageState extends State<camerapage> {
  late File _picker;

  Future getImage() async {
    // ignore: invalid_use_of_visible_for_testing_member
    var image = await ImagePicker.platform.pickImage(source: ImageSource.camera);
    this.setState(() {
      _picker = File(image!.path);
    });
  }


  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {getImage();});
    return Scaffold(
        appBar: AppBar(
        title: Text('Camera Page'),
    ),
      body: Center(
        child: _picker == null ? Text('Image is not loaded') : Image.file(_picker),
      ),
    );
  }
}