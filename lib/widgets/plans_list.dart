import 'package:flutter/material.dart';
import 'package:todo/model/plans_model.dart';
import 'package:todo/widgets/planss.dart';

class PlansList extends StatelessWidget {
  final List<PlansModel> plans;
  final Function donePicked;
  final Function planRemove;
  PlansList(
    this.plans,
    this.donePicked,
    this.planRemove,
  );

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          itemBuilder: (context, index) {
            return PlanSs(plans[index], donePicked,planRemove);
          },
          itemCount: plans.length),
    );
  }
}
