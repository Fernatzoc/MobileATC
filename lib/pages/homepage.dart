import 'package:flutter/material.dart';
import 'package:guia_medicamentos/pages/favorites.dart';
import 'package:guia_medicamentos/pages/groups.dart';
import 'package:guia_medicamentos/search/search_delegate.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              title: const Text('Vademecum Geria Gt'),
              pinned: true,
              floating: true,
              backgroundColor: const Color(0xff267ebd),
              // backgroundColor: const Color(0xff267ebd),
              titleTextStyle: const TextStyle(
                color: Colors.white,
                fontSize: 20.0
              ),
              actions: [
                Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: GestureDetector(
                      onTap: () => showSearch(context: context, delegate: MedicineSearchDelegate()),
                      child: const Icon(
                        Icons.search,
                        size: 26.0,
                        color: Colors.white,
                      ),
                    )),
              ],
              bottom: const TabBar(
                isScrollable: false,
                indicatorColor: Colors.amberAccent,
                indicatorWeight: 4.0,
                tabs: [
                  Tab(child: Text('Grupos')),
                  Tab(child: Text('Guardado')),
                ],
              ),
            ),
          ];
        },
        body:  const TabBarView(
          children: <Widget>[Groups(), Favorites()],
        ),
      )),
    );
  }
}
