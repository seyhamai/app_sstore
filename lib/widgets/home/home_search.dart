import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class HomeSearch extends StatelessWidget {
  const HomeSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                  hintText: "Search...",
                  hintStyle: const TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                  ),
                  prefixIcon: const Icon(
                    CupertinoIcons.search,
                    color: Colors.black,
                  ),
                  suffixIcon: const Icon(
                    CupertinoIcons.slider_horizontal_3,
                    color: Colors.black,
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: BorderSide.none,
                  ),
                ),
    );
  }
}
