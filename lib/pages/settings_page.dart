import 'package:chatapp/theme/theme_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});




  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, val , child) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: Theme.of(context).colorScheme.background,
            appBar: AppBar(
              backgroundColor: Theme.of(context).colorScheme.background,
              
              title: Text('S E T T I N G S' ,
              style: TextStyle(
                color: Theme.of(context).colorScheme.inversePrimary
              ),
              ),
              centerTitle: true,
            ),
          
            body: Container(
              margin: EdgeInsets.all(20),
              padding: EdgeInsets.all(9),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                borderRadius: BorderRadius.circular(10)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Dark Mode',
                    style: TextStyle(
                      fontSize: 20,
                        color: Theme.of(context).colorScheme.inversePrimary
                    ),
                  ),
                  CupertinoSwitch(value: val.isDarkMode(), onChanged: (value){

                    val.toggleTheme();

                  })
                ],
              ),
            ),
          ),
        );
      }
    );
  }
}
