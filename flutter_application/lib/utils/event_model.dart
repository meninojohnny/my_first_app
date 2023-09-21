import 'imports.dart';

class EventModel {
  final String name;
  final String date;
  List<PeopleModel> listPeoples = [
    PeopleModel(name: 'Joao vitor', value: '100.00')
  ];
  int numberPeoples = 1;

  EventModel({required this.name, required this.date});

  void addPeople({name, value}) {
    listPeoples.add(PeopleModel(name: name, value: value));
    numberPeoples++;
  }

  void removePeople(PeopleModel people) {
    listPeoples.removeAt(listPeoples.indexOf(people));
    numberPeoples--;
  }
}
