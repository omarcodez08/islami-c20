import 'package:flutter/material.dart';
import 'package:islami_c20/core/resources/assets_manager.dart';

class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  final List<String> zekrList = ["سبحان الله", "الحمدلله", "الله اكبر"];
  int index = 0;
  int counter = 0;
  int angle=0;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AssetsManager.sebhaBack),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                const SizedBox(height: 16),
                Image.asset(AssetsManager.header, height: 130),
                const SizedBox(height: 16),
                const Text(
                  "سَبِّحِ اسْمَ رَبِّكَ الأعلى",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 10),
                Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Image.asset(AssetsManager.sebhaHead),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: size.height * 0.08),
                          child: GestureDetector(
                            onTap: () {
                              counter++;
                              angle++;
                              if (counter == 33) {
                                counter=0;
                                index++;
                                if (index == zekrList.length) {
                                  index = 0;
                                }
                              }
                              setState(() {});
                            },
                            child: Transform.rotate(
                                angle:angle / 2 ,
                                child: Image.asset(AssetsManager.sebhaBody)),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: size.height * 0.07),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                zekrList[index],
                                style: const TextStyle(
                                  fontSize: 36,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                "$counter",
                                style: const TextStyle(
                                  fontSize: 36,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}