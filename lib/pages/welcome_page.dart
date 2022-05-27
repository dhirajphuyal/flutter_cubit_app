import 'package:flutter/material.dart';
import 'package:flutter_cubit/misc/colors.dart';
import 'package:flutter_cubit/widgets/app_large_text.dart';
import 'package:flutter_cubit/widgets/app_text.dart';
import 'package:flutter_cubit/widgets/responsive_button.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  List images = [
    "welcome-one.png",
    "welcome-two.png",
    "welcome-three.png",
  ];
  List descriptions = [
    "Mountain hikes give you an incredible sense of freedom along with endurance test.",
    "Hikes clear our minds and give us a sense of understanding of our lives.",
    "Hikes are a great way to learn about the world and its people.",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          scrollDirection: Axis.vertical,
          itemCount: images.length,
          itemBuilder: (_, index) {
            return Container(
              width: double.maxFinite,
              height: double.maxFinite,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("img/" + images[index]),
                    fit: BoxFit.cover),
              ),
              child: Container(
                margin: const EdgeInsets.only(top: 150, left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const AppLargeText(text: "Trips"),
                        const AppText(
                          text: "Mountain",
                          size: 30,
                        ),
                        const SizedBox(height: 20),
                        Container(
                          width: 250,
                          child: AppText(
                            text: descriptions[index],
                            color: AppColors.textColor2,
                          ),
                        ),
                        const SizedBox(height: 20),
                        ResponsiveButton(width: 120),
                      ],
                    ),
                    Column(
                        children: List.generate(3, (indexDots) {
                        return Container(
                            margin: const EdgeInsets.only(bottom:2),
                          width: 8,
                          height: index == indexDots?25:8,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: AppColors.mainColor
                          ),
                        );}
                      ),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
