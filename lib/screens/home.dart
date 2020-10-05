import 'package:flutter/material.dart';
import 'package:myshop/auth/auth.dart';
import 'package:myshop/auth/databse.dart';
import 'package:myshop/model/brew.dart';
import 'package:myshop/screens/brewList.dart';
import 'package:myshop/screens/settings_form.dart';
import 'package:provider/provider.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  AuthService _auth = AuthService();

  _showBottomSheet() {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            padding: EdgeInsets.symmetric(
              vertical: 20,
              horizontal: 60,
            ),
            child: SettingForm(),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Brew>>.value(
      catchError: (_, a) => null,
      value: DataBaseService().brews,
      child: Scaffold(
        backgroundColor: Colors.brown[50],
        appBar: AppBar(
          title: Text(
            'Brew Code',
          ),
          backgroundColor: Colors.brown[400],
          actions: [
            FlatButton.icon(
              onPressed: () async {
                await _auth.signOut();
              },
              icon: Icon(Icons.person),
              label: Text('Log Out'),
            ),
            FlatButton.icon(
              onPressed: () => _showBottomSheet(),
              icon: Icon(Icons.settings),
              label: Text('Setting'),
            )
          ],
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/coffee_bg.png'),
            ),
          ),
          child: BrewList(),
        ),
      ),
    );
  }
}
