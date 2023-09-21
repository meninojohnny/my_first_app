import '../utils/imports.dart';

class HomePage extends StatefulWidget {
  final EventsController eventsController;
  final Function setEvent;
  const HomePage(
      {Key? key, required this.eventsController, required this.setEvent});
  @override
  _HomePageState createState() =>
      _HomePageState(eventsController: eventsController, setEvent: setEvent);
}

class _HomePageState extends State<HomePage> {
  final EventsController eventsController;
  final Function setEvent;
  String name = '';
  setName(String name) {
    this.name = name;
  }

  String date = '';
  setDate(String date) {
    this.date = date;
  }

  _HomePageState(
      {Key? key, required this.eventsController, required this.setEvent});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(0, 180, 199, 1),
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextField(
                  label: 'Adicionar evento',
                  hintText: 'Data',
                  setValue1: setName,
                  setValue2: setDate,
                  onPressed: () {
                    setState(() {
                      if (name != '' && date != '') {
                        eventsController.addEvent(name: name, date: date);
                      }
                    });
                  }),

              SizedBox(height: 20),

              Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                decoration: BoxDecoration(
                  color: Color.fromRGBO(24, 78, 119, 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  'Eventos',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              SizedBox(height: 10),
              ListView.builder(
                shrinkWrap: true,
                itemCount: eventsController.events.length,
                itemBuilder: (context, index) {
                  return makeEvents(eventsController.events[index]);
                },
              ), // ListView
            ],
          ), // Column
        ), // Padding
      ),
    );
  }

  Widget makeEvents(event) {
    return GestureDetector(
      onTap: () {
        setState(() {
          setEvent(event);
          Navigator.of(context).pushNamed('/eventPage');
        });
      },
      child: Container(
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 234, 227, 227),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(width: 2, color: Colors.black),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.4),
              spreadRadius: 0,
              blurRadius: 5,
              offset: Offset(-1, 1),
            )
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(event.name,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text(
                'Data: ${event.date}',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text('Total de fiados: ${event.numberPeoples}',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ]),
          ],
        ), // Column
      ), // Container
    ); //
  }
}
