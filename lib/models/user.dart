class LoggedinUser {
  bool isLoggedIn = false;
  String name = '';
  String email = "";

  LoggedinUser({
    this.isLoggedIn = false,
    this.name = '',
    this.email = '',
  });

  LoggedinUser gLoggedinUser = LoggedinUser();
}
