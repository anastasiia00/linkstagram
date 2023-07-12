import 'package:flutter/material.dart';

class PostGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: posts.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 2.0,
        crossAxisSpacing: 2.0,
      ),
      itemBuilder: (BuildContext context, int index) {
        return Container(
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(posts[index]),
              fit: BoxFit.cover,
            ),
          ),
        );
      },
    );
  }
}

final List<String> posts = [
  'https://picsum.photos/300/300',
  'https://picsum.photos/300/300',
  'https://picsum.photos/300/300',
  'https://picsum.photos/300/300',
  'https://picsum.photos/300/300',
  'https://picsum.photos/300/300',
  'https://picsum.photos/300/300',
];
