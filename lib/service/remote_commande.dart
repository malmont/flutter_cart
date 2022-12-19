import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class RemoteCommande {
  String keyAcces = "challengeList";
  late SharedPreferences _localData;
  Future<List<Map<String, dynamic>>?> get() async {
    _localData = await SharedPreferences.getInstance();
    List<Map<String, dynamic>> _jsonDecodeList;
    final List<String>? _tempList = _localData.getStringList(keyAcces);
    if (_tempList != null) {
      _jsonDecodeList = _tempList
          .map((challengeEncoded) => jsonDecode(challengeEncoded))
          .toList()
          .cast<Map<String, dynamic>>();
      return _jsonDecodeList;
      // listCommande.value = _jsonDecodeList
      //     .map((commande) => CommandeModel.fromJson(commande))
      //     .toList();
    }
    return null;
  }
}
