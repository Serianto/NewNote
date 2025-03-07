import 'package:aplikasi/login/login.dart';
import 'package:aplikasi/utils/screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  // ignore: override_on_non_overriding_member
  List<Widget> slides = screen.map((item) => Container( padding: EdgeInsets.symmetric(horizontal: 18.0),
  child: Column(
    children: [
      Flexible(
        flex: 1, 
        fit: FlexFit.tight,
        child: Image.asset(item['image'], fit: BoxFit.fitWidth, width: 220, alignment: Alignment.bottomCenter,)),
      Flexible(
        flex: 1, 
        fit: FlexFit.tight,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 30), 
          child: Column(
            children: [
              Text(item['header'],
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.w300,
                color: Color(0xFF3F3D56),
                height: 2)),
              Text(item['deskripsi'],
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w400,
                color: Color(0xFF3F3D56),
              ),
              textAlign: TextAlign.center,
              )
            ],
          ),
        ),
        ),
        SizedBox(
          child: ElevatedButton(
            onPressed: () => Navigator.push(item, 
              MaterialPageRoute(builder: (context) => Login())), 
              child: Text('Login')),
        )
    ],
  ),
  )
  )
  .toList();

  // List<Widget> indicator() => List<Widget>.generate(
  //   slides.length,
  //   (index) => Container(
  //     margin: EdgeInsets.symmetric(horizontal:3.0),
  //     height: 10,
  //     width: 10, 
  //     decoration: BoxDecoration(
  //       // ignore: deprecated_member_use
  //       color: currentPage.round() == index ? Color(0xFFFFFFFF) : Color(0xFFFFFFFF).withOpacity(0.2),
  //       borderRadius: BorderRadius.circular(10)
  //     ),
  //   )
  // );

  double currentPage = 1.0;
  final _pageVievController = PageController();

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageVievController,
            itemCount: slides.length,
            itemBuilder: (BuildContext context, int index){
              return slides[index];
            },),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: EdgeInsets.only(top: 70),
                padding: EdgeInsets.symmetric(vertical: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  //children: indicator(),
                ),
              ),
            )
        ],
      ),
    );
  }
}

// import 'package:aplikasi/home/home.dart';
// import 'package:aplikasi/login/login.dart';
// import 'package:aplikasi/service/pref_handler.dart';
// import 'package:aplikasi/utils/image.dart';
// import 'package:flutter/material.dart';

// class SplashScreen extends StatefulWidget {
//   const SplashScreen({super.key});

//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen> {
//   @override
//   void initState(){
//     super.initState();
//     getDataUser;
//   }

//   void getDataUser() async{
//     var userId = await PreferenceHnadler.getId();
//     // ignore: avoid_print
//     print(userId);
//     Future.delayed(Duration(seconds: 1), (){
//       if(userId != ''){
//         // ignore: use_build_context_synchronously
//         Navigator.push(context, MaterialPageRoute(builder: (context) => Home(email: userId, phone: userId),),);
//       }
//       else{
//         // ignore: use_build_context_synchronously
//         Navigator.push(context, MaterialPageRoute(builder: (context) => Login()),);
//       }
//     });
//   }

//   // ignore: annotate_overrides
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: 
//           Image.asset(
//             ImageApp.logo,
//             height: MediaQuery.of(context).size.width * 0.5,
//             width: MediaQuery.of(context).size.width * 0.5,)),
//     );
//   }
// }