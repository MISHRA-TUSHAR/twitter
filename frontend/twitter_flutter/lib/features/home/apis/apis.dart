import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:twitter_flutter/api/endpoints.dart';
import 'package:http/http.dart' as http;
import 'package:twitter_flutter/models/post.dart';

class ApiService {
  static getAllPosts({int? offset}) async {
    try {
      final response = await http.post(
        Uri.parse(getPosts),
      );

      final body = response.body;

      if (response.statusCode == 200) {
        debugPrint("httpResponse: 200");
        final Map<String, dynamic> jsonResponse = json.decode(body);
        if (jsonResponse.containsKey('posts')) {
          List<dynamic> jsonList = jsonResponse['posts'];

          List<Post> posts =
              jsonList.map((json) => Post.fromJson(json)).toList();
          return posts;
        } else {
          debugPrint("Key 'posts' not found in the JSON response");
          return null;
        }
      } else {
        debugPrint(
            "Failed to fetch posts. Status code: ${response.statusCode}");
        return null;
      }
    } catch (err) {
      debugPrint("Error fetching posts: $err");
      return null;
    }
  }
}
