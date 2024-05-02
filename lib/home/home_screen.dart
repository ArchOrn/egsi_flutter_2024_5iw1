import 'package:flutter/material.dart';
import 'package:flutter_5iw1/core/services/api_services.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: FutureBuilder(
          future: ApiServices.getUsers(),
          builder: (context, snapshot) {
            final isLoading = snapshot.connectionState == ConnectionState.waiting;

            if (isLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              if (snapshot.hasError) {
                return Center(
                  child: Text(snapshot.error!.toString()),
                );
              }

              if (snapshot.hasData) {
                return ListView.builder(
                  itemBuilder: (context, index) {
                    final user = snapshot.data![index];
                    return ListTile(
                      leading: const Icon(Icons.person),
                      title: Text(user.name),
                      subtitle: Text(user.address),
                    );
                  },
                  itemCount: snapshot.data!.length,
                );
              }

              return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}
