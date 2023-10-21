import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nmg_assessment/controllers/post_controller.dart';
import 'package:nmg_assessment/views/detail_screen.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    PostController postController = Get.put(PostController());
    return Scaffold(
      appBar: AppBar(title: const Text('Home Screen')),
      body: Padding(
        padding: const EdgeInsets.all(28),
        child: FutureBuilder(
          future: postController.fetchAllPosts(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  return snapshot.data == null
                      ? const Text('null')
                      : InkWell(
                          onTap: () => Get.to(() => DetailScreen(id: snapshot.data![index].id ?? 1)),
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(snapshot.data![index].title ?? 'null'),
                            ),
                          ),
                        );
                },
              );
            } else {
              return const Center(child: Text('Loading...'));
            }
          },
        ),
      ),
    );
  }
}
