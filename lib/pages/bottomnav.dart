import 'package:flutter/material.dart';

class BottomNav extends StatefulWidget {
  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.blue.shade100,
        shape: CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.person),
              color: Colors.blue,
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.person),
              color: Colors.blue,
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.person),
              color: Colors.blue,
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.person),
              color: Colors.blue,
            ),
            Divider(),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue.shade200,
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }
}
