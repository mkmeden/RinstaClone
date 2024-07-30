
import 'package:chatapp/auth_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../components/my_button.dart';
import '../components/my_textbox.dart';

class Register extends StatelessWidget {

  void Function() toggleLogin;
  Register({super.key , required this.toggleLogin});

  static final usernamecontroller = TextEditingController();
  static final passwordcontroller = TextEditingController();
  static final confirmpasswordcontroller = TextEditingController();


  void register(BuildContext context) {
    final auth = AuthService();

    if(passwordcontroller.text == confirmpasswordcontroller.text)
      {
        try{
          auth.signUpwithEmailPassword(usernamecontroller.text, passwordcontroller.text);
        }

        catch (e){
          showDialog(context: context,
              builder:(context) =>AlertDialog(
                title: Text(e.toString()),
              )
          );
        }
      }

    else
      {
        showDialog(context: context,
            builder:(context) =>AlertDialog(
              title: Text('Passwords dont match'),
            )
        );
      }

  }
  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 100,),
              Center(
                child: Icon(Icons.chat ,
                  color: Theme.of(context).colorScheme.primary,
                  size: 70,),
              ),
              SizedBox(height: 60,),

              Text('Welcome back, you ve been missed' ,

                style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 20
                ),),
              SizedBox(height: 60,),


              MyTextField(hintText: 'Email', obscureText: false,controller: usernamecontroller,),
              SizedBox(height: 10,),
              MyTextField(hintText: 'Password', obscureText: true,controller: passwordcontroller,),
              SizedBox(height: 10,),
              MyTextField(hintText: 'Confirm Password', obscureText: true,controller: confirmpasswordcontroller,),

              SizedBox(height: 10,),
              MyButton(onTap: (){register(context);}, text: 'Register'),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Already a member?' ,
                    style: TextStyle(
                        fontSize: 18,

                        color: Colors.grey.shade500
                    ),
                  ) ,

                  GestureDetector(
                    onTap: toggleLogin,
                    child: Text('Login' ,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.grey.shade900
                      ),
                    ),
                  )
                ],
              )

            ],
          ),
        ),
      ),
    );
  }
}
