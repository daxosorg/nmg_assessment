import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:nmg_assessment/models/post.dart';

class PostController extends GetxController {
  List<Post> allPosts = [];
  Future<List<Post>> fetchAllPosts() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    if (response.statusCode != 200) {
      throw Exception('Failed to load posts');
    }
    final data = jsonDecode(response.body) as List;
    final List<Post> posts = data.map((post) => Post.fromJson(post as Map<String, dynamic>)).toList();
    allPosts = List<Post>.from(posts);
    return posts;
  }

  Future<Post> fetchPostDetail({required int id}) async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts/$id'));
    if (response.statusCode != 200) {
      throw Exception('Failed to load posts detail');
    }
    final data = Post.fromJson(jsonDecode(response.body));
    return data;
  }
}
