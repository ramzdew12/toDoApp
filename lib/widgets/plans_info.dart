import 'package:flutter/material.dart';

class PlansInfo extends StatelessWidget {
  final int numberOfPlans;
  final int numberOfPlansDone;
  PlansInfo(this.numberOfPlans,this.numberOfPlansDone);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                numberOfPlans < 10 ? "0$numberOfPlans":"$numberOfPlans",
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              Text(
                "Barcha Rejalaringiz",
                style: TextStyle(fontSize: 12, color: Colors.black54),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                numberOfPlansDone < 10 ? "0$numberOfPlansDone" : "$numberOfPlansDone",
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              Text(
                "Bajarilgan Rejalaringiz",
                style: TextStyle(fontSize: 12, color: Colors.black54),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
