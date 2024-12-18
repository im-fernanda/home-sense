import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Constants.dart';

class ModeButton extends StatelessWidget {
  final String title;
  final IconData icon;
  final bool isEnabled;
  final VoidCallback onTap;

  const ModeButton({
    super.key,
    required this.title,
    required this.icon,
    required this.isEnabled,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 40 - (isEnabled ? 4 : 0)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: Constants.greyColor,
            ),
            SizedBox(height: 5),
            Text(title),
          ],
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Constants.shadowColor,
              Constants.backgroundColor,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [0.3, 0.6],
          ),
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(5, 5),
              blurRadius: 15,
              spreadRadius: 2,
            ),
            BoxShadow(
              color: Constants.backgroundColor,
              offset: Offset(-5, -5),
              blurRadius: 10,
              spreadRadius: 1,
            ),
          ],
          border: isEnabled
              ? Border.all(
                  width: 4,
                  color: Constants.pinkColor,
                )
              : null,
        ),
      ),
    );
  }
}
