import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:my_vocability/features/flashcard/presentation/cubit/flashcard_cubit.dart';
import 'package:my_vocability/features/vocab/presentation/cubit/vocab_cubit.dart';

import 'package:my_vocability/routes/route_generator.dart';
import 'package:my_vocability/routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => VocabCubit()),
        BlocProvider(create: (_) => FlashcardCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'My Vocability',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.grey),
        ),
        initialRoute: AppRoute.home,
        onGenerateRoute: RouteGenerator.generateRoute,
      ),
    );
  }
}
