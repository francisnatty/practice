class User {
  String name;

  User(this.name);
}

abstract class Database {
  void saveUser(User user);
}

class MySQLDatabase extends Database {
  @override
  void saveUser(User user) {
    print('saving user to database');
  }
}

class PostgreSQLDatase extends Database {
  @override
  void saveUser(User user) {
    print('saving user to database');
  }
}
