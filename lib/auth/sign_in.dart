import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myshop/auth/auth.dart';
//import 'package:myshop/model/user.dart';
//import 'package:firebase_core/firebase_core.dart';
//import 'package:firebase_auth/firebase_auth.dart';
import 'package:myshop/shared/loading.dart';
import 'package:myshop/shared/textFieldDecoration.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;

  SignIn({this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  final AuthService _auth = AuthService();

  String email = '';

  String password = '';

  String error = "";

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : SafeArea(
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.brown[400],
                title: Text('Welcome Back'),
                actions: [
                  FlatButton.icon(
                    onPressed: widget.toggleView,
                    icon: Icon(Icons.person),
                    label: Text('Register'),
                  ),
                ],
              ),
              backgroundColor: Colors.brown[100],
              body: Center(
                child: Container(
                  width: MediaQuery.of(context).size.width * .7,
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          decoration:
                              formDecoration.copyWith(hintText: 'Email'),
                          validator: (val) {
                            if (val.isEmpty)
                              return 'email is empty';
                            else {
                              email = val;
                              return null;
                            }
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          decoration:
                              formDecoration.copyWith(hintText: 'Password'),
                          obscureText: true,
                          validator: (val) {
                            if (val.isEmpty)
                              return 'incorrect password';
                            else {
                              password = val;
                              return null;
                            }
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        RaisedButton(
                          child: Text('Sign in'),
                          onPressed: () async {
                            if (_formKey.currentState.validate()) {
                              setState(() {
                                loading = true;
                              });
                              dynamic result = await _auth
                                  .signInWithEmailAndPassword(email, password);
                              if (result == null)
                                setState(() {
                                  loading = false;
                                  error = "CAN'T LOGIN WITH THOSE CREDENTIALS";
                                });
                            }
                          },
                          color: Colors.pink[300],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          error,
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 14,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
  }
}
