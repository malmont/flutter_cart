import 'dart:convert';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/adresse.dart';
import '../model/commande.dart';

class CommandeController extends GetxController {
  static CommandeController instance = Get.find();
  String keyAcces = "challengeList";
  late SharedPreferences _localData;
  // RxString searchVal = ''.obs;
  RxList<CommandeModel> listCommande =
      List<CommandeModel>.empty(growable: true).obs;
  RxBool isProducLoading = false.obs;
  // Rx<AdresseModel> adresse=AdresseModel();

  @override
  void onInit() {
    getCommande();
    super.onInit();
  }

  Future<bool> save({required bool remove}) async {
    keyAcces = "challengeList";

    _localData = await SharedPreferences.getInstance();

    if (listCommande.length < 1 && remove ?? false) {
      return _localData.setStringList(keyAcces, []);
    }
    if (listCommande.isNotEmpty) {
      List<String> _jsonList = listCommande.map((challenge) {
        return jsonEncode(challenge.toJson());
      }).toList();
      return _localData.setStringList(keyAcces, _jsonList);
    }

    return false;
  }

  get() async {
    _localData = await SharedPreferences.getInstance();
    List<Map<String, dynamic>> _jsonDecodeList;
    final List<String>? _tempList = _localData.getStringList(keyAcces);
    if (_tempList != null) {
      _jsonDecodeList = _tempList
          .map((challengeEncoded) => jsonDecode(challengeEncoded))
          .toList()
          .cast<Map<String, dynamic>>();

      listCommande.value = _jsonDecodeList
          .map((commande) => CommandeModel.fromJson(commande))
          .toList();
    }
  }

  void getCommande() async {
    try {
      isProducLoading(true);
      await get();
    } finally {
      isProducLoading(false);
      print(listCommande.length);
    }
  }

  updateCommandeList(CommandeModel commandeUnit) {
    listCommande.add(commandeUnit);
  }
}
