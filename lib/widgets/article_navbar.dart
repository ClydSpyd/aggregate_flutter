import 'dart:ui';

import 'package:flutter/material.dart';

class ArticleNavbar extends StatelessWidget {
  const ArticleNavbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      width: MediaQuery.of(context).size.width,
      top: 0,
      child: Transform.translate(
        offset: const Offset(10, -15),
        child: AppBar(
          backgroundColor: Colors.transparent,
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(50.0),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey.withOpacity(0.35),
                ),
                child: IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios_rounded,
                    color: Colors.white.withOpacity(0.65),
                    size: 25.0,
                  ),
                  onPressed: () {
                    debugPrint('Tapped on back button');
                    Navigator.of(context).pop();
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
