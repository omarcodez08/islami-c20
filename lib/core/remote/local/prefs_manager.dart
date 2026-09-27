import 'package:shared_preferences/shared_preferences.dart';

import '../../../model/sura_model.dart';
import '../../resources/app_constants.dart';

class PrefsManager {
 static late final SharedPreferences prefs;
  static init() async {
     prefs=await SharedPreferences.getInstance();
  }
  static saveMostRecent(List<SuraModel> mostRecent ){
  prefs.setStringList("mostRecent", mostRecent.map((sura) => sura.suraNameEn).toList());
  }
  static fatchMostRecent(){
    List<SuraModel>mostRecent=[];
    List<String>suraNames=prefs.getStringList("mostRecent")??[];
    for(int i=0;i<suraNames.length;i++){
    SuraModel checkedSura = AppConstants.surasList.firstWhere((element) => element.suraNameEn==suraNames[i]);
    mostRecent.add(checkedSura);
    }
    return mostRecent;
  }
}


