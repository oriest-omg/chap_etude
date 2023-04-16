import 'package:chap_etude/models/feuille.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import '../service/api_service.dart';


class DataRepository with ChangeNotifier{
  final APIService apiService = APIService();
  final Uri _url = Uri.parse('https://wa.me/2250749126278');
  late  List<Feuille> _feuilleList = [];
  late List<Feuille> _partielList = [];
  late List<Feuille> _devoirList = [];
  late String _classe = "";


  List<Feuille> get feuilleList => _feuilleList;
  List<Feuille> get partielList => _partielList;
  List<Feuille> get devoirList => _devoirList;
  String get classe => _classe;

  Future<void> getFeuilles() async {
    try {
      _feuilleList = await apiService.getFeuilles();
      _partielList = _feuilleList.where((feuille) => feuille.type == "partiel" ).toList();
      _devoirList = _feuilleList.where((feuille) => feuille.type == "devoir" ).toList();
      notifyListeners();
    } on Response catch (response) {
      if (kDebugMode) {
        print("ERROR: ${response.statusCode}");
      }
      rethrow;
    }
  }
  Future<void> getClasse() async{
    try
    {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      _classe = prefs.getString('classe')!;
    }catch(e){
      _classe = 'Toutes les feuilles';
    }
    notifyListeners();
  }
  Future<void> initData() async {
    await Future.wait([
      getFeuilles(),
      getClasse()
    ]);
  }
  Future<void> sendUrl() async {
    launchUrl(_url,mode: LaunchMode.externalApplication);
  }
}