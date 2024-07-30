import 'package:chatapp/pages/settings_page.dart';
import 'package:flutter/material.dart';

import '../auth_service.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,

      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          DrawerHeader(
            child: Icon(Icons.chat ,
            size: 42,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),

          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: ListTile(
                  leading: Icon(Icons.home , color: Colors.grey.shade700,),
                  title: Text('H O M E' ,
                    style: TextStyle(
                        color: Colors.grey.shade700
                    ),
                  ),

                  onTap: (){
                    Navigator.pop(context);

                  },

                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: ListTile(
                  leading: Icon(Icons.settings , color: Colors.grey.shade700,),
                  title: Text('S E T T I N G S ' ,
                    style: TextStyle(
                        color: Colors.grey.shade700
                    ),
                  ),
                onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Settings()));                },
                ),

              ),
            ],
          ),

          SizedBox(height: 400,),
          Padding(
            padding: const EdgeInsets.only(left: 30),
            child: ListTile(
              leading: Icon(Icons.logout , color: Colors.grey.shade700,),
              title: Text('L O G O U T' ,
                style: TextStyle(
                    color: Colors.grey.shade700
                ),
              ),
              onTap: (){
                Navigator.pop(context);
                AuthService authService = AuthService();
                authService.signOut();
              },

            ),
          )

        ],
      ),
    );
  }
}
