part of '../app_bar.dart';

class _Mobile extends StatelessWidget {
  const _Mobile({
    super.key,
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
          onPressed: () {
            isProfile
                ? context.router.pushNamed('/home')
                : context.router.pushNamed('/profile');
          },
          child: Container(
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              border: Border.all(
                width: 1,
                color: const Color(0xffC9CAD1),
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: isProfile
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
                    'https://media.sproutsocial.com/uploads/2022/06/profile-picture.jpeg',
                    width: 40,
                    height: 40,
                    fit: BoxFit.cover,
                  ),
          ),
        ),
      ],
    );
  }
}
