class User {
  String name;

  User(this.name);
}

class MySQLDatabase {
  void saveUser(User user) {
    print('Saving ${user.name} to MySQL');
  }
}

class UserService {
  MySQLDatabase database;

  UserService(this.database);
  void saveUser(User user) {
    database.saveUser(user);
  }
}
