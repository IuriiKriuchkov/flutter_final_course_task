import 'package:flutter_final_course_task/pages/user_profile.dart';
import 'package:flutter_final_course_task/widgets/navigation_drawer.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_final_course_task/module/api.dart';
import 'package:flutter_final_course_task/module/json.dart';

class UsersList extends StatefulWidget {
  const UsersList({Key? key}) : super(key: key);

  @override
  createState() => _UsersListState();
}

class _UsersListState extends State {
  late Future<List<User>> shows;
  String searchString = "";

  @override
  void initState() {
    super.initState();
    shows = fetchUsers(http.Client());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavigationDrawer(),
      appBar: AppBar(
        title: const Text('Cписок пользователей'),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  searchString = value.toLowerCase();
                });
              },
              decoration: const InputDecoration(
                labelText: 'Search',
                suffixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Expanded(
            child: FutureBuilder<List<User>>(
              future: fetchUsers(http.Client()),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(
                    child: Text(
                      'Произошла ошибка! Причина: ${snapshot.error}',
                      textAlign: TextAlign.center,
                    ),
                  );
                } else if (snapshot.hasData) {
                  var _usersData = snapshot.data!;
                  return Center(
                    child: ListView.builder(
                      itemCount: _usersData.length,
                      itemBuilder: (context, index) {
                        return snapshot.data![index].name
                                .toLowerCase()
                                .contains(searchString)
                            ? Card(
                                margin:
                                    const EdgeInsets.fromLTRB(20, 10, 20, 5),
                                child: ListTile(
                                  title: Text(_usersData[index].name),
                                  subtitle: Text(_usersData[index].email),
                                  leading: Hero(
                                    tag: _usersData[index].id,
                                    child: CircleAvatar(
                                        child: Text(_usersData[index].name[0])),
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => UserProfile(
                                          id: _usersData[index].id,
                                          name: _usersData[index].name,
                                          username: _usersData[index].username,
                                          email: _usersData[index].email,
                                          phone: _usersData[index].phone,
                                          website: _usersData[index].website,
                                          heroTag: _usersData[index].id,
                                          address:
                                              '${_usersData[index].address.suite}\n${_usersData[index].address.street}\n${_usersData[index].address.city}\n${_usersData[index].address.zipcode}',
                                          location:
                                              '${_usersData[index].address.geo.lat}, ${_usersData[index].address.geo.lng}',
                                          company:
                                              '${_usersData[index].company.name}\n${_usersData[index].company.catchPhrase}\n${_usersData[index].company.bs}\n',
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              )
                            : Container();
                      },
                    ),
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
