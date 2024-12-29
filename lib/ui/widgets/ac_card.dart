import 'package:flutter/material.dart';

import '../pages/ac_controller.dart';

class AcCard extends StatefulWidget {
  const AcCard({
    super.key,
  });

  @override
  State<AcCard> createState() => _AcCardState();
}

class _AcCardState extends State<AcCard> {

  bool ac = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => AcController()));
      },
      child: Container(
        height: 150,
        width: double.infinity,
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 247, 247, 247),
          borderRadius: BorderRadius.circular(33)
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "AC - TURBO MODE",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.w600
                  ),  
                ),
                SizedBox(
                  height: 40,
                  width: 40,
                  child: Icon(
                    Icons.bolt_outlined,
                    size: 30,
                  ),
                )
              ],
            ),
            SizedBox(height: 16),
            Container(
              height: 1,
              width: double.infinity,
              color: Colors.black12,
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "18° C",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.w600
                  ),  
                ),
                SizedBox(
                  height: 40,
                  width: 40,
                  child: Transform.scale(
                    scale: 0.8,
                    child: Switch(
                      value: ac,
                      activeColor: Colors.amber,
                      onChanged: (bool value) {
                        setState(() {
                          ac = value;
                        });
                      },
                     ),
                  )
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}