import 'package:carousel_slider/carousel_slider.dart';
import 'package:chap_etude/service/api.dart';
import 'package:chap_etude/ui/util/util.dart';
import 'package:chap_etude/ui/widgets/drawer.dart';
import 'package:chap_etude/ui/widgets/trait_de_separation_widget.dart';
import 'package:flutter/material.dart';
import '../widgets/text_widget.dart';

List<double> integrations = [
  1,
  2,
  3,
  4,
  5,
  6,
  7,
  8,
  9,
  10,
  11,
  12,
  13,
  14,
  15,
  16,
  17,
  18,
  19,
  20,
  21,
  22,
  23,
  24,
  25,
  26,
  27,
  28,
  29,
  30,
  31,
  32,
  33,
  34,
  35,
  36,
  37,
  38,
  39,
  40,
  41,
  42,
  43,
  44,
  45,
  46,
  47,
  48,
  49,
  50
];
List<double> culturels = [
  1,
  2,
  3,
  4,
  5,
  6,
  7,
  8,
  9,
  10,
  11,
  12,
  13,
  14,
  15,
  16,
  17,
  18,
  19,
  20,
  21,
  22
];

class Accueil extends StatefulWidget {
  const Accueil({Key? key}) : super(key: key);

  @override
  State<Accueil> createState() => _AccueilState();
}

class _AccueilState extends State<Accueil> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Accueil"),
          centerTitle: true,
          backgroundColor: couleurBleuAe2i,
          flexibleSpace: Container(decoration: backgroundColor)),
      drawer: const DrawerWidget(),
      body: Container(
        decoration: backgroundColor,
        child: ListView(
          children: [
            Container(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Image.asset(
                  "assets/images/logo-AE2I.png",
                  height: 270,
                ),
              ),
            ),
            const TraitDeSeparationWidget(information: "évènements"),
            const SizedBox(
              height: 30,
            ),
            const TraitDeSeparationWidget(information: "journée d'intégration 2022-2023"),
            const SizedBox(
              height: 30,
            ),
            CarouselSlider(
              options: CarouselOptions(height: 400.0, autoPlay: true),
              items: integrations.map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.symmetric(horizontal: 2.0),
                        child: Image.network(
                          '${API().baseUrlGit}integration/2022-2023/integration${i.toInt()}.jpg',
                          fit: BoxFit.fill,
                          loadingBuilder:(context, child,loadingProgress) {
                            if (loadingProgress == null) return child;
                            return Center(
                              child: CircularProgressIndicator(
                                color: couleurBleuAe2i,
                                value: loadingProgress.expectedTotalBytes != null ?
                                loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                                    : null,
                              ),
                            );
                          },
                            errorBuilder: (BuildContext context, Object exception,st) {
                              return const Center(child: TextWidget(data :"erreur de chargement de l'image , verifiez votre connexion internet",taille: 15,couleur: Colors.red,));
                            }
                        ));
                  },
                );
              }).toList(),
            ),
            const SizedBox(
              height: 30,
            ),
            const TraitDeSeparationWidget(information: "journée d'intégration 2021-2022"),
            const SizedBox(
              height: 30,
            ),
            CarouselSlider(
              options: CarouselOptions(height: 400.0, autoPlay: true),
              items: integrations.map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.symmetric(horizontal: 2.0),
                        child: Image.network(
                          '${API().baseUrlGit}integration/2021-2022/integration${i.toInt()}.jpg',
                          fit: BoxFit.fill,
                          loadingBuilder:(context, child,loadingProgress) {
                            if (loadingProgress == null) return child;
                            return Center(
                              child: CircularProgressIndicator(
                                color: couleurBleuAe2i,
                                value: loadingProgress.expectedTotalBytes != null ?
                                loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                                    : null,
                              ),
                            );
                          },
                            errorBuilder: (BuildContext context, Object exception,st) {
                              return const Center(child: TextWidget(data :"erreur de chargement de l'image , verifiez votre connexion internet",taille: 15,couleur: Colors.red,));
                            }
                        ));
                  },
                );
              }).toList(),
            ),
            const SizedBox(
              height: 30,
            ),
            const TraitDeSeparationWidget(information: "journée culturelle 2021-2022"),
            const SizedBox(
              height: 30,
            ),
            CarouselSlider(
              options: CarouselOptions(height: 400.0, autoPlay: true),
              items: culturels.map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.symmetric(horizontal: 2.0),
                        child: Image.network(
                          '${API().baseUrlGit}culturel/culturel${i.toInt()}.JPG',
                          fit: BoxFit.fill,
                          loadingBuilder:(context, child,loadingProgress) {
                            if (loadingProgress == null) return child;
                            return Center(
                              child: CircularProgressIndicator(
                                color: couleurOrangeAe2i,
                                value: loadingProgress.expectedTotalBytes != null ?
                                loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                                    : null,
                              ),
                            );
                          },
                          errorBuilder: (BuildContext context, Object exception,st) {
                            return const Center(child: TextWidget(data :"erreur de chargement de l'image , verifiez votre connexion internet",taille: 15,couleur: Colors.red,));
                          },
                        ));
                  },
                );
              }).toList(),
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
