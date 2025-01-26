import 'package:flutter/material.dart';
import 'package:todo/model/plans_model.dart';

class PlanSs extends StatelessWidget {
  final PlansModel plan;
  final Function donePicked;
  final Function planRemove;
  PlanSs(
    this.plan,
    this.donePicked,
    this.planRemove,
  );

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 5),
      leading: IconButton(
        onPressed: () {
          donePicked(plan.id);
        },
        icon: Icon(
          plan.isDone ? Icons.check_circle_outlined : Icons.circle_outlined,
          color: plan.isDone ? Colors.green : Colors.grey,
        ),
      ),
      title: Text(
        plan.name,
        style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: plan.isDone ? Colors.grey : Colors.black,
            decoration:
                plan.isDone ? TextDecoration.lineThrough : TextDecoration.none),
      ),
      trailing: IconButton(
        onPressed: () {
          planRemove(plan.id);
        },
        icon: Icon(
          Icons.delete_forever,
          size: 20,
        ),
      ),
    );
  }
}
