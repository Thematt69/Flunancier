import 'package:flunancier/blocs/analytics_bloc.dart';
import 'package:flunancier/blocs/authentication_bloc.dart';
import 'package:flunancier/blocs/bloc_provider.dart';
import 'package:flunancier/blocs/store_bloc.dart';
import 'package:flunancier/models/account.dart';
import 'package:flunancier/models/transaction.dart';
import 'package:flunancier/pages/add_transaction_page.dart';
import 'package:flunancier/widgets/custom_builder.dart';
import 'package:flunancier/widgets/indicator_montant.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AccountDetailPage extends StatefulWidget {
  const AccountDetailPage({Key? key}) : super(key: key);

  static const String routeName = '/account-detail';

  @override
  State<AccountDetailPage> createState() => _AccountDetailPageState();
}

class _AccountDetailPageState extends State<AccountDetailPage> {
  late final _authenticationBloc = BlocProvider.of<AuthenticationBloc>(context);
  late final _storeBloc = BlocProvider.of<StoreBloc>(context);

  final _formatDateTime = DateFormat.yMd('fr_FR').add_jms();

  @override
  void initState() {
    BlocProvider.of<AnalyticsBloc>(context)
        .setScreenName(AccountDetailPage.routeName);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final account = ModalRoute.of(context)!.settings.arguments as Account?;
    final progress =
        account?.plafond == null ? null : account!.total * 1 / account.plafond!;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(
          context,
          AddTransactionPage.routeName,
          arguments: account,
        ),
        tooltip: 'Ajouter une transaction',
        child: const Icon(Icons.add_card_outlined),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                IconButton(
                  icon: const BackButtonIcon(),
                  splashRadius: 22,
                  tooltip: 'Revenir à vos comptes',
                  onPressed: () => Navigator.maybePop(context),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    account!.name,
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
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  Row(
                    children: [
                      if (account.plafond != null)
                        Text(
                          '${account.total} €',
                          style: Theme.of(context).textTheme.subtitle1,
                        )
                      else
                        Text(
                          'Actuellement : ${account.total} €',
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                      const Spacer(),
                      if (account.plafond != null)
                        Text('Plafond : ${account.plafond} €'),
                    ],
                  ),
                  const SizedBox(height: 6),
                  if (progress != null)
                    LinearProgressIndicator(
                      value: progress,
                    ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: CustomStreamBuilder<List<Transaction>>(
                stream: _storeBloc.onTransactionChange(account),
                waitingBuilder: () => const Center(
                  child: CircularProgressIndicator(),
                ),
                dataBuilder: (context, data) {
                  if (data.isEmpty) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Center(
                        child: Text(
                          "Nous avons remarquer que vous n'avez pas encore de transaction, mais nous savons que ça viendra bientôt !",
                          style: Theme.of(context).textTheme.subtitle1,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    );
                  }
                  return SingleChildScrollView(
                    child: Column(
                      children: List.generate(data.length, (index) {
                        final transaction = data[index];
                        return ListTile(
                          title: Text(transaction.name),
                          subtitle: Text(
                            _formatDateTime.format(transaction.dateTime),
                          ),
                          leading: CircleAvatar(
                            backgroundColor: Colors.transparent,
                            child: Icon(
                              transaction.category.icon,
                              color: transaction.category.color,
                            ),
                          ),
                          trailing:
                              IndicatorMontant(montant: transaction.montant),
                        );
                      }),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
