import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';


class JsonManager {
  static Future<String> get localPath async {
    late String tempPath;
    if(!kIsWeb) {
      Directory tempDir = await getTemporaryDirectory();
      tempPath = tempDir.path;
    }else{
      tempPath = '';
    }
    final dir = Directory('$tempPath/');
    var status = await Permission.storage.status;
    if (!status.isGranted) {
      await Permission.storage.request();
    }
    if ((await dir.exists())) {
      return dir.path;
    } else {
      dir.create();
      return dir.path;
    }
  }

  /// Can use Cripto for encription
  static Future writeJsonData(JsonDatakey name, Map<String,dynamic> data) async {

    var file;
    // if(flse){
    //   return  sl<SharedPreferences>().setString(name.name,jsonEncode(data));
    // }
    if (Platform.isAndroid) {
      final path = await localPath;
      file = File('$path/$name.json');
    } else if (Platform.isWindows) {
      file = File('./$name.json');
    }else if (Platform.isIOS) {
      final path = await localPath;
      file = File('$path/$name.json');
    }
    return file.writeAsString(data);
  }

  static Future<Map<String,dynamic>?> getJsonData(BuildContext context) async {

    try {
      final jsondata = json.decode(
          await DefaultAssetBundle.of(context).loadString("assets/json/json-data.json")
      );
      return jsondata;
    } catch (e) {
      print("No such file or directory For Json");
      return null;
    }
  }

  static deleteFile(String name) async {
    try {
      // if(true){
      //   return  sl<SharedPreferences>().remove(name);
      // }
      final path = await localPath;
      var file;
      if (Platform.isAndroid) {
        file = File('$path/$name.json');
      } else if (Platform.isWindows) {
        file = File('./$name.json');
      }else if (Platform.isIOS) {
        file = File('$path/$name.json');
      }

      //final file = File('$path/$name.json'); // android build
      // final file = File('./$name.json'); // windows build

      await file.delete();
    } catch (e) {
      return 0;
    }
  }
}
enum JsonDatakey{
  db_config,
}