import 'package:cached_network_image/cached_network_image.dart';
import 'package:chap_etude/ui/screens/etudScreens/feuilleScreen/feuille_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../models/feuille.dart';
import '../../../repositories/data_repository.dart';
import '../../../service/api.dart';
import '../../widgets/text_widget.dart';

class DevoirScreen extends StatefulWidget {
  final List<Feuille>? feuillesList;

  const DevoirScreen(this.feuillesList, {super.key});

  @override
  State<DevoirScreen> createState() => _DevoirScreenState();
}

class _DevoirScreenState extends State<DevoirScreen> {
  String selectedOption = 'Toutes les feuilles';
  List<String> classes = [
    'Toutes les feuilles',
    'lp1',
    'lp2',
    'bts1',
    'bts2',
    'lp3',
    'master1',
    'master2'
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final dataProvider = Provider.of<DataRepository>(context);
    selectedOption = dataProvider.classe;
    List<Feuille>? feuilles = widget.feuillesList;

    List<Feuille>? filteredFeuilles = ( selectedOption == 'Toutes les feuilles')
        ?feuilles!
        : feuilles!
        .where((feuille) =>  feuille.classe == selectedOption)
        .toList();

    return Column(
      children: [
        const Divider(),
        Container(
          color: Colors.grey,
          width: MediaQuery.of(context).size.width/2,
          child: DropdownButton(
            borderRadius: const BorderRadius.all(Radius.circular(50)),
            value: selectedOption,
            onChanged: (newValue)async  {
              setState(() {
                selectedOption = newValue as String ;
              });
              SharedPreferences prefs = await SharedPreferences.getInstance();
              prefs.setString('classe', selectedOption);
              dataProvider.getClasse();
            },
            items: classes.map((classe) {
              return DropdownMenuItem(
                alignment: Alignment.center,
                value: classe,
                child: Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width/2.3,
                    child: Text(classe)
                ),
              );
            }).toList(),
          ),
        ),
        const Divider(),
        SizedBox(
          height: MediaQuery.of(context).size.height - 280,
          child: GridView.builder(
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 5.0,
                mainAxisSpacing: 5.0,
              ),
              itemCount: filteredFeuilles.length,
              itemBuilder: (context, i) {
                return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return FeuilleScreen(filteredFeuilles[i]);
                          },
                        ),
                      );
                    },
                    child: Column(
                      children: [
                        CachedNetworkImage(
                          fit: BoxFit.cover,
                          height: 160,
                          imageUrl: '${API().baseUrlGit}${filteredFeuilles[i].type}s/${filteredFeuilles[i].classe}/${filteredFeuilles[i].epreuve}-1page.png',
                        ),
                        TextWidget(
                            data:
                            "${filteredFeuilles[i].nom} - ${filteredFeuilles[i].annee}",
                            taille: 11),
                      ],
                    ));
              }),
        ),
      ],
    );
  }
}

