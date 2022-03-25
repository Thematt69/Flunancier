import 'package:firebase_auth/firebase_auth.dart';
import 'package:flunancier/blocs/authentication_bloc.dart';
import 'package:flunancier/blocs/bloc_provider.dart';
import 'package:flunancier/extensions/auth_exception_extension.dart';
import 'package:flunancier/widgets/custom_builder.dart';
import 'package:flutter/material.dart';

class AuthExceptionInfo extends StatelessWidget {
  const AuthExceptionInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomStreamBuilder<FirebaseAuthException?>(
      stream: BlocProvider.of<AuthenticationBloc>(context).onExceptionChange,
      dataBuilder: (context, data) => Text(
        data!.messageException,
        style: Theme.of(context)
            .textTheme
            .subtitle1
            ?.copyWith(color: Theme.of(context).colorScheme.error),
      ),
    );
  }
}
