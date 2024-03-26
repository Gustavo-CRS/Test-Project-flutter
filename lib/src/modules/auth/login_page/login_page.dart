import 'package:flutter/material.dart';
import 'package:flutter_login_test/src/modules/auth/login_controller/login_controller.dart';
import 'package:flutter_login_test/src/modules/widgets/politics_widget.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class LoginPage extends StatelessWidget {
  final controller = LoginController();
  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xff1e4e62), Color(0xff2d958e)],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(bottom: 8, left: 26),
                    child: Text(
                      'Usuário',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    child: Observer(builder: (_) {
                      return TextFormField(
                        onChanged: controller.setUsername,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.person),
                          iconColor: const Color.fromARGB(255, 0, 0, 0),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      );
                    }),
                  ),
                ],
              ),
              const SizedBox(height: 16.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(bottom: 8, left: 26),
                    child: Text(
                      'Senha',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    child: Observer(builder: (_) {
                      return TextFormField(
                        onChanged: controller.setPassword,
                        obscureText: true,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.lock),
                          iconColor: Colors.black,
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      );
                    }),
                  ),
                ],
              ),
              const SizedBox(height: 28.0),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.4,
                height: MediaQuery.of(context).size.height * 0.05,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(const Color(0xff46bd6f)),
                  ),
                  onPressed: () {
                    if (controller.isValid) {
                      controller.login(context);
                    } else {
                      showDialog(
                        context: context,
                        builder: (context) => const AlertDialog(
                          title: Text('Erro'),
                          content: Text('Usuário ou senha inválidos'),
                        ),
                      );
                    }
                  },
                  child: const Text(
                      style: TextStyle(fontSize: 18, color: Colors.white),
                      'Entrar'),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.12),
              PoliticWidget(onPressed: controller.goToUrl),
            ],
          ),
        ),
      ),
    );
  }
}
