// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class AddPostWebLayout extends StatefulWidget {
  const AddPostWebLayout({
    Key? key,
    this.onFileChanged,
  }) : super(key: key);

  final Function(String)? onFileChanged;

  @override
  State<AddPostWebLayout> createState() => _AddPostWebLayoutState();
}

class _AddPostWebLayoutState extends State<AddPostWebLayout> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
