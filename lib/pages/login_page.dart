import 'package:flunancier/blocs/authentication_bloc.dart';
import 'package:flunancier/blocs/bloc_provider.dart';
import 'package:flunancier/pages/my_home_page.dart';
import 'package:flunancier/pages/register_page.dart';
import 'package:flunancier/widgets/auth_exception_info.dart';
import 'package:flunancier/widgets/custom_button.dart';
import 'package:flunancier/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  static const String routeName = "/login";

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final _authenticationBloc = BlocProvider.of<AuthenticationBloc>(context);
  final _formKey = GlobalKey<FormState>();
  final _email = TextEditingController();
  final _password = TextEditingController();

  @override
  void initState() {
    _email.addListener(() => _authenticationBloc.clearException());
    _password.addListener(() => _authenticationBloc.clearException());
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  Future<void> _login() async {
    if (_formKey.currentState?.validate() ?? false) {
      await _authenticationBloc
          .signInWithEmailAndPassword(
        email: _email.text,
        password: _password.text,
      )
          .then((user) {
        if (user != null) {
          Navigator.pushReplacementNamed(context, MyHomePage.routeName);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Bienvenue sur Flunancier !",
                    style: Theme.of(context).textTheme.headline3,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Se connecter",
                    style: Theme.of(context).textTheme.headline4,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  CustomTextFormField.emailAddress(
                    controller: _email,
                    constraints: const BoxConstraints(maxWidth: 350),
                    textInputAction: TextInputAction.next,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "L'adresse mail est requis";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  CustomTextFormField.password(
                    controller: _password,
                    constraints: const BoxConstraints(maxWidth: 350),
                    onFieldSubmitted: (_) async => _login(),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Le mot de passe est requis';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 8),
                  const AuthExceptionInfo(),
                  const SizedBox(height: 8),
                  CustomTextButton(
                    label: 'Pas encore inscrit ?',
                    onPressed: () =>
                        Navigator.pushNamed(context, RegisterPage.routeName),
                  ),
                  CustomElevatedButton(
                    onPressed: () async => _login(),
                    label: "Connexion",
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
