import 'package:flutter/material.dart';
import 'package:flutter_final_course_task/common/theme_manager.dart';
import 'package:flutter_final_course_task/pages/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyProfilePage extends StatefulWidget {
  const MyProfilePage({Key? key}) : super(key: key);

  @override
  _MyProfilePageState createState() => _MyProfilePageState();
}

class _MyProfilePageState extends State<MyProfilePage> {
  List<String>? _userInfo;

  void _loadCounter() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _userInfo = (prefs.getStringList('userInfo'));
    });
  }

  @override
  void initState() {
    _loadCounter();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Мой профиль'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                    builder: (context) => const LoginPage(),
                  ),
                  (Route<dynamic> route) => false);
            },
            icon: const Icon(Icons.exit_to_app),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 30,
              ),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: ThemeManager().avatarBoxDecoration(),
                child: Icon(
                  Icons.person,
                  color: Colors.grey.shade300,
                  size: 80.0,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Card(
                child: Container(
                  alignment: Alignment.topLeft,
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    children: <Widget>[
                      ...ListTile.divideTiles(
                        color: Theme.of(context).colorScheme.secondary,
                        tiles: [
                          ListTile(
                            leading: const Icon(
                              Icons.person,
                              size: 40,
                            ),
                            title: const Text("Никнейм"),
                            subtitle: Text(_userInfo?.elementAt(2) ?? ""),
                          ),
                          ListTile(
                            leading: const Icon(
                              Icons.email,
                              size: 40,
                            ),
                            title: const Text("E-mail"),
                            subtitle: Text(_userInfo?.elementAt(3) ?? ""),
                          ),
                          ListTile(
                            leading: const Icon(
                              Icons.phone,
                              size: 40,
                            ),
                            title: const Text("Телефон"),
                            subtitle: Text(_userInfo?.elementAt(0) ?? ""),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
