import 'package:flutter/material.dart';


class Classification extends StatelessWidget {
  const Classification({Key? key}) : super(key: key);

  @override

  Widget build(BuildContext context) {

  final String group = ModalRoute.of(context)?.settings.arguments.toString() ?? 'no-group';

    return Scaffold(
      body: Center(
        child: Text( group ),
     ),
   );
  }
}