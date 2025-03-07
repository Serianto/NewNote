//import 'dart:ui';

import 'package:aplikasi/home/home.dart';
//import 'package:aplikasi/service/pref_handler.dart';
import 'package:flutter/material.dart';
//import 'package:shared_preferences/shared_preferences.dart';


class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  bool _obscureText = true;
    //final _isActive = true;
    final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          //child: Column(
          children: [
            Opacity(opacity: 0.7,
            child: Image.asset('Asset/bg2.jpg',
            fit: BoxFit.cover,
            width: double.infinity,
            height: MediaQuery.of(context).size.height),),
            Form(
              key: _formKey,
              // padding: const EdgeInsets.symmetric(horizontal: 40),
              // height: MediaQuery.of(context).size.height - 50,
              // width: double.infinity,
               child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      const SizedBox(height: 60.0),
            
                      const Text(
                        "Welcome Back",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Log In Here",
                        style: TextStyle(fontSize: 15, color: Colors.grey[900]),
                      )
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      TextFormField(
                        controller: _usernameController,
                        onChanged: (value){},
                        decoration: InputDecoration(
                            hintText: "Username",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(18),
                                borderSide: BorderSide.none),
                            fillColor: Colors.purple[100],
                            filled: true,
                            prefixIcon: const Icon(Icons.person),

                            ),
                            validator: (value){
                          if (value == null){
                            return 'Silahkan isi nomor terlebih dahulu';
                          }
                          return null;
                        },
                      ),
            
                      const SizedBox(height: 20),
            
                      TextFormField(
                        controller: _passwordController,
                        obscureText: _obscureText,
                        decoration: InputDecoration(
                            hintText: "Password",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(18),
                                borderSide: BorderSide.none),
                            fillColor: Colors.purple[100],
                            filled: true,
                            prefixIcon: Icon(Icons.password),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _obscureText ? Icons.visibility : Icons.visibility_off
                                ),
                            onPressed: (){
                              setState(() {
                                _obscureText = !_obscureText;
                              },
                              );
                            },
                            )
                            ),
                            validator: (value){
                          if (value == null){
                            return 'Silahkan isi nomor terlebih dahulu';
                          }
                          return null;
                        },
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text('Forgot Password', style: TextStyle(color: Colors.white),)
                        ],
                      ),
            
                      const SizedBox(height: 20),
            
                      TextFormField(
                        controller: _phoneController,
                        decoration: InputDecoration(
                          hintText: "Phone",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18),
                              borderSide: BorderSide.none),
                          fillColor: Colors.purple[100],
                          filled: true,
                          prefixIcon: const Icon(Icons.phone),
                        ),
                        validator: (value){
                          if (value == null){
                            return 'Silahkan isi nomor terlebih dahulu';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                  // ListTile(
                  //   leading: Icon(Icons.space_bar),
                  //   title: Text('Login'),
                  //   onTap: () {
                  //     PreferenceHnadler.saveId();
                  //     Navigator.push(context, MaterialPageRoute(builder: (context) => Home(email: _usernameController.text, phone: _phoneController.text)));
                  //   },
                  // ),
                  ElevatedButton(
                    onPressed: () =>Navigator.push(context, MaterialPageRoute(builder: (context) => Home(email: _usernameController.text, phone: _phoneController.text,),)),
                    style: ElevatedButton.styleFrom(
                      shape: const StadiumBorder(),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      backgroundColor: Colors.purple[200]
                    ),
                    child: Text(
                      "Login",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
            
                  const Center(child: Text("Or")),
            
                  Container(
                    height: 45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(
                        color: Colors.purple,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.white,//.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 1,
                          offset: const Offset(0, 1), // changes position of shadow
                        ),
                      ],
                    ),
                    child: TextButton(
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 30.0,
                            width: 30.0,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image:   AssetImage('Asset/google.jpg'),
                                  fit: BoxFit.cover),
                              shape: BoxShape.circle,
                            ),
                          ),
            
                          const SizedBox(width: 18),
            
                          const Text("Log In with Google",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.purple,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text("Not Have Account"),
                      TextButton(
                          onPressed: () {
                          },
                          child: const Text("Sign Up", style: TextStyle(color: Colors.purple),)
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        //)
        ),
      ),
    );
  }

}