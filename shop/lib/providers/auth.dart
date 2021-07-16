import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shop/data/store.dart';
import 'package:shop/exceptions/auth_exception.dart';

class Auth with ChangeNotifier {
  // CHAVE DO FIREBASE
  static const _key = 'AIzaSyDec4joxAG81cu7iM8RKs3H4U4_-N7IHmA';
  String? _token;
  DateTime? _expiryDate;
  String? _userID;
  Timer? _logoutTimer;

  bool get isAuth {
    return token != null;
  }

  String? get userId {
    return isAuth ? _userID : null;
  }

  String? get token {
    if (_token != null &&
        _expiryDate != null &&
        _expiryDate!.isAfter(DateTime.now())) {
      return _token;
    } else {
      return null;
    }
  }

  Future<void> _authenticate(
      String email, String password, String urlSegment) async {
    final _urlSignIn =
        'https://identitytoolkit.googleapis.com/v1/accounts:$urlSegment?key=$_key';
    final Uri uriSignIn = Uri.parse(_urlSignIn);
    final response = await http.post(
      uriSignIn,
      body: json.encode(
        {
          "email": email,
          "password": password,
          "returnSecureToken": true,
        },
      ),
    );
    final responseBody = json.decode(response.body);
    if (responseBody['error'] != null) {
      throw AuthException(responseBody['error']['message']);
    } else {
      _token = responseBody['idToken'];
      _userID = responseBody['localId'];
      _expiryDate = DateTime.now().add(
        Duration(seconds: int.parse(responseBody["expiresIn"])),
      );
      print(DateTime.now().add(
        Duration(seconds: int.parse(responseBody["expiresIn"])),
      ));

      Store.saveMap('userData', {
        "token": _token,
        "userId": _userID,
        "expirydate": _expiryDate!.toIso8601String(),
      });

      _autoLogout();
      notifyListeners();
    }

    return Future.value();
  }

  Future<void> signup(String email, String password) async {
    return _authenticate(email, password, 'signUp');
  }

  Future<void> login(String email, String password) async {
    return _authenticate(email, password, 'signInWithPassword');
  }

  void logout() {
    _token = null;
    _userID = null;
    _expiryDate = null;
    notifyListeners();
  }

  Future<void> tryAutoLogin() async {
    if (isAuth) {
      return Future.value();
    }

    final userData = await Store.getMap('userData');
    if (userData == null) {
      return Future.value();
    }
    final expiryDate = DateTime.parse(userData['expiryDate'].toString());
    if (expiryDate.isBefore(DateTime.now())) {
      return Future.value();
    }

    _userID = userData['userId'];
    _token = userData['token'];
    _expiryDate = expiryDate;

    _autoLogout();
    notifyListeners();
    return Future.value();
  }

  void _autoLogout() {
    if (_logoutTimer != null) {
      _logoutTimer!.cancel();
      _logoutTimer = null;
    }
    final timeToLogout = _expiryDate!.difference(DateTime.now()).inSeconds;
    _logoutTimer = Timer(Duration(seconds: timeToLogout), logout);
  }
}
