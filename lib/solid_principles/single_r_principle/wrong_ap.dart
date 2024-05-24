class User {
  String name;
  String email;

  User(this.email, this.name);

  void saveUserToDatabase() {
    //save user to the database
  }
  void showWelcomeMessage() {
    print('welcome, $name');
  }
}

/**  The original code violates the Single
///Responsibility Principle because the
///User class had more than one
responsibility: holding user data, saving
user data to the database, and displaying
a welcome message to the user. This
makes the class harder to maintain and
modify in the future **/