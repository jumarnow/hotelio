import 'package:flutter/material.dart';
import 'package:myapp/config/app_asset.dart';
import 'package:myapp/config/app_route.dart';
import 'package:myapp/widget/button_custom.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            AppAsset.bgIntro,
            fit: BoxFit.cover,
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.4,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [
                Colors.black,
                Colors.transparent,
              ],
            )),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 40),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Your Great Life\nStart Here',
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                  ),
                  Text(
                    'More than just a hotel',
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w300,
                        ),
                  ),
                  const SizedBox(height: 30),
                  ButtonCustom(
                    label: "Get Started",
                    onTap: () {
                      Navigator.pushReplacementNamed(context, AppRoute.signin);
                    },
                    isExpand: true,
                  )
                ]),
          )
        ],
      ),
    );
  }
}
