import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});
  final imgurl =
      "https://media-exp1.licdn.com/dms/image/C4D03AQFJFWZk_7V4-g/profile-displayphoto-shrink_800_800/0/1652760618410?e=2147483647&v=beta&t=WH83KUtzphsH2qp_Roc4wHs4ArREzZWiEPyPxsrLeng";

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.deepPurple,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                accountName: Text("Inzamam Virk"),
                accountEmail: Text("inzi69107@gmail.com"),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(imgurl),
                ),
                decoration: BoxDecoration(color: Colors.deepPurple),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home , color: Colors.white,),
              title: Text(
                'Home',
                textScaleFactor: 1.0,
                selectionColor: Colors.white,
                style: TextStyle(
                  color: Colors.white
              ),
              ),
              
              // onTap: () {
              //   setState(() {
              //     txt = 'List Tile pressed';
              //   });
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.profile_circled,
                color: Colors.white,
              ),
              title: Text(
                'Profile',
                textScaleFactor: 1.0,
                selectionColor: Colors.white,
                style: TextStyle(color: Colors.white),
              ),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.mail,
                color: Colors.white,
              ),
              title: Text(
                'Email',
                textScaleFactor: 1.0,
                selectionColor: Colors.white,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
