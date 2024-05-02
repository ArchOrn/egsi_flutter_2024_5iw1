import 'dart:convert';
import 'dart:developer';

import 'package:flutter_5iw1/core/models/post.dart';
import 'package:flutter_5iw1/core/models/user.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  static Future<List<Post>> getPosts() async {
    try {
      final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

      if (response.statusCode < 200 || response.statusCode >= 400) {
        throw Error();
      }

      final data = json.decode(response.body);
      return (data as List<dynamic>?)?.map((e) => Post.fromJson(e)).toList() ?? [];
    } catch (error) {
      log('Error while retrieving posts.', error: error);
      rethrow;
    }
  }

  static Future<List<User>> getUsers() async {
    try {
      final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

      if (response.statusCode < 200 || response.statusCode >= 400) {
        throw Error();
      }

      final data = json.decode(response.body);
      return (data as List<dynamic>?)?.map((e) => User.fromJson(e)).toList() ?? [];
    } catch (error) {
      log('Error while retrieving users.', error: error);
      rethrow;
    }
  }
}