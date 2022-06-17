import 'package:dio/dio.dart';
import 'package:ui/models/users_model.dart';

class UsersService {
  static Future<List<Users>> getData() async {
    Response res =
        await Dio().get("https://jsonplaceholder.typicode.com/users/");
    return (res.data as List).map((e) => Users.fromJson(e)).toList();
  }
}