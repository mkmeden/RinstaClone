import 'package:flutter/material.dart';


class MyTextField extends StatelessWidget {

  final hintText ;
  final controller;
  final obscureText ;

  const MyTextField({super.key, required this.hintText, required this.obscureText, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextField (
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.grey.shade400),

            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white)
            ),

            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade400
                )
            ),
            fillColor: Colors.grey.shade200,
            filled: true

        ),
      ),
    );
  }
}
