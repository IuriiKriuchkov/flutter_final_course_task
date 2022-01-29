class User {
  User({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.address,
    required this.phone,
    required this.website,
    required this.company,
  });

  final int id;
  final String name;
  final String username;
  final String email;
  final Address address;
  final String phone;
  final String website;
  final Company company;

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    name: json["name"],
    username: json["username"],
    email: json["email"],
    address: Address.fromJson(json["address"]),
    phone: json["phone"],
    website: json["website"],
    company: Company.fromJson(json["company"]),
  );

  // Map<String, dynamic> toJson() => {
  //   "id": id,
  //   "name": name,
  //   "username": username,
  //   "email": email,
  //   "address": address.toJson(),
  //   "phone": phone,
  //   "website": website,
  //   "company": company.toJson(),
  // };
}

class Address {
  Address({
    required this.street,
    required this.suite,
    required this.city,
    required this.zipcode,
    required this.geo,
  });

  final String street;
  final String suite;
  final String city;
  final String zipcode;
  final Geo geo;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
    street: json["street"],
    suite: json["suite"],
    city: json["city"],
    zipcode: json["zipcode"],
    geo: Geo.fromJson(json["geo"]),
  );

}

class Geo {
  Geo({
    required this.lat,
    required this.lng,
  });

  final String lat;
  final String lng;

  factory Geo.fromJson(Map<String, dynamic> json) => Geo(
    lat: json["lat"],
    lng: json["lng"],
  );

  // Map<String, dynamic> toJson() => {
  //   "lat": lat,
  //   "lng": lng,
  // };
}

class Company {
  Company({
    required this.name,
    required this.catchPhrase,
    required this.bs,
  });

  final String name;
  final String catchPhrase;
  final String bs;

  factory Company.fromJson(Map<String, dynamic> json) => Company(
    name: json["name"],
    catchPhrase: json["catchPhrase"],
    bs: json["bs"],
  );

  // Map<String, dynamic> toJson() => {
  //   "name": name,
  //   "catchPhrase": catchPhrase,
  //   "bs": bs,
  // };
}

class Task {
  Task({required this.userId, required this.id, required this.title, required this.completed});

  final int userId;
  final int id;
  final String title;
  final bool completed;

  factory Task.fromJson(Map<String, dynamic> json) => Task(
    userId: json["userId"],
    id: json["id"],
    title: json["title"],
    completed: json["completed"],
  );
}