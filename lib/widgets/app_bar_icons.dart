import 'package:flutter/material.dart';

class AppBarIcon extends StatelessWidget {
  final Function function;
  final IconData icons;
  const AppBarIcon({
    super.key,
    required this.function,
    required this.icons,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: GestureDetector(
        onTap: () {
          function();
        },
        child: Container(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                icons,
                size: 20,
                color: Colors.deepPurple[400],
              ),
            )),
      ),
    );
  }
}
