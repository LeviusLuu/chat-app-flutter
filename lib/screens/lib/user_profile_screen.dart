import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/models.dart';
import '../../providers/providers.dart';
import '../../widgets/widgets.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  late UserModel? user;

  @override
  void initState() {
    super.initState();

    Provider.of<UserSessionProvider>(context, listen: false).addListener(() {
      setState(() {});
    });
    user = Provider.of<UserSessionProvider>(context, listen: false).user;
  }

  @override
  Widget build(BuildContext context) {
    Size maxSize = MediaQuery.of(context).size;
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: colorScheme.background,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 3,
            blurRadius: 2,
            offset: const Offset(2, 3),
          ),
        ],
      ),
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 120),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///Cover Photo
            Stack(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: maxSize.height * 0.4,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                        bottom: Radius.circular(12)),
                    child: FittedBox(
                      fit: BoxFit.fill,
                      child: Image.asset("assets/images/Demo.jpeg"),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 10,
                  right: 20,
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 7, horizontal: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: const Row(
                        children: [
                          Icon(Icons.camera_alt),
                          SizedBox(width: 8),
                          Text(
                            "Edit cover photo",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                              fontSize: 14,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),

            ///Avatar and Fullname
            Transform.translate(
                offset: const Offset(30, -70),
                child: Row(children: [
                  Stack(
                    children: [
                      ClipPath(
                        clipper: CustomHalfCircleClipper(),
                        child: ClipOval(
                          child: Container(
                            height: 170,
                            width: 170,
                            decoration: BoxDecoration(
                              color: colorScheme.background,
                              borderRadius: BorderRadius.circular(40),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 5,
                        left: 5,
                        child: CircleAvatar(
                          radius: 80,
                          child: Text(user!.avatar),
                        ),
                      ),
                      Positioned(
                        right: 10,
                        bottom: 10,
                        child: Container(
                          width: 35,
                          height: 35,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: colorScheme.onBackground,
                          ),
                          child: IconButton(
                            color: colorScheme.onSecondary,
                            onPressed: () {},
                            icon: const Icon(
                              Icons.camera_alt,
                              size: 20,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  Expanded(
                      child: Padding(
                          padding: const EdgeInsets.only(
                              top: 25, left: 10, right: 50),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(user!.fullname,
                                    style: const TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold)),
                                InkWell(
                                    onTap: () {
                                      showDialog(
                                          useSafeArea: true,
                                          context: context,
                                          builder: (context) =>
                                              EditProfileDialog(
                                                  scaffoldKey: scaffoldKey));
                                    },
                                    child: Container(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 7, horizontal: 10),
                                        decoration: BoxDecoration(
                                            color: colorScheme.onBackground,
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        child: const Row(children: [
                                          Icon(Icons.edit, size: 20),
                                          SizedBox(width: 8),
                                          Text("Edit profile",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 14))
                                        ])))
                              ])))
                ])),

            ///About user
            Transform.translate(
              offset: const Offset(0, -60),
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    color: colorScheme.outlineVariant,
                    height: 1,
                    width: double.infinity,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: colorScheme.onBackground.withOpacity(0.7),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 20),
                    child: AboutUser(colorScheme: colorScheme),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AboutUser extends StatefulWidget {
  const AboutUser({
    super.key,
    required this.colorScheme,
  });

  final ColorScheme colorScheme;

  @override
  State<AboutUser> createState() => _AboutUserState();
}

class _AboutUserState extends State<AboutUser> {
  late UserModel? user;
  @override
  void initState() {
    super.initState();

    Provider.of<UserSessionProvider>(context, listen: false).addListener(() {
      setState(() {});
    });

    user = Provider.of<UserSessionProvider>(context, listen: false).user;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(bottom: 10),
          child: Text(
            "Infomation person",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Row(
                    children: [
                      Text(
                        "Gender",
                        style: TextStyle(
                            fontSize: 16,
                            color: widget.colorScheme.onSecondary),
                      ),
                      const SizedBox(width: 40),
                      Text(
                        user!.gender,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Row(
                    children: [
                      Text(
                        "Birthday",
                        style: TextStyle(
                            fontSize: 16,
                            color: widget.colorScheme.onSecondary),
                      ),
                      const SizedBox(width: 40),
                      Text(
                        user!.birthday,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Row(
                    children: [
                      Text(
                        "Email",
                        style: TextStyle(
                            fontSize: 16,
                            color: widget.colorScheme.onSecondary),
                      ),
                      const SizedBox(width: 40),
                      Text(
                        user!.email,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Row(
                    children: [
                      Text(
                        "Numberphone",
                        style: TextStyle(
                            fontSize: 16,
                            color: widget.colorScheme.onSecondary),
                      ),
                      const SizedBox(width: 40),
                      Text(
                        user!.phoneNumber,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        )
      ],
    );
  }
}

class CustomHalfCircleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final Path path = Path();
    path.lineTo(0, size.height / 2);
    path.lineTo(size.width, size.height / 2);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
