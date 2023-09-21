import '../utils/imports.dart';

class EventPage extends StatefulWidget {
  final EventModel event;
  final EventsController eventsController;
  EventPage({Key? key, required this.event, required this.eventsController});
  @override
  _EventPageState createState() =>
      _EventPageState(event: event, eventsController: eventsController);
}

class _EventPageState extends State<EventPage> {
  final EventsController eventsController;
  final EventModel event;
  String name = '';
  setName(String name) {
    this.name = name;
  }

  String value = '';
  setValue(String value) {
    this.value = value;
  }

  _EventPageState(
      {Key? key, required this.event, required this.eventsController});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(0, 180, 199, 1),
      appBar: AppBar(
        title: Text(event.name),
        actions: [
          IconButton(
              icon: Icon(Icons.delete, color: Colors.black),
              onPressed: () {
                eventsController.removeEvent(event);
                Navigator.of(context).pushReplacementNamed('/');
              }),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Color.fromRGBO(24, 78, 119, 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  'Data: ${event.date} ',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 20),
              CustomTextField(
                  label: 'Adicionar Pessoa',
                  hintText: 'Valor',
                  setValue1: setName,
                  setValue2: setValue,
                  onPressed: () {
                    setState(() {
                      if (name != '' &&
                          value != '' &&
                          double.parse(value) / 1 == double.parse(value)) {
                        event.addPeople(name: name, value: value);
                      }
                    });
                  }),
              SizedBox(height: 20),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                decoration: BoxDecoration(
                  color: Color.fromRGBO(24, 78, 119, 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  'Pessoas',
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
                itemCount: event.listPeoples.length,
                itemBuilder: (context, index) {
                  return makePeoples(event.listPeoples[index]);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget makePeoples(var people) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.only(right: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color.fromARGB(255, 234, 227, 227),
                border: Border.all(width: 2, color: Colors.black),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    people.name,
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'R\$ ${people.value}',
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                event.removePeople(people);
              });
            },
            child: Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 1,
                      spreadRadius: 1,
                      color: Colors.black.withOpacity(.9),
                      offset: Offset(0, 0),
                    )
                  ]),
              child: Icon(Icons.delete, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
