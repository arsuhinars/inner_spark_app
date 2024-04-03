import 'package:flutter/material.dart';

class SearchAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SearchAppBar({
    super.key,
    this.height = 48.0,
  });

  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: const Padding(
        padding: EdgeInsets.all(8.0),
        child: SearchBar(
          leading: Icon(Icons.search),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => throw UnimplementedError();
}
