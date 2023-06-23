import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

class Post extends StatefulWidget {
  const Post({
    Key? key,
    required this.name,
    required this.time,
    required this.avatarProfile,
    required this.description,
    required this.postPhotos,
    this.likesCount,
    this.commentsCount,
  }) : super(key: key);

  final String name;
  final String time;
  final String avatarProfile;
  final String description;
  final List<String> postPhotos;
  final int? likesCount;
  final int? commentsCount;

  @override
  State<Post> createState() => _PostState();
}

class _PostState extends State<Post> {
  bool isLiked = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 0.5,
                        color: const Color(0xffC9CAD1),
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Image.network(
                      widget.avatarProfile,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.name,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        widget.time,
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.25),
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.more_vert_outlined,
                  color: Colors.black.withOpacity(0.25),
                  size: 32,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          AspectRatio(
            aspectRatio: 1,
            child: Container(
              // height: 343,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
              ),
              child: widget.postPhotos.length > 1
                  ? Container(
                      child: Swiper(
                        itemBuilder: (BuildContext context, int index) {
                          print(widget.postPhotos[index]);
                          print(index);
                          final photo = widget.postPhotos[index];
                          return Container(
                            clipBehavior: Clip.hardEdge,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(24),
                            ),
                            child: Image.network(
                              photo,
                              fit: BoxFit.cover,
                              width: 279,
                            ),
                          );
                        },
                        axisDirection: AxisDirection.right,
                        itemCount: widget.postPhotos.length,
                        itemWidth: MediaQuery.of(context).size.width - 32,
                        layout: SwiperLayout.STACK,
                        loop: false,
                        pagination: SwiperPagination(),
                      ),
                    )
                  : Image.network(
                      widget.postPhotos[0],
                      fit: BoxFit.cover,
                      width: 279,
                    ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            widget.description,
            style: const TextStyle(
              color: Color(0xff808080),
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          isLiked = !isLiked;
                        });
                      },
                      child: Row(
                        children: [
                          Icon(
                            Icons.favorite,
                            color: !isLiked
                                ? const Color(0xffC9CAD1)
                                : const Color(0xffFB766E),
                            size: 24,
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                            widget.likesCount != null
                                ? widget.likesCount.toString()
                                : '0',
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 40,
                  ),
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {},
                      child: Row(
                        children: [
                          const Icon(
                            Icons.message,
                            color: Color(0xffC9CAD1),
                            size: 24,
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                            widget.commentsCount != null
                                ? widget.commentsCount.toString()
                                : '0',
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {},
                  child: const Row(
                    children: [
                      Text(
                        'Share',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Icon(
                        Icons.arrow_forward,
                        color: Colors.black,
                        size: 24,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
