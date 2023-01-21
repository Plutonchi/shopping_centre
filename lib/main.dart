import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_centre/presentation/page/btn_bar.dart';
import 'package:shopping_centre/provider/dark_theme_provider.dart';
import 'package:shopping_centre/utils/app_constants/theme/theme_data.dart';
import 'data/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DarkThemeProvider themeChangeProvider = DarkThemeProvider();

  void getCurrentAppTheme() async {
    themeChangeProvider.setDarkTheme =
        await themeChangeProvider.darkThemePrefs.getTheme();
  }

  @override
  void initState() {
    getCurrentAppTheme();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) {
          return themeChangeProvider;
        })
      ],
      child:
          Consumer<DarkThemeProvider>(builder: (context, themeProvider, child) {
        return MaterialApp(
          theme: Styles.themeData(themeProvider.getDarkTheme, context),
          debugShowCheckedModeBanner: false,
          home: BottomBar(),
        );
      }),
    );
  }
}
