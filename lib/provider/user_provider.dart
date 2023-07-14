import 'package:flutter/material.dart';

import '../model/user.dart';
import '../resources/auth_methods.dart';

class UserProvider with ChangeNotifier {
  UserClass? _user;
  UserClass get getUser => _user!;
  final AuthMethod _authMethods = AuthMethod();
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> refreshUser() async {
    try {
      _isLoading = true;
      notifyListeners();

      UserClass user = await _authMethods.getUserDetails();
      _user = user;
      _isLoading = false;
      WidgetsBinding.instance!.addPostFrameCallback((_) {
        notifyListeners();
      });
    } catch (error) {
      _isLoading = false;
      WidgetsBinding.instance!.addPostFrameCallback((_) {
        notifyListeners();
      });
      // Handle the error here, you can show an error dialog or display a message on the screen.
      print('Error fetching user: $error');
    }
  }
}
