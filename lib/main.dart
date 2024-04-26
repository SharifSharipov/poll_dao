import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poll_dao/src/features/discover_page/presentation/widgets/category_select.dart';
import 'package:poll_dao/src/features/profile_page/domain/repositories/repository.dart';
import 'package:poll_dao/src/features/profile_page/domain/service/service.dart';
import 'package:poll_dao/src/features/profile_page/presentation/manager/fetch_profile_data_bloc/fetch_profile_data_bloc.dart';
import 'package:poll_dao/src/features/topics/data/topic_repository_impl.dart';
import 'package:poll_dao/src/features/topics/logic/topic_notifier.dart';
import 'package:poll_dao/src/features/widget_servers/repositories/storage_repository.dart';
import 'package:provider/provider.dart';

import 'src/config/routes/routes.dart';
import 'src/features/discover_page/presentation/bloc/polls_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp],
  );

  await StorageRepository.getInstance();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PollsBloc()..add(GetPolls()),
          lazy: false,
        ),
        BlocProvider(
          create: (context) {
            return FetchProfileDataBloc(
              profileRepository: ProfileRepository(apiService: Service()),
            );
          },
          lazy: false,
        ),
        ChangeNotifierProvider(
          create: (context) => TopicNotifier(const TopicRepositoryImpl())..getTopics(),
        ),
        ChangeNotifierProvider(create: (context) => CategoryProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute: RouteNames.splashPage,
        onGenerateRoute: AppRoutes.generateRoute,
      ),
    );
  }
}
