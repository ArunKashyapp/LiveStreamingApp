import 'package:flutter/foundation.dart';
import 'package:livestreaming/models/user_model.dart';

class UserProvider extends ChangeNotifier {
  User _user = User(uid: "", userName: "", email: "");
  User get user => _user;
  setUser(User user) {
    _user = user;
    notifyListeners();
  }
}
