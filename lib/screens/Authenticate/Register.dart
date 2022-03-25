// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:lapcare/services/Auth.dart';
import 'package:lapcare/shared/constants.dart';
import 'package:lapcare/shared/loading.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  const Register({Key? key, required this.toggleView}) : super(key: key);
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthServices _auth = AuthServices();
  final _formkey = GlobalKey<FormState>();
  // text field state
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
            // backgroundColor: Colors.brown[100],
            appBar: AppBar(
              // centerTitle: true,
                backgroundColor: Colors.transparent,
                title:Image.network('https://www.lapcare.com/_next/image?url=https%3A%2F%2Flapcare.sgp1.digitaloceanspaces.com%2Fhome%2Flapcare-logo.png&w=384&q=75',
                  height: 50,
                  width: 100,
                ),
                elevation: 0.0,
                ),
            body: Container(
              padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
              child: Form(
                key: _formkey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Image.asset(
                      'assets/images/login.png',
                      scale: 2.0,
                    ),
                    const Text(
                      'CREATE AN ACCOUNT',
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
                    const SizedBox(height: 20.0),
                    SizedBox(
                      width: double.infinity,
                      height: 40.0,
                      child: RaisedButton(
                          color: Colors.yellow[700],
                          child: const Text(
                            'Register',
                            style: TextStyle(color: Colors.black),
                          ),
                          onPressed: () async {
                            if (_formkey.currentState!.validate()) {
                              setState(() => loading = true);
                            }
                            dynamic result = await _auth
                                .registerWithEmailAndPassword(email, password);
                            if (result == null) {
                              setState(() {
                                error = 'Wrong Credentials';
                                loading = false;
                              });
                            }
                          }),
                    ),
                    // const SizedBox(height: 10.0),          
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
                          'Already Registered?',
                          style: TextStyle(
                            // fontSize: 20.0,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(
                          width: 5.0,
                        ),
                        //Register here will be a clickable button
                        GestureDetector(
                          onTap: () {
                            widget.toggleView();
                          },
                          child:const Text(
                            'Login',
                            style: TextStyle(
                              // decoration: TextDecoration.underline,
                              color:Color(0xFFFDC105),
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