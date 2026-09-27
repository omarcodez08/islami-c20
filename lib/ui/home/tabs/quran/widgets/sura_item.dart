import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islami_c20/core/resources/assets_manager.dart';
import 'package:islami_c20/core/resources/colors_manager.dart';
import 'package:islami_c20/core/resources/routes_manager.dart';
import 'package:islami_c20/model/sura_model.dart';

class SuraItem extends StatelessWidget {
  SuraModel suraModel;
  void Function(SuraModel) onClick;
  SuraItem(this.suraModel, this.onClick);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onClick(suraModel);
        Navigator.pushNamed(context, RoutesManager.suraDetailsRouteName,arguments: suraModel);
      },
      child: Row(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              SvgPicture.asset(AssetsManager.suraNumber),
              Text(suraModel.suraNumber.toString(),style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: ColorsManager.whiteColor
              ),)
            ],
          ),
          SizedBox(width: 24,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(suraModel.suraNameEn,style: TextStyle(
                  color: ColorsManager.whiteColor,
                  fontSize: 20,
                  fontWeight: FontWeight.w700
                ),),
                Text("${suraModel.versesNumber} Verses",style: TextStyle(
                    color: ColorsManager.whiteColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w700
                ),)
              ],
            ),
          ),
          Text(suraModel.suraNameAr,style: TextStyle(
              color: ColorsManager.whiteColor,
              fontSize: 20,
              fontWeight: FontWeight.w700
          ),),
        ],
      ),
    );
  }
}
