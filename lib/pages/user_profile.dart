import 'package:flutter/material.dart';
import '/widgets/user_task_list.dart';


class UserProfile extends StatelessWidget {
  UserProfile(
      {Key? key,
      required this.name,
      required this.username,
      required this.email,
      required this.phone,
      required this.website,
      required this.heroTag,
      required this.address,
      required this.location,
      required this.company,
      required this.id})
      : super(key: key);

  final int id;
  final String name;
  final String username;
  final String email;
  final String phone;
  final String website;
  final String address;
  final String location;
  final String company;
  final int heroTag;

  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Scrollbar(
        isAlwaysShown: true,
          controller: _scrollController,
          child: SingleChildScrollView(
            controller: _scrollController,
            child: Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Hero(
                      tag: heroTag,
                      child: CircleAvatar(
                        //backgroundColor: Colors.orange,
                        radius: 60,
                        child: Text(
                          name[0],
                          style: Theme.of(context)
                              .textTheme
                              .headline3
                              ?.copyWith(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  Text(
                    name,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Card(
                    child: Container(
                      alignment: Alignment.topLeft,
                      padding: const EdgeInsets.all(15),
                      child: ExpansionTile(
                        title: const Text('Контактные данные'),
                        children: [
                          ListTile(
                            leading: const Icon(
                              Icons.person,
                              size: 40,
                            ),
                            title: const Text("Никнейм"),
                            subtitle: Text(username),
                          ),
                          const Divider(
                            color: Colors.grey,
                          ),
                          ListTile(
                            leading: const Icon(
                              Icons.email,
                              size: 40,
                            ),
                            title: const Text("E-mail"),
                            subtitle: Text(email),
                          ),
                          const Divider(
                            color: Colors.grey,
                          ),
                          ListTile(
                            leading: const Icon(
                              Icons.phone,
                              size: 40,
                            ),
                            title: const Text("Телефон"),
                            subtitle: Text(phone),
                          ),
                          const Divider(
                            color: Colors.grey,
                          ),
                          ListTile(
                            leading: const Icon(
                              Icons.web,
                              size: 40,
                            ),
                            title: const Text("Веб-сайт"),
                            subtitle: Text(website),
                          ),
                          const Divider(
                            color: Colors.grey,
                          ),
                          ListTile(
                            leading: const Icon(
                              Icons.account_balance_outlined,
                              size: 40,
                            ),
                            title: const Text("Компания и должность"),
                            subtitle: Text(company),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Card(
                    child: Container(
                      alignment: Alignment.topLeft,
                      padding: const EdgeInsets.all(15),
                      child: ExpansionTile(
                        title: const Text(
                          'Месторасположение',
                        ),
                        children: [
                          ListTile(
                            leading: const Icon(
                              Icons.home,
                              size: 40,
                            ),
                            title: const Text("Адрес"),
                            subtitle: Text(address),
                          ),
                          const Divider(
                            color: Colors.grey,
                          ),
                          ListTile(
                            leading: const Icon(
                              Icons.location_on,
                              size: 40,
                            ),
                            title: const Text("Локация"),
                            subtitle: Text(location),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Card(
                    child: Container(
                      alignment: Alignment.topLeft,
                      padding: const EdgeInsets.all(15),
                      child: ExpansionTile(
                        title: const Text(
                          'Список задач',
                        ),
                        children: [
                          TaskList(id: id),
                        ],
                      ),
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
