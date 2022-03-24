import 'package:firebase_core/firebase_core.dart';
import 'package:flunancier/blocs/analytics_bloc.dart';
import 'package:flunancier/blocs/bloc_provider.dart';
import 'package:flunancier/blocs/crashlytics_bloc.dart';
import 'package:flunancier/my_home_page.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  Future<void> _init() async {
    await Firebase.initializeApp();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _init(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const MaterialApp(
            home: Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          );
        }
        return BlocProvider(
          key: GlobalKey(),
          blocs: [
            CrashlyticsBloc(),
            AnalyticsBloc(),
          ],
          child: MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(primarySwatch: Colors.orange),
            initialRoute: MyHomePage.routeName,
            routes: {
              MyHomePage.routeName: (context) =>
                  const MyHomePage(title: 'Flutter Demo Home Page'),
            },
          ),
        );
      },
    );
  }
}
