import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islami_c20/core/remote/local/prefs_manager.dart';
import 'package:islami_c20/core/resources/app_constants.dart';
import 'package:islami_c20/core/resources/assets_manager.dart';
import 'package:islami_c20/core/resources/colors_manager.dart';
import 'package:islami_c20/core/resources/strings_manager.dart';
import 'package:islami_c20/model/sura_model.dart';
import 'package:islami_c20/ui/home/tabs/quran/widgets/most_recent_item.dart';
import 'package:islami_c20/ui/home/tabs/quran/widgets/sura_item.dart';

class QuranTab extends StatefulWidget {
  const QuranTab({super.key});

  @override
  State<QuranTab> createState() => _QuranTabState();
}

class _QuranTabState extends State<QuranTab> {
  String searchText = "";
  List<SuraModel> mostRecentSuras = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    mostRecentSuras = PrefsManager.fatchMostRecent();
  }
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    List<SuraModel> filtered = filterList();

    return SafeArea(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AssetsManager.quranBack),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.center,
              child: Image.asset(
                AssetsManager.header,
                width: screenWidth * 0.7,
                fit: BoxFit.fitWidth,
              ),
            ),
            const SizedBox(height: 21),
            TextField(
              onChanged: (value) {
                setState(() {
                  searchText = value;
                });
              },
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 16,
                color: ColorsManager.whiteColor,
              ),
              cursorColor: ColorsManager.goldColor,
              decoration: InputDecoration(
                prefixIconConstraints: const BoxConstraints(
                  maxHeight: 28,
                  maxWidth: 50,
                ),
                prefixIcon: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  child: SvgPicture.asset(
                    AssetsManager.quranTab,
                    height: 28,
                    width: 28,
                    colorFilter: ColorFilter.mode(
                      ColorsManager.goldColor,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: ColorsManager.goldColor),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: ColorsManager.goldColor),
                ),
                hintText: StringsManager.suraName,
                hintStyle: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                  color: ColorsManager.whiteColor,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Visibility(
              visible: searchText.isEmpty,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    StringsManager.mostRecent,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: ColorsManager.whiteColor,
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: screenHeight * 0.16,
                    child: mostRecentSuras.isEmpty
                        ? Align(
                      alignment: Alignment.center,
                      child: Text(
                        "No recent items found",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: ColorsManager.whiteColor,
                        ),
                      ),
                    )
                        : ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return MostRecentItem(
                          sura: mostRecentSuras[index],
                        );
                      },
                      separatorBuilder: (context, index) =>
                      const SizedBox(width: 10),
                      itemCount: mostRecentSuras.length,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    StringsManager.suraList,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: ColorsManager.whiteColor,
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) =>
                    SuraItem(filtered[index], addSuraToMostRecent),
                separatorBuilder: (context, index) => Divider(
                  color: ColorsManager.whiteColor,
                  indent: 40,
                  endIndent: 40,
                ),
                itemCount: filtered.length,
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<SuraModel> filterList() {
    if (searchText.isNotEmpty) {
      List<SuraModel> filtered = [];
      for (int i = 0; i < AppConstants.surasList.length; i++) {
        if (AppConstants.surasList[i].suraNameEn.toLowerCase().contains(
          searchText.toLowerCase(),
        ) ||
            AppConstants.surasList[i].suraNameAr.contains(searchText)) {
          filtered.add(AppConstants.surasList[i]);
        }
      }
      return filtered;
    } else {
      return AppConstants.surasList;
    }
  }

  void addSuraToMostRecent(SuraModel sura) {
    setState(() {
      for (int i = 0; i < mostRecentSuras.length; i++) {
        if (mostRecentSuras[i] == sura) {
          mostRecentSuras.removeAt(i);
          break;
        }
      }
      mostRecentSuras.insert(0, sura);
      PrefsManager.saveMostRecent(mostRecentSuras);
    });
  }
}