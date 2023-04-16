import 'package:chap_etude/ui/screens/accueil.dart';
import 'package:chap_etude/ui/screens/etudScreens/devoirscreen.dart';
import 'package:chap_etude/ui/screens/etudScreens/partielscreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../repositories/data_repository.dart';
import '../util/util.dart';

class Etude extends StatefulWidget {
  const Etude({Key? key}) : super(key: key);

  @override
  State<Etude> createState() => _EtudeState();
}

class _EtudeState extends State<Etude> {

  @override
  Widget build(BuildContext context) {
    final dataProvider = Provider.of<DataRepository>(context,listen: true);
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const Accueil();
                    },
                  ),
                );
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            ),
            flexibleSpace:Container(
                decoration : backgroundColor
            ),
            automaticallyImplyLeading: false,
            title: Text(
              "${dataProvider.classe} info",
              style: const TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontFamily: "Lobster"
              ),
            ),
            centerTitle: true,
            bottom: const TabBar(
              tabs: [
                Tab(
                  icon: Icon(
                    Icons.work,
                    color: Colors.white,
                  ),
                  text: "Devoir",
                ),
                Tab(
                  icon: Icon(
                    Icons.work,
                    color: Colors.white,
                  ),
                  text: "partiel",
                ),
              ],
              indicatorColor: Colors.white38,
              indicatorWeight: 6,
            ),
          ),
          body: Container(
                  decoration: backgroundColor,
                  child:  TabBarView(
                    children: [
                      DevoirScreen(dataProvider.devoirList),
                      PartielScreen(dataProvider.partielList)
                    ],
                  ),
                )
          ),
        );
  }
}

