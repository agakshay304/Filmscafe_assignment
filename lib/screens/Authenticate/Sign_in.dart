// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:lapcare/Json/constants.dart';
import 'package:lapcare/services/Auth.dart';
import 'package:lapcare/shared/constants.dart';

import '../../shared/loading.dart';

// ignore: camel_case_types
class Sign_In extends StatefulWidget {
  final Function toggleView;
  const Sign_In({Key? key, required this.toggleView}) : super(key: key);
  @override
  _Sign_InState createState() => _Sign_InState();
}

// ignore: camel_case_types
class _Sign_InState extends State<Sign_In> {
  final AuthServices _auth = AuthServices();
  final _formkey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  String error = '';
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              title: Image.network(
                appicon,
                height: 50,
                width: 100,
              ),
              elevation: 0.0,
            ),
            body: Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
              child: Form(
                key: _formkey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Image.asset(
                      'assets/images/login.png',
                      scale: 2.0,
                    ),
                    //Already Rgistered? heading Text
                    const Text(
                      'ALREADY REGISTERED?',
                      style: TextStyle(
                          fontFamily: 'Pacifico',
                          fontSize: 20,
                          color: Colors.black),
                    ),
                    const SizedBox(height: 20.0),
                    TextFormField(
                      decoration: inputDecoration.copyWith(hintText: 'Email'),
                      validator: (val) =>
                          val!.isEmpty ? 'Please Enter valid Email' : null,
                      onChanged: (val) {
                        setState(() => email = val);
                      },
                    ),
                    const SizedBox(height: 20.0),
                    TextFormField(
                      decoration:
                          inputDecoration.copyWith(hintText: 'Password'),
                      obscureText: true,
                      validator: (val) => val!.length < 6
                          ? 'Please enter 6+ char long password'
                          : null,
                      onChanged: (val) {
                        setState(() => password = val);
                      },
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 40.0,
                      child: RaisedButton(
                          color: Colors.yellow[700],
                          child: const Text(
                            'Log In',
                            style: TextStyle(color: Colors.black),
                          ),
                          onPressed: () async {
                            if (_formkey.currentState!.validate()) {
                              setState(() => loading = true);
                              dynamic result = await _auth
                                  .signInWithEmailAndPassword(email, password);
                              if (result == null) {
                                setState(() {
                                  error = 'Wrong Credentials';
                                  loading = false;
                                });
                              }
                            }
                          }),
                    ),
                    Text(
                      error,
                      style: const TextStyle(
                        fontSize: 20.0,
                        color: Colors.red,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Don\'t have an account?',
                          style: TextStyle(
                            // fontSize: 20.0,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(
                          width: 5.0,
                        ),
                        GestureDetector(
                          onTap: () {
                            widget.toggleView();
                          },
                          child: const Text(
                            'Create Now',
                            style: TextStyle(
                              color: Color(0xFFFDC105),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
