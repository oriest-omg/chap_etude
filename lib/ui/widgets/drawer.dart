import 'package:chap_etude/ui/screens/etude.dart';
import 'package:chap_etude/ui/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../repositories/data_repository.dart';
import '../util/util.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final dataProvider = Provider.of<DataRepository>(context,listen: true);
    return Drawer(
        backgroundColor: couleurBleuAe2i,
        child:Container(
          decoration: backgroundColor,
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: backgroundColor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/logo-AE2I.png',
                      width: 140,
                    ),
                  ],
                ),
              ),
              const Divider(
                color: Colors.grey,
              ),
              // ListTile(
              //   leading: Icon(Icons.person),
              //   title: const TextWidget(data: "Profil", taille: 15),
              //   onTap: () {
              //     Navigator.push(
              //       context,
              //       MaterialPageRoute(
              //         builder: (context) {
              //           return Center();
              //         },
              //       ),
              //     );
              //   },
              // ),
              const Divider(
                color: Colors.grey,
              ),
              ListTile(
                leading: const Icon(Icons.work),
                title:  const TextWidget(data: "Etude (devoirs/partiels)", taille: 15),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const Etude();
                      },
                    ),
                  );
                  // Navigator.of(context).push(BlocRouter().etudeRoute());
                },
              ),
              const Divider(
                color: Colors.grey,
              ),

              const SizedBox(
                height: 300,
              ),
              TextButton(
                onPressed: () => {
                  showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      title: const Text('Contact'),
                      content: const Text(
                          'Contacter Développeur : +225 0749126278'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () => Navigator.pop(context, 'non'),
                          child: const Text('non'),
                        ),
                        TextButton(
                          onPressed: () => {
                            dataProvider.sendUrl()
                          },
                          child: const Text('oui'),
                        ),
                      ],
                    ),
                  ),
                },
                child: TextWidget(
                  data: "By oriest",
                  taille: 17,
                  couleur: kEcriture,
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Center(
                child: TextWidget(
                  data: "Chap_Etude version : 1",
                  taille: 17,
                  couleur: kEcriture,
                ),
              )
            ],
          ),
        )
    );

  }

}
