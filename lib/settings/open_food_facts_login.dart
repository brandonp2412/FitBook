import 'package:drift/drift.dart';
import 'package:fit_book/database/database.dart';
import 'package:fit_book/main.dart';
import 'package:fit_book/settings/settings_state.dart';
import 'package:flutter/material.dart' as material;
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:provider/provider.dart';

class OpenFoodFactsLogin extends StatefulWidget {
  const OpenFoodFactsLogin({
    super.key,
  });

  @override
  State<OpenFoodFactsLogin> createState() => _OpenFoodFactsLoginState();
}

class _OpenFoodFactsLoginState extends State<OpenFoodFactsLogin> {
  final login = TextEditingController();
  final password = TextEditingController();

  @override
  void initState() {
    super.initState();
    onMount();
  }

  onMount() async {
    final settings = context.read<SettingsState>().value;
    login.text = settings.offLogin ?? '';
    password.text = settings.offPassword ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) {
            bool loggingIn = false;

            return StatefulBuilder(
              builder: (context, setState) => AlertDialog(
                title: const Text("Open food facts"),
                content: SingleChildScrollView(
                  child: material.Column(
                    children: [
                      TextField(
                        decoration:
                            const InputDecoration(labelText: 'Username'),
                        controller: login,
                      ),
                      TextField(
                        decoration:
                            const InputDecoration(labelText: 'Password'),
                        obscureText: true,
                        enableSuggestions: false,
                        autocorrect: false,
                        controller: password,
                      ),
                    ],
                  ),
                ),
                actions: [
                  TextButton.icon(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.close),
                    label: const Text("Close"),
                  ),
                  TextButton.icon(
                    onPressed: () async {
                      if (loggingIn) return;

                      setState(() {
                        loggingIn = true;
                      });

                      final status = await OpenFoodAPIClient.login2(
                        User(userId: login.text, password: password.text),
                      ).catchError(() => null);

                      setState(() {
                        loggingIn = false;
                      });

                      if (status?.successful == true) {
                        await db.settings.update().write(
                              SettingsCompanion(
                                offLogin: Value(login.text),
                                offPassword: Value(password.text),
                              ),
                            );
                        OpenFoodAPIConfiguration.globalUser = User(
                          userId: login.text,
                          password: password.text,
                        );
                        Fluttertoast.showToast(msg: 'Logged in');
                      } else {
                        Fluttertoast.showToast(msg: status!.statusVerbose);
                      }

                      if (context.mounted) Navigator.of(context).pop();
                    },
                    icon: loggingIn
                        ? const SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(),
                          )
                        : const Icon(Icons.save),
                    label: const Text("Save"),
                  ),
                ],
              ),
            );
          },
        );
      },
      icon: const Icon(Icons.fastfood),
      label: const Text("Open food facts"),
    );
  }
}
