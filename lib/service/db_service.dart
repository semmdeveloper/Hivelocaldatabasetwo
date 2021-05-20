
import 'package:hive/hive.dart';
import 'package:localdatabase2/models/user_models.dart';

class HiveDB{
  static var box=Hive.box('semm');
      //  Sign in
  static storeUser(User user)async{
    await box.put('user',user.toJson());
  }
  static Map<String,dynamic> loadUser(){
    return box.get('user');
  }
  static removeUser()async{
    await box.delete('user');
  }

      //  Sign up
  static storeAccount(User user)async{
    await box.put('user1',user.toJsonAccount());
  }
  static Map<String,dynamic> loadAccount(){
    return box.get('user1');
  }
  static removeAccount()async{
    await box.delete('user1');
  }
}
