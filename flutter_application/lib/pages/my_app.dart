import '../../utils/imports.dart';

class MyApp extends StatelessWidget {
  EventsController eventsController = EventsController();
  var event;
  setEvent(var event) {
    this.event = event;
  }

  @override
  Widget build(BuildContext context) {
    event = eventsController.events[0];
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) =>
            HomePage(eventsController: eventsController, setEvent: setEvent),
        '/eventPage': (context) =>
            EventPage(event: event, eventsController: eventsController),
      },
    ); // MaterialApp
  }
}
