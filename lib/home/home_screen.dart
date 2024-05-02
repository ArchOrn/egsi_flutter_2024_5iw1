import 'package:flutter/material.dart';
import 'package:flutter_5iw1/core/models/post.dart';
import 'package:flutter_5iw1/core/services/api_services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Post> _posts = [];

  bool _loading = false;
  Error? _error;

  @override
  void initState() {
    super.initState();

    setState(() {
      _loading = true;
    });

    ApiServices.getPosts().then((data) {
      setState(() {
        _error = null;
        _posts.clear();
        _posts.addAll(data);
        _loading = false;
      });
    }).catchError((error) {
      setState(() {
        _error = error;
        _loading = false;
      });
    });

    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
    //   final data = await ApiServices.getPosts();
    //   _error = null;
    //   _posts.clear();
    //   _posts.addAll(data);
    // });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Builder(builder: (context) {
          if (_error != null) {
            return Center(
              child: Text(_error.toString()),
            );
          } else if (_loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView.builder(
              itemBuilder: (context, index) {
                final post = _posts[index];
                return ListTile(
                  title: Text(post.title),
                  subtitle: Text(post.body),
                );
              },
              itemCount: _posts.length,
            );
          }
        }),
      ),
    );
  }
}
