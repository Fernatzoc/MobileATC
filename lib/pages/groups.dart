import 'package:flutter/material.dart';
import 'package:guia_medicamentos/providers/groups_provider.dart';
import 'package:guia_medicamentos/widgets/cardbuttom.dart';
import 'package:provider/provider.dart';

class Groups extends StatelessWidget {
  const Groups({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    final groups = Provider.of<GroupProvider>(context).groups;

    return Scaffold(
      body: CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverList(
          delegate:
              SliverChildBuilderDelegate((BuildContext context, int index) {
            return CardButtom(
              group: groups[index],
            );
          }, childCount: groups.length),
        )
      ],
    ));
  }
}
