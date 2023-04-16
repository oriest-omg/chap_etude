import 'package:cached_network_image/cached_network_image.dart';
import 'package:chap_etude/ui/widgets/trait_de_separation_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../../../models/feuille.dart';
import '../../../../service/api.dart';
import '../../../util/util.dart';
import '../../../widgets/text_widget.dart';
import 'package:photo_view/photo_view.dart';

class FeuilleScreen extends StatelessWidget {
  final Feuille feuille;
  const FeuilleScreen(this.feuille, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: Container(
            decoration : backgroundColor,
            child: AppBar(
              title: Text("${feuille.type} de ${feuille.nom}"),
              centerTitle: true,
              flexibleSpace:Container(
                  decoration : backgroundColor
              ),
            ),
        ),
      ),
      body: Container(
        decoration:backgroundColor,
        child:
        SingleChildScrollView(
          child: Column(
            children: [
              feuille.nbrPage == 2 ? const TraitDeSeparationWidget(information: "1 ère page",ht: 100,th:3,espaceTraitinformation : 10 ,) : Container(),
              SizedBox(
                height: MediaQuery.of(context).size.height-250,
                child: CachedNetworkImage(
                    fit: BoxFit.cover,
                    imageUrl: '${API().baseUrlGit}${feuille.type}s/${feuille.classe}/${feuille.epreuve}-1page.png',
                    imageBuilder: (context, imageProvider) => PhotoView(
                      enableRotation: true,
                      // initialScale: PhotoViewComputedScale.contained,
                      maxScale: 0.8,
                      minScale: 0.25,
                      imageProvider: imageProvider,
                    ),
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
              ),
              feuille.nbrPage == 2 ? const TraitDeSeparationWidget(information: "2 ème page",ht: 100,th:3,espaceTraitinformation : 10 ,) : Container() ,
              feuille.nbrPage == 2 ?
              SizedBox(
                height: MediaQuery.of(context).size.height-250,
                child: CachedNetworkImage(
                    fit: BoxFit.cover,
                    imageUrl: '${API().baseUrlGit}${feuille.type}s/${feuille.classe}/${feuille.epreuve}-2page.png',
                    imageBuilder: (context, imageProvider) => PhotoView(
                      enableRotation: true,
                      // initialScale: PhotoViewComputedScale.contained,
                      maxScale: 0.8,
                      minScale: 0.25,
                      imageProvider: imageProvider,
                    ),
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
                          TextWidget(data: "vérifiez votre connexion", taille: 20,couleur : Colors.red)
                        ],
                      ),
                ),
              ) : Container(),
            ],
          ),
        ),
      ),
    );
  }
}
