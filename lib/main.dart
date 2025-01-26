import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo/model/plans_model.dart';
import 'package:todo/widgets/plans_info.dart';
import 'package:todo/widgets/plans_list.dart';
import 'package:todo/widgets/date_of_plans.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: GoogleFonts.montserrat().fontFamily),
      home: PlansProgram(),
    );
  }
}

class PlansProgram extends StatefulWidget {
  @override
  State<PlansProgram> createState() => _PlansProgramState();
}

class _PlansProgramState extends State<PlansProgram> {
  List<PlansModel> plans = Plans().plan;
  DateTime belGiLanGanKun = DateTime.now();

  void sanaNiTanLash(BuildContext context) {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2030),
    ).then((pickedDay) {
      print(pickedDay);
      if (pickedDay != null) {
        setState(() {
          belGiLanGanKun = pickedDay;
        });
        print(belGiLanGanKun);
      }
    });
  }

  void backDay() {
    setState(() {
      belGiLanGanKun = DateTime(
          belGiLanGanKun.year, belGiLanGanKun.month, belGiLanGanKun.day - 1);
    });
  }

  void nextDay() {
    setState(() {
      belGiLanGanKun = DateTime(
          belGiLanGanKun.year, belGiLanGanKun.month, belGiLanGanKun.day + 1);
    });
  }

  void _donePicked(String planId) {
    setState(() {
      plans.firstWhere((plan) => plan.id == planId).DoneOrNoDone();
    });
  }

  void _planRemove(String planId) {
    setState(() {
      plans.removeWhere((plan) => plan.id == planId);
    });
  }

  int get _numberOfPlans{
    return plans.length;
  }

  int get _numberOfPlansDone{
    return plans.where((plan) => plan.isDone).length;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amberAccent,
        centerTitle: true,
        title: Text("ToDo App"),
      ),
      body: Column(
        children: [
          DateOfPlans(sanaNiTanLash, belGiLanGanKun, backDay, nextDay),
          SizedBox(
            height: 30,
          ),
          PlansInfo(_numberOfPlans,_numberOfPlansDone),
          PlansList(plans, _donePicked, _planRemove),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
        backgroundColor: Colors.amberAccent,
      ),
    );
  }
}
