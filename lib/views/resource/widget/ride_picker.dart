
import 'package:flutter/material.dart';

class RidePicker extends StatefulWidget {
  @override
  _RidePickerState  createState() => _RidePickerState();
  }

class _RidePickerState  extends State <RidePicker> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 10, bottom: 10),
        color: const Color(0xFFFFFFFF),
        child: Row(
          children: [
            Column(
              children: [
                SizedBox(
                  width: 370,
                  height: 75,
                  child:  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: "Enter your location",
                        suffixIcon: Icon(Icons.search),
                        contentPadding:EdgeInsets.only(left: 20, bottom: 5, right: 5),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Colors.white),
                        ),
                      ),
                    ),
                  ),

                ),
              ],
            ),
          ],
        ),

    );
  }
}



