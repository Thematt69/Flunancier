import 'package:flunancier/blocs/analytics_bloc.dart';
import 'package:flunancier/blocs/authentication_bloc.dart';
import 'package:flunancier/blocs/bloc_provider.dart';
import 'package:flunancier/pages/login_page.dart';
import 'package:flunancier/pages/my_account_page.dart';
import 'package:flunancier/widgets/auth_exception_info.dart';
import 'package:flunancier/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  static const String routeName = '/register';

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late final _authenticationBloc = BlocProvider.of<AuthenticationBloc>(context);
  final _formKey = GlobalKey<FormState>();
  final _email = TextEditingController();
  final _password = TextEditingController();

  @override
  void initState() {
    BlocProvider.of<AnalyticsBloc>(context)
        .setScreenName(RegisterPage.routeName);
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

  Future<void> _register() async {
    if (_formKey.currentState?.validate() ?? false) {
      await _authenticationBloc
          .registerWithEmailAndPassword(
        email: _email.text,
        password: _password.text,
      )
          .then((user) {
        if (user != null) {
          Navigator.pushReplacementNamed(context, MyAccountPage.routeName);
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
                    'Bienvenue sur Flunancier !',
                    style: Theme.of(context).textTheme.headline3,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "S'inscrire",
                    style: Theme.of(context).textTheme.headline4,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _email,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: const InputDecoration(
                      label: Text('Adresse mail'),
                      constraints: BoxConstraints(maxWidth: 350),
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "L'adresse mail est requis";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _password,
                    onFieldSubmitted: (_) async => _register(),
                    obscureText: true,
                    keyboardType: TextInputType.visiblePassword,
                    textInputAction: TextInputAction.done,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: const InputDecoration(
                      label: Text('Mot de passe'),
                      constraints: BoxConstraints(maxWidth: 350),
                      border: OutlineInputBorder(),
                    ),
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
                    label: 'Déja un compte ?',
                    onPressed: () =>
                        Navigator.pushNamed(context, LoginPage.routeName),
                  ),
                  const SizedBox(height: 8),
                  CustomElevatedButton(
                    onPressed: () async => _register(),
                    label: "S'enregistrer",
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
