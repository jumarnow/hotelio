import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:myapp/config/app_color.dart';
import 'package:myapp/config/app_route.dart';
import 'package:myapp/config/session.dart';
import 'package:myapp/firebase_options.dart';
import 'package:myapp/model/user.dart';
import 'package:myapp/page/detail_page.dart';
import 'package:myapp/page/home_page.dart';
import 'package:myapp/page/intro_page.dart';
import 'package:myapp/page/signin_page.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  initializeDateFormatting('en_US');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          textTheme: GoogleFonts.poppinsTextTheme(),
          scaffoldBackgroundColor: AppColor.backgroundScaffold,
          primaryColor: AppColor.primary,
          colorScheme: const ColorScheme.light(
            primary: AppColor.primary,
            secondary: AppColor.secondary,
          )),
      routes: {
        '/': (context) {
          return FutureBuilder(
              future: Session.getUser(),
              builder: (context, AsyncSnapshot<User> snapshot) {
                if (snapshot.data == null || snapshot.data!.id == null) {
                  return const IntroPage();
                } else {
                  return HomePage();
                }
              });
        },
        AppRoute.intro: (context) => const IntroPage(),
        AppRoute.home: (context) => HomePage(),
        AppRoute.signin: (context) => SigninPage(),
        AppRoute.detail: (context) => DetailPage(),
        AppRoute.checkout: (context) => const IntroPage(),
        AppRoute.checkoutSuccess: (context) => const IntroPage(),
        AppRoute.detailBooking: (context) => const IntroPage(),
      },
    );
  }
}
