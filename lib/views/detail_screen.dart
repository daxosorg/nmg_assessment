import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nmg_assessment/controllers/post_controller.dart';

class DetailScreen extends StatelessWidget {
  DetailScreen({super.key, required this.id});
  int id;

  PostController postController = Get.find<PostController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detail Screen')),
      body: FutureBuilder(
        future: postController.fetchPostDetail(id: id),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Subtitle: ${snapshot.data!.id}"),
                      Text("Title: ${snapshot.data!.title}"),
                      Text("Subtitle: ${snapshot.data!.body}"),
                    ],
                  ),
                ),
              ),
            );
          } else {
            return const Center(child: Text('Loading...'));
          }
        },
      ),
    );
  }
}
