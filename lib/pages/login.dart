import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_final_course_task/pages/registration.dart';
import 'package:flutter_final_course_task/pages/users_list.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _loginFormKey = GlobalKey<FormState>();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  List<String> _userInfo = [];

  void _loadInfo() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _userInfo = (prefs.getStringList('userInfo') ?? ['admin', 'admin']);
    });
  }

  @override
  void initState() {
    _loadInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(15),
            margin: const EdgeInsets.all(10),
            alignment: Alignment.center,
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                Image.asset('assets/persons.png'),
                const SizedBox(
                  height: 24,
                ),
                Text(
                  'Добро пожаловать в приложение',
                  style: Theme.of(context).textTheme.headline4,
                  textAlign: TextAlign.center,
                ),
                Form(
                  key: _loginFormKey,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 24,
                      ),
                      TextFormField(
                        controller: _phoneController,
                        keyboardType: TextInputType.text,
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "Введите корректный номер телефона или зарегистрируйтесь";
                          } else {}
                        },
                        decoration: const InputDecoration(
                            labelText: 'Телефон',
                            hintText: 'Введите ваш номер телефона'),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: _passwordController,
                        obscureText: true,
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "Введите верный пароль или зарегистрируйтесь";
                          } else {}
                        },
                        decoration: const InputDecoration(
                            labelText: 'Пароль', hintText: 'Введите пароль'),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        child: const Padding(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            "Войти",
                          ),
                        ),
                        onPressed: () {
                          if (_loginFormKey.currentState!.validate()) {
                            if ((_phoneController.text == _userInfo[0] &&
                                    _passwordController.text == _userInfo[1]) ||
                                (_phoneController.text == 'admin' &&
                                    _passwordController.text == 'admin')) {
                              Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(
                                      builder: (context) => const UsersList()),
                                  (Route<dynamic> route) => false);
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('Неверный логин или пароль')),
                              );
                            }
                          }
                        },
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Text.rich(
                        TextSpan(
                          children: [
                            const TextSpan(text: "У вас нет аккаунта? "),
                            TextSpan(
                              text: 'зарегистрироваться',
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const RegistrationPage(),
                                    ),
                                  );
                                },
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).colorScheme.primary),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
