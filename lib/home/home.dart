import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key , required this.email, required this.phone});
  
  final String title = 'Halaman Awal';
  final String email;
  final String phone;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text('email = $email', style: TextStyle(color: Colors.amber),),
          Text('phone = $phone'),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset('Asset/google.jpg'),
                SizedBox(height: 15,),
                Text('Nama')
              ],
            ),
            ),
            ListTile(
              leading: Icon(Icons.add_box),
              title: Text('home'),
            )
          ],
        ),
      ),
      appBar: AppBar(
        title: Text(title),
      ),
    );
  }
}