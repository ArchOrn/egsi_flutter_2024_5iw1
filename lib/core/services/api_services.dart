import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flinq/flinq.dart';
import 'package:flutter_5iw1/core/exceptions/api_exception.dart';
import 'package:flutter_5iw1/core/models/product.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  static Future<List<Product>> getProducts() async {
    try {
      final response = await http.get(Uri.parse('https://dummyjson.com/products'));
      await Future.delayed(const Duration(seconds: 1));
      if (response.statusCode < 200 || response.statusCode >= 400) {
        throw ApiException(message: 'Bad request');
      }

      final data = json.decode(response.body)['products'] as List<dynamic>;
      return data.mapList((e) => Product.fromJson(e));
    } on SocketException catch (error) {
      log('Network error.', error: error);
      throw ApiException(message: 'Network error');
    } catch (error) {
      log('An error occurred while fetching products.', error: error);
      throw ApiException(message: 'Unknown error');
    }
  }
}
