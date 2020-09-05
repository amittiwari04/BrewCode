
import 'package:flutter/material.dart';
import 'package:myshop/auth/auth.dart';
import 'package:myshop/model/user.dart';
import 'package:myshop/screens/SplashScreen.dart';
import 'package:myshop/screens/wrapper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<UserId>.value(
      value: AuthService().user,
      child: MaterialApp(
        title: 'Brew Code',
        home: SplashScreen(),
      ),
    );
  }
}
