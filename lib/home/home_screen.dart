import 'package:flutter/material.dart';
import 'package:flutter_5iw1/core/services/api_services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: FutureBuilder(
          future: ApiServices.getPosts(),
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
                    final post = snapshot.data![index];
                    return ListTile(
                      title: Text(post.title),
                      subtitle: Text(post.body),
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
