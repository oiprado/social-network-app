import 'package:flutter/material.dart';
import 'package:quipu/screens/home_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quipu/blocs/entry/entry_bloc.dart';
import 'package:quipu/blocs/histories/histories_bloc.dart';

void main() => runApp(MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HistoriesBloc(),
        ),
        BlocProvider(
            create: (context) =>
                EntryBloc()..add(LoadEntries(page: 1, size: 10)))
      ],
      child: MyApp(),
    ));

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Roboto",
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
