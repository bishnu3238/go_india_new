import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../utility/utils.dart';
import '../package/package.dart';

class UserDrawerHeaderClass {
  final String name, email, phone, image;
  dynamic extra;
  static UserDrawerHeaderClass empty = UserDrawerHeaderClass(
      name: '', email: '', phone: '', image: userPlaceHolder);

  UserDrawerHeaderClass(
      {required this.name,
      required this.email,
      required this.phone,
      required this.image,
      this.extra});
}

class UserDetailsDrawerHeader extends StatelessWidget {
  const UserDetailsDrawerHeader({super.key, required this.user});
  final UserDrawerHeaderClass user;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        UserAccountsDrawerHeader(
          accountName: Text(user.name),
          accountEmail: EditButton(
              mainAxis: MainAxisAlignment.start,
              icon: Icons.alternate_email,
              label: user.email), //?? 'Email Address '),
          currentAccountPicture: CircleAvatar(
            backgroundColor: Theme.of(context).colorScheme.background,
            backgroundImage: AssetImage(user.image),
          ),
        ),
        Positioned(
          right: 10,
          top: 10,
          child: FavIcon(
            icon: FontAwesomeIcons.penToSquare,
            iconColor: kLight,
            onTap: () {
              'TODO: go to profile page'.log();

              /// TODO: go to profile page
            },
          ),
        )
      ],
    );
  }
}
