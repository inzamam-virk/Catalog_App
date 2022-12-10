import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Column(
        children: [
          const SizedBox(height: 40,),
          Image.asset("assets/images/img.png" ,
          height: 300,
          width: 300,),
          // const SizedBox(height: 10,),
          const Text("Welcome" , style: TextStyle(fontSize: 24 , fontWeight: FontWeight.bold),),
          Padding(
            padding: EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 0.0),
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    hintText: "User Name",
                    labelText: "Enter username"
                  ),
                ),
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                      hintText: "Password", labelText: "Enter password"),
                ),
                SizedBox(height: 25.0,),
                ElevatedButton(onPressed: (){},
                child: Text("Login")),
                
              ],
            ),
          )

        ],
      ),
    );
  }
}
