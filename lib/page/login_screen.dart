import 'package:aplikasi/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primary, 
        title: Center(
          child: Text(
            'Login',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold),),
        ),
      ),
      // ignore: avoid_unnecessary_containers
      body: ListView(
        padding: const EdgeInsets.all(8),
          children: [
            Container(
              width: 300,
              height: 300,
              decoration: const BoxDecoration(
                color: Colors.grey,
                shape: BoxShape.circle
              ),
              child: Lottie.asset('Asset/lottielogin.json'),
            ),
            const SizedBox(height: 30),
            TextFormField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.person_outlined),
                labelText: 'Email',
                labelStyle: TextStyle(
                  color: Colors.grey[600]
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8)
                )
              ),
            ),
            SizedBox(height: 8),
            TextFormField(
              obscureText: obscureText,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.key),
                labelText: 'Password',
                labelStyle: TextStyle(
                  color: Colors.grey[600]
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8)
                ),
                suffixIcon: IconButton(
                  icon: Icon(obscureText ? Icons.visibility_off : Icons.visibility),
                  onPressed: (){
                    setState(() {
                      obscureText = !obscureText;
                    });
                  }, 
                )
              ),
            ),
            SizedBox(height: 32),
            ElevatedButton(
              onPressed: (){
                
              }, child: Text('Login')),
            SizedBox(height: 8),
            SizedBox(
              height: 32,
              child: Text(
                'Or',
                textAlign: TextAlign.center,),),
            ElevatedButton(
              onPressed: (){

              }, child: Text('Register'))
          ],
    

      ),
      backgroundColor: Colors.amber,
    );
  }
}