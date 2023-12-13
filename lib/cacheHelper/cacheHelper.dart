import 'package:shared_preferences/shared_preferences.dart';
class CacheHelper {

  static late SharedPreferences sharedPreferences;
  static dynamic CacheIntialization()async{
     sharedPreferences=await SharedPreferences.getInstance();
  }
static Future<bool> SetData({
    required String key,
   required dynamic value,
})async{
   if(value is int) {await sharedPreferences.setInt(key, value);
   return true;}
   if(value is bool) {
     await sharedPreferences.setBool(key, value);
   return true;
   }
   if(value is double) {
     await sharedPreferences.setDouble(key, value);
   return true;
   }
   if(value is String) {
     await sharedPreferences.setString(key, value);
   return true;
   }
   return false;

 }

static dynamic getData ({
   required String key,
}){
return sharedPreferences.get(key);
 }
  static String? getStr (
    String key,
  ){
    return sharedPreferences.getString(key);
  }
static Future<bool> DeleteItem({
  required String key,

})async{
  return await sharedPreferences.remove(key);
}
static Future<bool> clearItems ()async{
  return await sharedPreferences.clear();
}
}