import 'package:flutter/material.dart';
import 'package:islami_c20/core/remote/local/prefs_manager.dart';
import 'package:islami_c20/ui/hadeth_details/screen/hadeth_details_screen.dart';
import 'package:islami_c20/ui/home/screen/home_screen.dart';
import 'package:islami_c20/ui/sura_details/screen/sura_details_screen.dart';

import 'core/resources/routes_manager.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await PrefsManager.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false,
      routes: {
        RoutesManager.homeRouteName:(context)=>HomeScreen(),
        RoutesManager.suraDetailsRouteName:(context)=>SuraDetailsScreen(),
        RoutesManager.hadethDetailRouteName:(context)=>HadethDetailsScreen(),
      },
      initialRoute: RoutesManager.homeRouteName,
    );
  }
}

