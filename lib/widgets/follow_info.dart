// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class FollowInfo extends StatelessWidget {
  const FollowInfo({
    Key? key,
    required this.count,
    required this.followInfo,
  }) : super(key: key);

  final int count;
  final String followInfo;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          count > 1000 ? '${count / 1000} ' + 'K' : count.toString(),
          style: const TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(
          height: 4,
        ),
        Text(
          followInfo,
          style: const TextStyle(
            color: Color(0xffC9CAD1),
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        )
      ],
    );
  }
}
