import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_india/domain/store/store.dart';
import '../../utility/utility/utility.dart';
import '../package/package.dart';

class AppDrawer extends StatelessWidget {
  final List<DrawerItem>? drawerItems;

  const AppDrawer({
    Key? key,
    this.drawerItems,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Drawer(
      width: getScreenWidth(kLayoutWidth / 1.4),
      child: ListView(
        children: [
          const UserDetailsDrawerHeader(),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.shopping_bag_outlined),
            title: const Text('My Rides'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.business),
            title: const Text('Summery'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.notifications_active),
            title: const Text('Notification'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.history),
            title: const Text('History'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.rate_review),
            title: const Text('Reviews'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.point_of_sale),
            title: const Text('Points'),
            onTap: () {},
          ),
          BlocBuilder<ThemeStore, ThemeState>(
            bloc: get<ThemeStore>(),
            builder: (context, state) {
              var bloc = get<ThemeStore>();
              return ListTile(
                leading: const Icon(Icons.dark_mode),
                title: const Text('Dark Mode'),
                trailing: Switch(
                  value: state.themeMode == ThemeMode.dark,
                  onChanged: (value) =>
                      bloc.setTheme(value ? ThemeMode.dark : ThemeMode.light),
                ),
              );
            },
          ),

          BlocBuilder<ThemeStore, ThemeState>(
            bloc: get<ThemeStore>(),
            builder: (context, state) {
              return ListTile(
                leading: const Icon(Icons.logout),
                title: const Text('Log Out'),
                onTap: () => get<AuthRepository>().logOut(),
              );
            },
          ),

          Divider(color: theme.colorScheme.tertiary, height: 1.5),
          HeadLine(headline: 'Info', color: theme.colorScheme.secondary),
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text('About Us'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.confirmation_num_outlined),
            title: const Text('Terms & Condition'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.contact_phone),
            title: const Text('Contact Us'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

class DrawerItem {
  final String title;
  final String subtitle;
  final Widget leading;
  final Widget? custom;
  final VoidCallback onTap;

  const DrawerItem({
    this.title = '',
    this.subtitle = '',
    this.leading = const Icon(Icons.account_circle),
    this.custom,
    required this.onTap,
  });
}
