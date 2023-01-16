import 'package:flutter/material.dart';
import 'package:flutter_application_2/utils/routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool changebutton = false;
  final _formKey = GlobalKey<FormState>();


  @override

  
  backToHome(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        changebutton = true;
      });
      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushNamed(context, Routes.homeRoute);
      setState(() {
        changebutton = false;
      });
    }
  } 

  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Image.asset(
                "assets/images/img.png",
                height: 300,
                width: 300,
              ),
              // const SizedBox(height: 10,),
              Text(
                "Welcome $name",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 0.0),
                child: Column(
                  children: [
                    TextFormField(
                        decoration: InputDecoration(
                            hintText: "User Name", labelText: "Enter username"),
                        validator: (value) {
                          if (value != null && value.isEmpty) {
                            return "User name can not be empty";
                          }
                          return null;
                        },
                        onChanged: (value) {
                          name = value;
                          setState(() {});
                        }),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                          hintText: "Password", labelText: "Enter password"),
                      validator: (value) {
                        if (value != null && value.isEmpty) {
                          return "Password can not be empty";
                        } else if (value != null && value.length < 6) {
                          return "Value must be greater than 6";
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 25.0,
                    ),
                    InkWell(
                      onTap: () => backToHome(context),
                      child: AnimatedContainer(
                          duration: Duration(seconds: 1),
                          height: 50,
                          width: changebutton ? 50 : 110,
                          alignment: Alignment.center,
                          child: changebutton
                              ? Icon(
                                  Icons.done,
                                  color: Colors.white,
                                )
                              : Text(
                                  "Login",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.0),
                                ),
                          decoration: BoxDecoration(
                              color: Colors.deepPurple,
                              borderRadius: BorderRadius.circular(
                                  changebutton ? 50 : 10.0))),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
