import 'package:get/get.dart';
import 'package:myapp/model/hotel.dart';
import 'package:myapp/source/hotel_source.dart';

class CNearby extends GetxController {
  final _category = 'All Place'.obs;
  String get category => _category.value;
  set category(n) {
    _category.value = n;
    update();
  }

  List<String> get categories => ['All Place', 'Industrial', 'Village'];

  final _listHotel = <Hotel>[].obs;
  // ignore: invalid_use_of_protected_member
  List<Hotel> get listHotel => _listHotel.value;

  getListHotel() async {
    _listHotel.value = await HotelSource.getHotel();
    update();
  }

  @override
  void onInit() {
    getListHotel();
    super.onInit();
  }
}
