class PlansModel {
  final String id;
  final String name;
  final DateTime day;
  bool isDone = false;

  PlansModel({required this.name, required this.day, required this.id});

  void DoneOrNoDone() {
    isDone = !isDone;
  }
}

class Plans {
  List<PlansModel> _list =[
    PlansModel(name: 'Bozorga Borish', day: DateTime.now(), id: "1"),
    PlansModel(name: "Flutterni O'rganish",day: DateTime.now(),id: "2")
  ];

  List<PlansModel> get plan {
    return _list;
  }
}
