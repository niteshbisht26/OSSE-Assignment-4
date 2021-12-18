import 'package:firebase_app_web/Service/Auth_Service.dart';
import 'package:firebase_app_web/main.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AuthClass authClass = AuthClass();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              icon: Icon(Icons.logout),
              onPressed: () async {
                await authClass.signOut();
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (builder) => MyApp()),
                    (route) => false);
              }),
        ],
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home, size: 30), title: Text('Home')),
            BottomNavigationBarItem(icon: Icon(Icons.add, size: 30), title: Text('Add Post')),
            BottomNavigationBarItem(icon: Icon(Icons.account_circle, size: 30), title: Text('Profile')),
          ],
          elevation: 5.0,
          type: BottomNavigationBarType.fixed,
          backgroundColor: _shrineColorScheme.surface,
          selectedItemColor: _shrineColorScheme.onSurface,
          unselectedItemColor: _shrineColorScheme.onSurface.withOpacity(.60),
          currentIndex: selectedPage,
          onTap: (index) {
            setState(() {
              selectedPage = index;
            });
            _onTap();
          },
        )
      ),
    );
  }
}