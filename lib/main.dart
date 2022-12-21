import 'package:age_calculator/page/date_picker_page.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'ad_service.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  AdManager.initialize();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final String title = 'Age Calculator';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        title: Text('Age Calculator'),
      ),
      body: Center(
        child: DatePickerPage(),
      ),
    );
  }
}
