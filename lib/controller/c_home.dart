import 'package:get/get.dart';

class CHome extends GetxController {
  final _indexPage = 0.obs;
  int get indexPage => _indexPage.value;
  set indexPage(int value) => _indexPage.value = value;
}
