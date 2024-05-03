import 'package:flutter/material.dart';
import 'package:flutter_5iw1/home/blocs/home_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc()..add(HomeDataLoaded()),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              if (state is HomeLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (state is HomeDataLoadingError) {
                return Center(
                  child: Text(
                    state.errorMessage,
                    style: const TextStyle(color: Colors.red),
                  ),
                );
              }

              if (state is HomeDataLoadingSuccess) {
                return ListView.builder(
                  itemBuilder: (context, index) {
                    final product = state.products[index];
                    return ListTile(
                      title: Text(product.title),
                      subtitle: Text(product.description),
                    );
                  },
                  itemCount: state.products.length,
                );
              }

              return const SizedBox();
            },
          ),
        ),
      ),
    );
  }
}
