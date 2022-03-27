import 'package:flunancier/blocs/analytics_bloc.dart';
import 'package:flunancier/blocs/authentication_bloc.dart';
import 'package:flunancier/blocs/bloc_provider.dart';
import 'package:flunancier/blocs/store_bloc.dart';
import 'package:flunancier/models/account.dart';
import 'package:flunancier/pages/account_detail_page.dart';
import 'package:flunancier/widgets/custom_builder.dart';
import 'package:flunancier/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class MyAccountPage extends StatefulWidget {
  const MyAccountPage({Key? key}) : super(key: key);

  static const String routeName = '/my-account';

  @override
  State<MyAccountPage> createState() => _MyAccountPageState();
}

class _MyAccountPageState extends State<MyAccountPage> {
  late final _authenticationBloc = BlocProvider.of<AuthenticationBloc>(context);
  late final _storeBloc = BlocProvider.of<StoreBloc>(context);

  @override
  void initState() {
    BlocProvider.of<AnalyticsBloc>(context)
        .setScreenName(MyAccountPage.routeName);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Vos comptes',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.exit_to_app_outlined),
                  splashRadius: 22,
                  tooltip:
                      'Se déconnecter de "${_authenticationBloc.currentUser?.email}"',
                  onPressed: () => _authenticationBloc.signOut(),
                ),
              ],
            ),
            Expanded(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        CustomStreamBuilder<List<Account>>(
                          stream: _storeBloc.onAccountsChange,
                          dataBuilder: (context, data) {
                            if (data.isEmpty) {
                              return Column(
                                children: [
                                  Text(
                                    "Nous avons remarquer que vous n'avez pas encore de compte enregistré.",
                                    style:
                                        Theme.of(context).textTheme.subtitle1,
                                    textAlign: TextAlign.center,
                                  ),
                                  const SizedBox(height: 12),
                                  Text(
                                    'Pour en ajouter un nouveau, il vous suffit de cliquer sur le bouton ci-dessous.',
                                    style:
                                        Theme.of(context).textTheme.bodyText1,
                                    textAlign: TextAlign.center,
                                  ),
                                  const SizedBox(height: 16),
                                ],
                              );
                            }
                            return Column(
                              children: List.generate(data.length, (index) {
                                final account = data[index];
                                final progress = account.plafond == null
                                    ? null
                                    : account.total * 1 / account.plafond!;
                                return ListTile(
                                  onTap: () {
                                    Navigator.pushNamed(
                                      context,
                                      AccountDetailPage.routeName,
                                      arguments: account,
                                    );
                                  },
                                  title: Text(account.name),
                                  subtitle: account.plafond == null
                                      ? null
                                      : LinearProgressIndicator(
                                          value: progress,
                                        ),
                                  trailing: Text('${account.total} €'),
                                );
                              }),
                            );
                          },
                        ),
                        const CustomTextButton(
                          // TODO - Add a button to add a new account
                          // onPressed: () {},
                          label: 'Ajouter un compte',
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
