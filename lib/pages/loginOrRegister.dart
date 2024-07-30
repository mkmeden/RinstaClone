import 'package:chatapp/pages/login_page.dart';
import 'package:chatapp/pages/register_page.dart';
import 'package:flutter/material.dart';

class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({super.key});

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {

  bool isLogin = true;

  @override
  Widget build(BuildContext context) {


    void toggleLogin() {
      setState(() {
        isLogin = !isLogin;
      });
    }

    if(isLogin)
    {
      return Login(toggleLogin: toggleLogin,);
    }

    else
    {
      return Register(toggleLogin: toggleLogin,);
    }
  }
}
