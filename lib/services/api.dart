import 'dart:convert' as convert;
import 'package:balila_mobile/model/model_post.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../constants/index.dart';

class Api {
  Future<dynamic> request(
      {required String url,
      required MethodApi method,
      Map<String, dynamic>? data}) async {
    try {
      var request = Uri.parse(BASE_URL + url);
      if (kDebugMode) {
        print(request);
      }
      http.Response response;
      switch (method) {
        case MethodApi.get:
          response = await http.get(request);
          break;

        case MethodApi.post:
          response = await http.post(request, body: data);
          break;

        case MethodApi.put:
          response = await http.put(request, body: data);
          break;

        case MethodApi.delete:
          response = await http.delete(request, body: data);
          break;

        default:
          throw Exception('Method is required');
      }
      if (response.statusCode == 200) {
        var jsonResponse = convert.jsonDecode(response.body);
        return jsonResponse;
      } else {
        throw Exception(response);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<dynamic> login() async {
    try {
      var response = await request(url: 'users', method: MethodApi.get);
      return response;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<dynamic> getBanner() async {
    try {
      return await request(url: 'users', method: MethodApi.get);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<dynamic> getCategory() async {
    try {
      return await request(url: 'post', method: MethodApi.get);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<dynamic> getProductNew() async {
    try {
      return await request(url: 'album', method: MethodApi.get);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<List<ModelPost>> getPost() async {
    try {
      List<ModelPost> listPost = <ModelPost>[];
      Iterable response = await request(url: 'posts', method: MethodApi.get);
      listPost = response.map((e) => ModelPost.fromJson(e)).toList();
      return listPost;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
