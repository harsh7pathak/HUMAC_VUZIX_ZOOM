import 'package:flutter/material.dart';
import 'package:vuzix_humac/homepage.dart';
import 'package:flutter/services.dart';
import 'login.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();   SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]).then((_){
    runApp(MaterialApp(debugShowCheckedModeBanner: false, home: HomePage()));
  });
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MY FIRST APP'),
        centerTitle: true,
      ),
    );
  }
}
