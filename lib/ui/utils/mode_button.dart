import 'package:flutter/material.dart';

import '../utils/constants.dart';

class ModeButton extends StatefulWidget {
  ModeButton({super.key, required this.title, required this.icon});

  String title;
  IconData icon;

  @override
  State<ModeButton> createState() => _ModeButtonState();
}

class _ModeButtonState extends State<ModeButton> {
  bool enabled = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          enabled = !enabled;
        });
      },
      child: Container(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 40 - (enabled ? 4 : 0)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                widget.icon,
                color: Constants.greyColor,
              ),
              SizedBox(height: 5),
              Text(widget.title),
            ],
          ),
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
          border: enabled
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
