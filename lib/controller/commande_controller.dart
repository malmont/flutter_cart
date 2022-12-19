import 'dart:convert';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/adresse.dart';
import '../model/commande.dart';
import '../service/remote_commande.dart';

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
      List<String> _jsonList = listCommande.map((Commande) {
        return jsonEncode(Commande.toJson());
      }).toList();
      return _localData.setStringList(keyAcces, _jsonList);
    }

    return false;
  }

  void getCommande() async {
    try {
      isProducLoading(true);
      List<Map<String, dynamic>>? _jsonDecodeList =
          await RemoteCommande().get();
      if (_jsonDecodeList != null) {
        listCommande.value = _jsonDecodeList!
            .map((commande) => CommandeModel.fromJson(commande))
            .toList();
      }
    } finally {
      isProducLoading(false);
      print(listCommande.length);
    }
  }

  updateCommandeList(CommandeModel commandeUnit) {
    listCommande.add(commandeUnit);
  }
}
