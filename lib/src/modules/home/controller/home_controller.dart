import 'package:flutter/material.dart';
import 'package:flutter_login_test/src/modules/widgets/pop_up.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
part 'home_controller.g.dart';

// ignore: library_private_types_in_public_api
class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  TextEditingController textController = TextEditingController();
  _HomeControllerBase() {
    loadText();
  }

  void clearTextField() {
    textController.clear();
  }

  @observable
  String text = '';

  @observable
  Uri _url = Uri.parse('https://www.google.com');

  @observable
  bool showDeleteConfirmation = false;

  @action
  void toggleDeleteConfirmation() {
    showDeleteConfirmation = !showDeleteConfirmation;
  }

  @action
  Future<void> saveText(String input) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (input.isNotEmpty) {
      text = ('${prefs.getString('texto') ?? ''}\n$input');
      prefs.setString('texto', text);
    }
  }

  @action
  Future<void> loadText() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    text = prefs.getString('texto') ?? '';
  }

  @action
  Future<void> removeText() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('texto');
    loadText();
    toggleDeleteConfirmation();
  }

  @action
  Future<void> goToPoliticsPage() async {
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

  void showDeleteConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return PopUpWidget(
          onConfirm: () => removeText(),
          onCancel: () => toggleDeleteConfirmation(),
        );
      },
    );
  }
}
