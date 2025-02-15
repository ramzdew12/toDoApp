import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewPlan extends StatefulWidget {
  final Function addThePlan;
  NewPlan(this.addThePlan);
  @override
  State<NewPlan> createState() => _NewPlanState();
}

class _NewPlanState extends State<NewPlan> {
  DateTime? _todoSelectedDate;
  final namePlanController = TextEditingController();

  void _kalendarniOchish(BuildContext context) {
    showDatePicker(
      context: context,
      firstDate: DateTime.now(),
      initialDate: DateTime.now(),
      lastDate: DateTime(2025, 12, 31),
    ).then((tanlanganKun) {
      if (tanlanganKun != null) {
        setState(() {
          _todoSelectedDate = tanlanganKun;
        });
      }
    });
  }

  void submit() {
    if (namePlanController.text.isEmpty || _todoSelectedDate == null) {
      return; //Qaytarib yubor
    }
    widget.addThePlan(namePlanController.text, _todoSelectedDate);
  }

 

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 16,
      ),
      child: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              labelText: "Reja nomi",
            ),
            controller: namePlanController,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(_todoSelectedDate == null
                  ? "Reja kuni tanlanmagan..."
                  : DateFormat("EEEE,d MMMM, yyyy").format(_todoSelectedDate!)),
              TextButton(
                onPressed: () => _kalendarniOchish(context),
                child: Text("Kunni Tanlash"),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton(
                onPressed: () {},
                child: Text("Bekor qilish"),
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text("Kiritish"),
              ),
            ],
          )
        ],
      ),
    );
  }
}
