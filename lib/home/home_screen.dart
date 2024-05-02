import 'package:flutter/cupertino.dart';
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
          future: ApiServices.getPhotos(),
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
                return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemBuilder: (context, index) {
                    final photo = snapshot.data![index];
                    return Stack(
                      children: [
                        Image.network(photo.url),
                        Positioned(
                          left: 0,
                          right: 0,
                          bottom: 0,
                          child: Container(
                            color: Colors.black.withOpacity(.2),
                            child: Text(
                              photo.title,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ),
                        )
                      ],
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
