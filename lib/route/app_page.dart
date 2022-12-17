import 'package:get/get.dart';

import '../view/commande/adresse_commande.dart';
import '../view/commande/recap_commande.dart';
import '../view/commande/total_commande.dart';
import '../view/dashboard/dashboard_binding.dart';
import '../view/dashboard/dashboard_screen.dart';
import 'app_route.dart';

class AppPage {
  static var list = [
    GetPage(
        name: AppRoute.dashboard,
        page: () => const DashboardScreen(),
        binding: DashboardBinding()),
    GetPage(
      name: AppRoute.adresseCommande,
      page: () => const AdresseCommande(),
    ),
     GetPage(
      name: AppRoute.totalCommande,
      page: () =>  const TotalCommande(),
    )
  ];
}
