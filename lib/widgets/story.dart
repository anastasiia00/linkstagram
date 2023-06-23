import 'package:flutter/material.dart';
import 'package:linkstagram/responsive/responsive_layout_screen.dart';
import 'package:linkstagram/widgets/avatar_item/avatar_item.dart';

class Story extends StatelessWidget {
  const Story({
    super.key,
    required this.size,
  });

  final double size;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: const EdgeInsets.only(
              bottom: 24,
            ),
            child: Row(
              children: [
                AvatarItem(
                  image: 'https://picsum.photos/300/300',
                  size: size,
                ),
                AvatarItem(
                  image: 'https://picsum.photos/300/300',
                  size: size,
                ),
                AvatarItem(
                  image: 'https://picsum.photos/300/300',
                  size: size,
                ),
                AvatarItem(
                  image: 'https://picsum.photos/300/300',
                  size: size,
                ),
                AvatarItem(
                  image: 'https://picsum.photos/300/300',
                  size: size,
                ),
                AvatarItem(
                  image: 'https://picsum.photos/300/300',
                  size: size,
                ),
                AvatarItem(
                  image: 'https://picsum.photos/300/300',
                  size: size,
                ),
                AvatarItem(
                  image: 'https://picsum.photos/300/300',
                  size: size,
                ),
                AvatarItem(
                  image: 'https://picsum.photos/300/300',
                  size: size,
                ),
                AvatarItem(
                  image: 'https://picsum.photos/300/300',
                  size: size,
                ),
                AvatarItem(
                  image: 'https://picsum.photos/300/300',
                  size: size,
                ),
              ],
            ),
          ),
        ),
        Positioned(
          right: 0,
          child: IgnorePointer(
            ignoring: true,
            child: Container(
              width: 200,
              height: size + 4,
              decoration: BoxDecoration(
                boxShadow: null,
                gradient: LinearGradient(
                  colors: [
                    const Color(0xffE5E5E5),
                    const Color(0xffE5E5E5).withOpacity(0.6),
                    const Color(0xffE5E5E5).withOpacity(0.0),
                  ],
                  begin: Alignment.centerRight,
                  end: Alignment.centerLeft,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
