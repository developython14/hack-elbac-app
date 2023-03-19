import 'dart:ffi';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

enum Status { Authenticated, Unauthenticated }

class userdata with ChangeNotifier, DiagnosticableTreeMixin {
  String _id = 'id';
  String _username = 'username';
  String _email = 'username';
  String _userimage = 'id';
  String _role = 'id';
  String _password = 'pass';
  Status logging = Status.Unauthenticated;

  String get username => _username;
  String get password => _password;
  String get email => _email;
  String get photo => _userimage;
  String get id => _id;
  String get role => _role;

  void change_id(id) {
    _id = id;
    notifyListeners();
  }

  void change_username(data) {
    _username = data;
    notifyListeners();
  }

  void change_email(data) {
    _email = data;
    notifyListeners();
  }

  void change_photo(data) {
    _userimage = data;
    notifyListeners();
  }

  void change_logging(data) {
    logging = Status.Authenticated;
    notifyListeners();
  }

  void change() async {
    notifyListeners();
  }

  /// Makes `Counter` readable inside the devtools by listing all of its properties
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
  }
}
