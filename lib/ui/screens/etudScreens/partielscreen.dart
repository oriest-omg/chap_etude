import 'package:cached_network_image/cached_network_image.dart';
import 'package:chap_etude/ui/screens/etudScreens/feuilleScreen/feuille_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../models/feuille.dart';
import '../../../repositories/data_repository.dart';
import '../../../service/api.dart';
import '../../util/util.dart';
import '../../widgets/text_widget.dart';

class PartielScreen extends StatefulWidget {
  final List<Feuille>? feuillesList;

  const PartielScreen(this.feuillesList, {super.key});

  @override
  State<PartielScreen> createState() => _PartielScreenState();
}

class _PartielScreenState extends State<PartielScreen> {

  List<double> filterOptions = [1, 2];
  double selectedFilterOption = 1;
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
  Widget build(BuildContext context) {
    final dataProvider = Provider.of<DataRepository>(context);
    selectedOption = dataProvider.classe;
    List<Feuille>? feuilles = widget.feuillesList;


    List<Feuille>? filteredFeuilles = (selectedFilterOption == 1 && selectedOption == 'Toutes les feuilles')
        ?feuilles!
        .where((feuille) => feuille.session == selectedFilterOption)
        .toList()
        : (selectedFilterOption == 2 && selectedOption == 'Toutes les feuilles')
        ?feuilles!
        .where((feuille) => feuille.session == selectedFilterOption)
        .toList()
        : feuilles!
            .where((feuille) => feuille.session == selectedFilterOption && feuille.classe == selectedOption)
            .toList();

    return Column(
      children: [
        SizedBox(
            height: 50,
            child: Row(
                children: filterOptions
                    .map((option) => Expanded(
                          child: RadioListTile(
                            title: (option == 1)
                                ? const TextWidget(
                                    data: "1 ère session",
                                    taille: 15,
                                  )
                                : const TextWidget(
                                    data: "2 ème session",
                                    taille: 15,
                                  ),
                            tileColor: couleurOrangeAe2i,
                            value: option,
                            groupValue: selectedFilterOption,
                            onChanged: (value) {
                              setState(() {
                                selectedFilterOption = value as double;
                              });
                            },
                          ),
                        ))
                    .toList())),
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
          height: MediaQuery.of(context).size.height - 330,
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
                          placeholder: (context, url) =>
                              SpinKitFadingCircle(
                                color: couleurOrangeAe2i,
                                size: 100,
                              ),
                          errorWidget: (context, url, error) =>
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Icon(Icons.error),
                                  TextWidget(data: "vérifiez votre connexion", taille: 10,couleur : Colors.red)
                                ],
                              ),
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
