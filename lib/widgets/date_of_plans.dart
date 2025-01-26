import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class DateOfPlans extends StatelessWidget {
  final Function sanaNiTanLash;
  final DateTime belGiLanGanKun;
  final Function() backDay;
  final Function() nextDay;

  DateOfPlans(
      this.sanaNiTanLash,
      this.belGiLanGanKun,
      this.backDay,this.nextDay
    );

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      IconButton(
        onPressed: () {
          backDay();
        },
        icon: Icon(
          Icons.arrow_left,
          size: 35,
        ),
      ),
      TextButton(
        onPressed: () {
          sanaNiTanLash(context);
        },
        child: RichText(
          text: TextSpan(
              style: TextStyle(
                  fontSize: 20,
                  fontFamily: GoogleFonts.montserrat().fontFamily,
                  color: Colors.black),
              children: [
                TextSpan(
                  text: '${DateFormat.EEEE().format(belGiLanGanKun)}, ',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text: '${DateFormat("d MMM").format(belGiLanGanKun)}',
                ),
              ]),
        ),
      ),
      IconButton(
        onPressed: () {
          nextDay();
        },
        icon: Icon(
          Icons.arrow_right,
          size: 35,
        ),
      ),
    ]);
  }
}
