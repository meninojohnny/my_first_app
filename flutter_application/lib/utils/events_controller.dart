import 'imports.dart';

class EventsController {
  List events = [
    EventModel(name: 'Venda de lanches', date: '13/06'),
  ];

  void addEvent({name, date}) {
    events.insert(0, EventModel(name: name, date: date));
  }

  void removeEvent(EventModel event) {
    events.removeAt(events.indexOf(event));
  }
}
