// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class AccountInfoWidget extends StatelessWidget {
  const AccountInfoWidget({
    Key? key,
    required this.name,
    this.profession,
    this.description,
  }) : super(key: key);

  final String name;
  final String? profession;
  final String? description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 36),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                name,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              profession != null
                  ? Row(
                      children: [
                        const SizedBox(
                          width: 8,
                        ),
                        const Text(
                          ' - ',
                          style: TextStyle(
                            color: Colors.black38,
                          ),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          profession!,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    )
                  : SizedBox()
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          description != null
              ? Text(
                  description!,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff808080),
                  ),
                )
              : SizedBox()
        ],
      ),
    );
  }
}
