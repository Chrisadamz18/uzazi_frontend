import 'package:flutter/material.dart';
import 'package:uzazi/pages/splash.dart';
import '/services/sharedService.dart';
import '/pages/homepage.dart';
import './pages/login.dart';
import './pages/register.dart';

Widget _defaultHome = const LoginPage();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  bool _result = await SharedService.isLoggedIn();
  if (_result) {
    _defaultHome = const HomePage();
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Uzazi-Care',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
      // routes: {
      //   '/': (content) => _defaultHome,
      //   '/home': (content) => HomePage(),
      //   '/login': (content) => LoginPage(),
      //   '/register': (content) => RegisterPage(),
      // },
    );
  }
}
