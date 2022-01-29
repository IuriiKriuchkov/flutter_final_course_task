import 'package:flutter/material.dart';
import 'package:flutter_final_course_task/pages/login.dart';
import 'package:flutter_final_course_task/pages/my_profile.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
            ),
            child: const Text(' '),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Домашний экран'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.mail),
            title: const Text('Сообщения'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.task),
            title: const Text('Задачи'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          const Divider(color: Colors.grey,),
          const Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.only(
                left: 10,
              ),
              child: Text('Профиль'),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Мой профиль'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                  const MyProfilePage(),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: const Text('Выйти из аккаунта'),
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                    builder: (context) => const LoginPage(),
                  ),
                  (Route<dynamic> route) => false);
            },
          ),
        ],
      ),
    );
  }
}
