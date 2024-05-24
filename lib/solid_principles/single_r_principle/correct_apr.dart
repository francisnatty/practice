class User {
  String name;
  String email;

  User(this.name, this.email);
}

class UserRepository {
  void saveUserToDatabase(User user) {
    //save user do database
  }
}

class UserView {
  void showWelcomeMessage(User user) {
    print('welcome, ${user.name}');
  }
}

/** In the refactored solution, we have
separated the responsibilities into three
different classes: User,
UserRepository, and UserView.
3. User class is responsible for holding
user data, UserRepository class is
responsible for saving user data to the
database, and UserView class is
responsible for displaying a welcome
message to the user. */
