import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:url_launcher/url_launcher.dart';

part 'login_controller.g.dart';

// ignore: library_private_types_in_public_api
class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  @observable
  String username = '';

  @observable
  String password = '';

  @observable
  Uri _url = Uri.parse('https://www.google.com');

  @computed
  bool get isValid {
    if (username.trim().isEmpty || password.trim().isEmpty) {
      return false;
    }
    if (password.length < 2 || password.length > 20 || username.length > 20) {
      return false;
    }
    if (password.contains(RegExp(r'[^\w\d]'))) {
      return false;
    }
    if (username.endsWith(' ') || password.endsWith(' ')) {
      return false;
    }
    return true;
  }

  @action
  void setUsername(String value) {
    username = value;
  }

  @action
  void setPassword(String value) {
    password = value;
  }

  @action
  Future<void> goToUrl() async {
    try {
      if (!await launchUrl(_url)) {
        throw Exception('Could not launch $_url');
      }
    } catch (e) {
      // ignore: avoid_print
      print('Erro ao abrir URL: $e');
      // Trate o erro aqui conforme necessário
    }
  }

  @action
  Future<void> login(BuildContext context) async {
    Navigator.pushNamed(context, '/homePage');
  }
}
