import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {

  void Function()? onTap ;
  String text ;
  MyButton({super.key, required this.onTap , required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Container(
          margin: EdgeInsets.all(10),
          width: double.infinity,
          height: 70,

          decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(5)
          ),

          child: Center(
            child: Text(
              text,
              style: TextStyle(
                  color: Colors.white
              ),
            ),
          ),
        ),
      ),
    );
  }
}
