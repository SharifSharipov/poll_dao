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
      initialRoute: RouteNames.discoverPage,
      onGenerateRoute: AppRoutes.generateRoute,
    );

  }
}

/*import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:poll_dao/src/core/colors/app_colors.dart';
import 'package:poll_dao/src/core/icons/app_icons.dart';

/// Flutter code sample for [ExpansionTile].

void main() => runApp(const ExpansionTileApp());

class ExpansionTileApp extends StatelessWidget {
  const ExpansionTileApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: Scaffold(
        appBar: AppBar(title: const Text('ExpansionTile Sample')),
        body: const ExpansionTileExample(),
      ),
    );
  }
}

class ExpansionTileExample extends StatefulWidget {
  const ExpansionTileExample({super.key});

  @override
  State<ExpansionTileExample> createState() => _ExpansionTileExampleState();
}

class _ExpansionTileExampleState extends State<ExpansionTileExample> {
  bool _customTileExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const ExpansionTile(
          title: Text('ExpansionTile 1'),
          subtitle: Text('Trailing expansion arrow icon'),
          children: <Widget>[
            ListTile(title: Text('This is tile number 1')),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColors.c_F0F3FA,
            ),
            child: ListTile(
              leading: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.white,
                ),
                child: Center(
                    child: SvgPicture.asset(
                  AppImages.gender,
                  width: 30,
                  height: 30,
                )),
              ),
              title: const Text('ExpansionTile 2'),
              subtitle: const Text('Trailing expansion arrow icon'),
              trailing: _customTileExpanded
                  ? RotatedBox(
                      quarterTurns: 1,
                      child: SvgPicture.asset(
                        "assets/svg/arrow_back_ios_right.svg",
                        height: 24,
                        width: 24,
                      ))
                  : SvgPicture.asset(
                      "assets/svg/arrow_back_ios_right.svg",
                      height: 24,
                      width: 24,
                    ),
              selected: false,
              enabled: false,
              onTap: () {
                _customTileExpanded = !_customTileExpanded;
                setState(() {});
              },
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20).copyWith(bottom: 20
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColors.c_F0F3FA,
            ),
            child: ExpansionTile(
              shape: RoundedRectangleBorder(
                side: BorderSide.none,
                borderRadius: BorderRadius.circular(12),
              ),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              maintainState: true,
              enableFeedback: true,
              backgroundColor: AppColors.c_F0F3FA,
              leading: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.white,
                ),
                child: Center(
                    child: SvgPicture.asset(
                  AppImages.gender,
                  width: 30,
                  height: 30,
                )),
              ),
              title: const Text('ExpansionTile 2'),
              subtitle: const Text('Custom expansion arrow icon'),
              trailing: _customTileExpanded
                  ? RotatedBox(
                      quarterTurns: 1,
                      child: SvgPicture.asset(
                        "assets/svg/arrow_back_ios_right.svg",
                        height: 24,
                        width: 24,
                      ))
                  : SvgPicture.asset(
                      "assets/svg/arrow_back_ios_right.svg",
                      height: 24,
                      width: 24,
                    ),
              children: const <Widget>[
                ListTile(title: Text('This is tile number 2')),
              ],
              onExpansionChanged: (bool expanded) {
                setState(() {
                  _customTileExpanded = expanded;
                });
              },
            ),
          ),
        ),
        const ExpansionTile(
          title: Text('ExpansionTile 3'),
          subtitle: Text('Leading expansion arrow icon'),
          controlAffinity: ListTileControlAffinity.leading,
          children: <Widget>[
            ListTile(title: Text('This is tile number 3')),
          ],
        ),
      ],
    );
  }
}*/
