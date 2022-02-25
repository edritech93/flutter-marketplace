import 'package:balila_mobile/components/item_post.dart';
import 'package:balila_mobile/model/model_post.dart';
import 'package:balila_mobile/providers/post.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PostPage extends StatefulWidget {
  const PostPage({Key? key}) : super(key: key);

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      context.read<PostProvider>().getPostRequest(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Post'),
      ),
      body: ListView.builder(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
          itemCount: context.watch<PostProvider>().dataPost.length,
          itemBuilder: (BuildContext context, int index) {
            ModelPost item = context.read<PostProvider>().dataPost[index];
            return ItemPost(item: item);
          }),
    );
  }
}
