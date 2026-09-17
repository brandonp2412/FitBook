import 'package:drift/drift.dart';
import 'package:fit_book/database/database.dart';
import 'package:fit_book/main.dart';
import 'package:fit_book/l10n/l10n.dart';
import 'package:fit_book/settings/settings_state.dart';
import 'package:fit_book/utils.dart';
import 'package:flutter/material.dart' as material;
import 'package:flutter/material.dart';
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

  Future<void> onMount() async {
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
                title: Text(context.l10n.openFoodFacts),
                content: SingleChildScrollView(
                  child: material.Column(
                    children: [
                      TextField(
                        decoration: InputDecoration(
                          labelText: context.l10n.username,
                        ),
                        controller: login,
                      ),
                      TextField(
                        decoration: InputDecoration(
                          labelText: context.l10n.password,
                        ),
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
                    label: Text(context.l10n.close),
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
                        if (context.mounted)
                          toast(context, context.l10n.loggedIn);
                      } else {
                        if (context.mounted)
                          toast(context, status!.statusVerbose);
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
                    label: Text(context.l10n.save),
                  ),
                ],
              ),
            );
          },
        );
      },
      icon: const Icon(Icons.fastfood),
      label: Text(context.l10n.openFoodFacts),
    );
  }
}
