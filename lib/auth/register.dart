import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myshop/auth/auth.dart';
import 'package:myshop/shared/loading.dart';
import 'package:myshop/shared/textFieldDecoration.dart';

class Register extends StatefulWidget {
  final Function toggleView;

  Register({this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool loading = false;
  String email = '';
  String password = '';
  final _formKey = GlobalKey<FormState>();
  String error = "";
  AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : SafeArea(
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.brown[400],
                title: Text('Welcome to brew code'),
                actions: [
                  FlatButton.icon(
                    onPressed: widget.toggleView,
                    icon: Icon(Icons.person),
                    label: Text('Sign in'),
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
                          decoration: formDecoration.copyWith(
                            hintText: 'Email',
                          ),
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
                            if (val.length < 6)
                              return 'password must be 6+ characters';
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
                          child: Text('Register'),
                          onPressed: () async {
                            if (_formKey.currentState.validate()) {
                              setState(() {
                                loading = true;
                              });
                              dynamic result =
                                  await _auth.registerWithEmailAndPassword(
                                      email, password);

                              if (result == null)
                                setState(() {
                                  error = 'Enter valid email address';
                                  loading = false;
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
                          style: TextStyle(color: Colors.red, fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
  }
}
