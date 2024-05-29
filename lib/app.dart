import 'package:flutter/material.dart';
import 'package:flutter_5iw1/home/blocs/home_bloc.dart';
import 'package:flutter_5iw1/home/home_screen.dart';
import 'package:flutter_5iw1/product/blocs/product_bloc.dart';
import 'package:flutter_5iw1/product/product_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => HomeBloc()..add(HomeDataLoaded())),
        BlocProvider(create: (context) => ProductBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const HomeScreen(),
        onGenerateRoute: (settings) {
          final args = settings.arguments;
          switch (settings.name) {
            case ProductScreen.routeName:
              return MaterialPageRoute(builder: (context) => ProductScreen(id: args as int));
          }

          return null;
        },
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue),
          useMaterial3: true,
        ),
      ),
    );
  }
}
