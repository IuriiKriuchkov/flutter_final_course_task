import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_final_course_task/common/theme_manager.dart';
import 'login.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final _regFormKey = GlobalKey<FormState>();
  List<String> userInformation = [];
  bool checkedValue = false;
  bool checkboxValue = false;
  final TextEditingController _loginController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  void _saveUserInfo() {
    userInformation.add(_phoneController.text);
    userInformation.add(_passwordController.text);
    userInformation.add(_loginController.text);
    userInformation.add(_emailController.text);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(15),
          margin: const EdgeInsets.all(10),
          alignment: Alignment.center,
          child: Column(
            children: [
              Form(
                key: _regFormKey,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    Stack(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: ThemeManager().avatarBoxDecoration(),
                          child: Icon(
                            Icons.person,
                            color: Colors.grey.shade300,
                            size: 80.0,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.fromLTRB(80, 80, 0, 0),
                          child: Icon(
                            Icons.add_circle,
                            color: Colors.grey.shade700,
                            size: 25.0,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      controller: _loginController,
                      keyboardType: TextInputType.text,
                      autovalidateMode: AutovalidateMode.disabled,
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "Поле не должо быть пустым";
                        } else if (!RegExp(r"^[a-zA-Z](.[a-zA-Z0-9_-]*)$").hasMatch(val)) {
                          return "Введите логин латинскими буквами без символов";
                        } else {
                          return null;
                        }
                      },
                      decoration: const InputDecoration(
                          labelText: 'Логин',
                          hintText: 'Введите логин без символов'),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: _phoneController,
                      keyboardType: TextInputType.phone,
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "Поле не должо быть пустым";
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                          labelText: 'Телефон',
                          hintText: 'Введите номер телефона'),
                    ),
                    const SizedBox(height: 20.0),
                    TextFormField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "Поле не должо быть пустым";
                        } else if (!RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$").hasMatch(val)) {
                          return "Введите корректный email";
                        } else {
                          return null;
                        }
                      },
                      decoration: const InputDecoration(
                          labelText: 'Email', hintText: 'Введите email'),
                    ),
                    const SizedBox(height: 20.0),
                    TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "Поле не должо быть пустым";
                        } else if (!RegExp(r'^(?=.*[0-9])(?=\S+$).{8,40}$').hasMatch(val)) {
                          return "Пароль должен состоять не менее чем из 8 символов, включать буквы, цифры и знаки";
                        } else {
                          return null;
                        }
                      },
                      decoration: const InputDecoration(
                          labelText: 'Пароль', hintText: 'Введите пароль'),
                    ),
                    const SizedBox(height: 15.0),
                    FormField<bool>(
                      builder: (state) {
                        return Column(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Checkbox(
                                    activeColor:
                                        Theme.of(context).colorScheme.primary,
                                    value: checkboxValue,
                                    onChanged: (value) {
                                      setState(() {
                                        checkboxValue = value!;
                                        state.didChange(value);
                                      });
                                    }),
                                const Expanded(
                                  child: Text(
                                    "Я согласен на обработку персональных данных",
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                state.errorText ?? '',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Theme.of(context).errorColor,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                      validator: (value) {
                        if (!checkboxValue) {
                          return 'Без согласия на обработку регистрация невозможна';
                        }
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      child: const Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          "Зарегистрироваться",
                        ),
                      ),
                      onPressed: () async {
                        if (_regFormKey.currentState!.validate()) {
                          _saveUserInfo();
                          final prefs = await SharedPreferences.getInstance();
                          await prefs.setStringList(
                              'userInfo', userInformation);
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Данные успешно сохранены')),
                          );
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                  builder: (context) => const LoginPage()),
                              (Route<dynamic> route) => false);
                        }
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
