import 'package:flutter/material.dart';
import 'package:guia_medicamentos/pages/favorites.dart';
import 'package:guia_medicamentos/pages/groups.dart';

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
              title: const Text('Guia ATC'),
              pinned: true,
              floating: true,
              actions: [
                Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: GestureDetector(
                      onTap: () { print('Search'); },
                      child: const Icon(
                        Icons.search,
                        size: 26.0,
                      ),
                    )),
              ],
              bottom: const TabBar(
                isScrollable: false,
                tabs: [
                  Tab(child: Text('Grupos')),
                  Tab(child: Text('Favoritos')),
                ],
              ),
            ),
          ];
        },
        body: const TabBarView(
          children: <Widget>[
            Groups(), 
            Favorites()
          ],
        ),
      )),
    );
  }
}