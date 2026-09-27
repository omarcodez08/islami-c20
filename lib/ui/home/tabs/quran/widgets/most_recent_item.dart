import 'package:flutter/material.dart';
import 'package:islami_c20/core/resources/assets_manager.dart';
import 'package:islami_c20/core/resources/colors_manager.dart';
import 'package:islami_c20/model/sura_model.dart';

import '../../../../../core/resources/routes_manager.dart';

class MostRecentItem extends StatelessWidget {
  SuraModel sura;
  MostRecentItem({super.key, required this.sura});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, RoutesManager.suraDetailsRouteName,arguments: sura);
      },
      child: Container(
        padding: EdgeInsets.only(
          right: 6,
          left: 17
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: ColorsManager.goldColor,
        ),
        child: Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(sura.suraNameEn,style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: ColorsManager.blackColor
                ),),
                Text(sura.suraNameAr,style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: ColorsManager.blackColor
                ),),
                Text('${sura.versesNumber} Verses',style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: ColorsManager.blackColor
                ),),
              ],
            ),
            Image.asset(AssetsManager.mostRecent)
          ],
        ),
      ),
    );
  }
}
