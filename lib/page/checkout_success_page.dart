import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/controller/c_home.dart';
import 'package:myapp/model/hotel.dart';
import 'package:myapp/page/home_page.dart';
import 'package:myapp/widget/button_custom.dart';

class CheckoutSuccessPage extends StatelessWidget {
  const CheckoutSuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    Hotel hotel = ModalRoute.of(context)!.settings.arguments as Hotel;
    final cHome = Get.put(CHome());
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(width: 6, color: Colors.white)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                hotel.cover,
                width: 190,
                height: 190,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 46),
          Text(
            'Payment Success',
            style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
          ),
          const SizedBox(height: 12),
          Text(
            'Enjoy your a whole new experience\nin this beatiful world',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: Colors.black,
                ),
          ),
          const SizedBox(height: 46),
          ButtonCustom(
              label: 'View My Booking',
              onTap: () {
                cHome.indexPage = 1;
                Get.offAll(() => HomePage());
              }),
        ],
      ),
    );
  }
}
