import 'package:flutter/material.dart';
import 'package:myshop/auth/authentication.dart';
import 'package:myshop/auth/sign_in.dart';
import 'package:myshop/model/user.dart';
import 'package:myshop/screens/home.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user =Provider.of<UserId>(context);
   // print(user);
   if(user==null)
     return Authentication();
   else  return Home();
  }
}
