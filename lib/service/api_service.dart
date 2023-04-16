import 'dart:convert';
import 'dart:io';
import 'package:chap_etude/models/feuille.dart';
import 'package:dio/dio.dart';

import 'api.dart';


class APIService{
  final API api = API();
  final Dio dio = Dio();

  Future<Response> getData(String path, {Map<String, dynamic>? params}) async {
    // on construit l'url
    String url = api.baseUrl + path;
    final response = await dio.get(url);
    // on check si la requete s'est bien passé
    if (response.statusCode == 200) {
      return response;
    } else {
      throw response;
    }
  }

  Future<Response> postData(String path, Map params) async {
    // on construit l'url
    String url = api.baseUrl + path;

    final response = await dio.post(url,options: Options(headers: {
      HttpHeaders.contentTypeHeader: "application/json",
    }),
      data: jsonEncode(params),);
    // on check si la requete s'est bien passé
    if (response.statusCode == 200) {
      return response;
    } else {
      throw response;
    }
  }

  Future<List<Feuille>> getFeuilles() async{
    Response response = await getData('feuilles');
    if(response.statusCode == 200){
      List data = response.data;
      List<Feuille> feuilles = data.map<Feuille>((dynamic feuille){
        return Feuille.fromMap(feuille);
      }).toList();
      return feuilles;
    }else {
      throw response;
    }
  }
}