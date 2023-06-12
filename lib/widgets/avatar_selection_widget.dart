import 'package:flutter/material.dart';

class AvatarSelectionWidget extends StatefulWidget {
  @override
  _AvatarSelectionWidgetState createState() => _AvatarSelectionWidgetState();
}

class _AvatarSelectionWidgetState extends State<AvatarSelectionWidget> {
  String? selectedAvatar;

  List<String> avatars = [
    'assets/avatar1.png',
    'assets/avatar2.png',
    'assets/avatar3.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Choose your avatar ',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: avatars
              .map(
                (avatar) => GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedAvatar = avatar;
                    });
                  },
                  child: Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: selectedAvatar == avatar
                            ? Colors.blue
                            : Colors.white,
                        width: 2,
                      ),
                      image: DecorationImage(
                        image: AssetImage(avatar),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              )
              .toList(),
        ),
        SizedBox(height: 16),
        Text(
          'Selected avatar:',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8),
        selectedAvatar != null
            ? CircleAvatar(
                radius: 40,
                backgroundImage: AssetImage(selectedAvatar ?? ''),
              )
            : Text('Аватар не выбран'),
      ],
    );
  }
}
