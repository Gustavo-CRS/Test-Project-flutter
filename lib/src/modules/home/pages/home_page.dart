import 'package:flutter/material.dart';
import 'package:flutter_login_test/src/modules/home/controller/home_controller.dart';
import 'package:flutter_login_test/src/modules/widgets/politics_widget.dart';
import 'package:flutter_login_test/src/modules/widgets/pop_up.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class HomePage extends StatelessWidget {
  final HomeController controller = HomeController();

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.transparent,
      body: Expanded(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xff1e4e62), Color(0xff2d958e)],
            ),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Observer(
                      builder: (_) => SizedBox(
                        height: 380,
                        width: 360,
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          color: Colors.white,
                          child: controller.showDeleteConfirmation
                              ? PopUpWidget(
                                  onConfirm: controller.removeText,
                                  onCancel: controller.toggleDeleteConfirmation,
                                )
                              : Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Padding(
                                          padding: EdgeInsets.all(12.0),
                                          child: Text(
                                            'Texto digitado 1',
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        const SizedBox(width: 21),
                                        IconButton(
                                          onPressed: () {},
                                          icon: const Icon(
                                            Icons.mode_edit_rounded,
                                            size: 40,
                                            color: Colors.black,
                                          ),
                                        ),
                                        IconButton(
                                          onPressed: controller
                                              .toggleDeleteConfirmation,
                                          icon: const Icon(
                                            Icons.cancel,
                                            color: Colors.red,
                                            size: 40,
                                          ),
                                        )
                                      ],
                                    ),
                                    const Divider(
                                      color: Color.fromARGB(255, 205, 201, 201),
                                      thickness: 1,
                                      indent: 20,
                                      endIndent: 20,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          bottom: 32, left: 20),
                                      child: Observer(builder: (_) {
                                        return Text(
                                          controller.text,
                                          style: const TextStyle(
                                              fontSize: 19,
                                              fontWeight: FontWeight.normal),
                                        );
                                      }),
                                    ),
                                  ],
                                ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.only(top: 28),
                      child: SizedBox(
                        width: 360,
                        child: Observer(
                          builder: (_) => TextFormField(
                            controller: controller.textController,
                            focusNode: FocusNode(),
                            textAlign: TextAlign.center,
                            onFieldSubmitted: (value) {
                              controller.saveText(value);
                              controller.clearTextField();
                            },
                            decoration: InputDecoration(
                              hintText: 'Digite o texto aqui',
                              hintStyle: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none,
                              ),
                            ),
                            autofocus: true,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.14,
                    ),
                    PoliticWidget(onPressed: controller.goToPoliticsPage)
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
