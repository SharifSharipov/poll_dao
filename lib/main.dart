import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:poll_dao/src/config/routes/routes.dart';

Future<void> main()async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp],
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: RouteNames.splashPage,
      onGenerateRoute: AppRoutes.generateRoute,
    );

  }
}

