import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:t20_worldcup/screens/homepage.dart';
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.removeAfter(initialization);
  runApp(const MyApp());
}
Future initialization(BuildContext? context)async{
  await Future.delayed(const Duration(seconds: 1));
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}
