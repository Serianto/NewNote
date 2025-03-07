import 'package:shared_preferences/shared_preferences.dart';

class PreferenceHnadler{
  static const String _id = 'idUser';

  //Menyimpan data user
  static void saveId (String id){
    // ignore: avoid_print
    print('id: $id');
    SharedPreferences.getInstance().then((prefs){
      prefs.setString(_id, id);
    });
  }

  //mendapatkan data use
  static Future getId() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String id = prefs.getString(_id) ?? '';
    return id;
  }

  //menghapus data user
  static void removeId(){
    SharedPreferences.getInstance().then((prefs){
      prefs.remove(_id);
    });
  }
}