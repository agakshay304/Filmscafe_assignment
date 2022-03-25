import 'package:flutter/material.dart';
import 'package:lapcare/Models/Users.dart';
import 'package:lapcare/screens/Authenticate/Authenticate.dart';
import 'package:lapcare/screens/Home/home.dart';
import 'package:provider/provider.dart';


class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Users?>(context);
    if (user == null) {
      return Authenticate();
    } else {
      return const Home();
    }
  }
}