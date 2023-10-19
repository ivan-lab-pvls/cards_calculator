import 'package:cards_calculator/constants.dart';
import 'package:cards_calculator/custom_theme.dart';
import 'package:cards_calculator/data/incomes_change_notifier.dart';
import 'package:cards_calculator/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'screens/notification/fb.dart';
import 'screens/notification/init2.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DeviceSystem.currentPlatform);
  await NotificationEnableRequest().activate();
  defaultData = dec(defaultData, -2);
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.dark,
      statusBarColor: Colors.transparent,
    ),
  );

  final shPrefs = await SharedPreferences.getInstance();

  runApp(MyApp(shPrefs));
}

class MyApp extends StatelessWidget {
  const MyApp(this._shPrefs, {super.key});

  final SharedPreferences _shPrefs;

  @override
  Widget build(BuildContext context) {
    return Provider.value(
      value: _shPrefs,
      child: ChangeNotifierProvider(
        create: (context) => IncomesChangeNotifier(_shPrefs)..init(),
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: 'Cards calculator',
          theme: CustomTheme.theme,
          routerConfig: Routes.routes,
        ),
      ),
    );
  }
}
