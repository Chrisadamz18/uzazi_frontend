import 'package:flutter/material.dart';
import '/services/apiService.dart';
import '/services/sharedService.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text("UzaziCare"),
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              SharedService.logout(context);
            },
            icon: Icon(
              Icons.logout,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: userProfile(),
    );
  }

  Widget userProfile() {
    return FutureBuilder(
        future: APIService.getUserProfile(),
        builder: (BuildContext context, AsyncSnapshot<String> model) {
          if (model.hasData) {
            return Center(
              child: Text(model.data!),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        });
  }
}
