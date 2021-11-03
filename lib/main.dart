import 'package:flutter/material.dart';
import 'package:guia_medicamentos/providers/groups_provider.dart';
import 'package:guia_medicamentos/routes.dart';
import 'package:provider/provider.dart';

void main() => runApp(const AppState());


class AppState extends StatelessWidget {
  const AppState({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => GroupProvider(), lazy: false)
      ],
      child: const MyApp(),
    );
  }
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Farmacos',
      initialRoute: 'home',
      routes: appRoputes,
    );
  }
}