import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget {
  AppBarWidget({
    Key? key,
    required this.isProfile,
  });

  final bool isProfile;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      leading: const Padding(
        padding: EdgeInsets.only(
          left: 16,
          top: 16,
        ),
        child: Text(
          'Linkstagram',
          style: TextStyle(
            color: Colors.black,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      leadingWidth: 200,
      actions: [
        TextButton(
          onPressed: () {},
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                width: 1,
                color: Color(0xffC9CAD1),
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: isProfile != false
                ? const Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 24,
                    ),
                    child: Text(
                      'Home',
                      style: TextStyle(
                        color: Color(0xff808080),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  )
                : Image.network(
                    'https://cdn-icons-png.flaticon.com/512/3135/3135715.png'),
          ),
        ),
      ],
    );
  }
}
