import 'package:flutter/material.dart';

class ArticleImage extends StatelessWidget {
  final String imgUrl;

  const ArticleImage({super.key, required this.imgUrl});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.network(
          imgUrl,
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.5,
          fit: BoxFit.cover,
        ),
        Positioned(
          height: 150,
          top: 0.0,
          width: MediaQuery.of(context).size.width,
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [Colors.transparent, Color.fromARGB(214, 0, 0, 0)],
              ),
            ),
          ),
        ),
        Positioned(
          height: MediaQuery.of(context).size.height * 0.1,
          bottom: 0.0,
          width: MediaQuery.of(context).size.width,
          child: Container(
            height: MediaQuery.of(context).size.height * 0.3,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.transparent, Colors.black87],
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 0.0,
          child: Container(
            height: 24.0,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.0),
                topRight: Radius.circular(16.0),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
