import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:portup/widgets/AppDrawer.dart';

import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

import '../services/utils.dart';

class ActivitiesScreen extends StatefulWidget {
  static const path = "my_activities";

  const ActivitiesScreen({Key? key}) : super(key: key);

  @override
  _ActivitiesScreenState createState() => _ActivitiesScreenState();
}

class _ActivitiesScreenState extends State<ActivitiesScreen> {
  late final ValueNotifier<List<Event>> _selectedEvents;
  RangeSelectionMode _rangeSelectionMode = RangeSelectionMode
      .toggledOff; // Can be toggled on/off by longpressing a date

  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  DateTime? _rangeStart;
  DateTime? _rangeEnd;
  String? _chosenValue;
  // count
  int sommeJourDeTravail = 0;
  int sommeMaladeJour = 0;
  int sommeTeleTravail = 0;
  int sommeConge = 0;
  CalendarFormat _calendarFormat = CalendarFormat.month;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _selectedDay = _focusedDay;
    _selectedEvents = ValueNotifier(_getEventsForDay(_selectedDay!));
  }

  @override
  void dispose() {
    _selectedEvents.dispose();
    super.dispose();
  }

  List<Event> _getEventsForDay(DateTime day) {
    // Implementation example
    return kEvents[day] ?? [];
  }

  List<Event> _getEventsForRange(DateTime start, DateTime end) {
    // Implementation example
    final days = daysInRange(start, end);

    return [
      for (final d in days) ..._getEventsForDay(d),
    ];
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    if (!isSameDay(_selectedDay, selectedDay)) {
      setState(() {
        _selectedDay = selectedDay;
        _focusedDay = focusedDay;
        _rangeStart = null; // Important to clean those
        _rangeEnd = null;
        _rangeSelectionMode = RangeSelectionMode.toggledOff;
      });

      _selectedEvents.value = _getEventsForDay(selectedDay);
    }
  }

  void _onRangeSelected(DateTime? start, DateTime? end, DateTime focusedDay) {
    setState(() {
      _selectedDay = null;
      _focusedDay = focusedDay;
      _rangeStart = start;
      _rangeEnd = end;
      _rangeSelectionMode = RangeSelectionMode.toggledOn;
    });

    // `start` or `end` could be null
    if (start != null && end != null) {
      _selectedEvents.value = _getEventsForRange(start, end);
    } else if (start != null) {
      _selectedEvents.value = _getEventsForDay(start);
    } else if (end != null) {
      _selectedEvents.value = _getEventsForDay(end);
    }
  }

  _showAddDialog() async {
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.white,
        title: const Text("Selectionner"),
        content: Container(
          padding: const EdgeInsets.all(0.0),
          child: DropdownButton<String>(
            value: _chosenValue,
            //elevation: 5,
            style: const TextStyle(color: Colors.black),

            items: <String>[
              'Congé',
              'Maladie',
              'Travail',
              'Télé Travail',
            ].map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            hint: const Text(
              "Etat du jour",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
            ),

            onChanged: (value) {
              setState(() {
                _chosenValue = value;
              });
            },
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text(
              "Save",
              style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }

// this method return w widget that represents the cout of work history

  Widget workItem(Color color, String title, int count) {
    return Row(
      children: [
        SizedBox(
          width: 10,
          height: 10,
          child: CircleAvatar(
            backgroundColor: color,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            title + ":" + count.toString(),
            style: const TextStyle(color: Colors.black87),
          ),
        )
      ],
    );
  }

  Widget workStatics() {
    Row row = Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        workItem(Colors.orange, "Conge", 4),
        workItem(Colors.redAccent, "Maladie", 1),
        workItem(Colors.greenAccent, "Travail", 4),
        workItem(Colors.blueAccent, "Tele Travail", 2),
      ],
    );
    return Card(
      elevation: 2,
      child: row,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Activities"),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: _showAddDialog,
      ),
      drawer: AppDrawer(),
      body: Column(
        children: [
          const SizedBox(height: 8.0),
          const Text(
            "Votre compte rendue d'activite",
            textAlign: TextAlign.justify,
            style: TextStyle(
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 10.0),
          workStatics(),
          const SizedBox(height: 10.0),
          TableCalendar<Event>(
            firstDay: kFirstDay,
            lastDay: kLastDay,
            focusedDay: _focusedDay,
            selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
            rangeStartDay: _rangeStart,
            rangeEndDay: _rangeEnd,
            calendarFormat: _calendarFormat,
            rangeSelectionMode: _rangeSelectionMode,
            eventLoader: _getEventsForDay,
            startingDayOfWeek: StartingDayOfWeek.monday,
            headerStyle: HeaderStyle(
              formatButtonDecoration: BoxDecoration(
                color: Colors.orange,
                borderRadius: BorderRadius.circular(20.0),
              ),
              formatButtonTextStyle: const TextStyle(color: Colors.white),
              formatButtonShowsNext: false,
            ),
            calendarBuilders: CalendarBuilders(
              selectedBuilder: (context, date, events) => Container(
                  margin: const EdgeInsets.all(7.0),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Text(
                    date.day.toString(),
                    style: const TextStyle(color: Colors.white),
                  )),
              todayBuilder: (context, date, events) => Container(
                  margin: const EdgeInsets.all(7.0),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Text(
                    date.day.toString(),
                    style: const TextStyle(color: Colors.white),
                  )),
              dowBuilder: (context, day) {
                if (day.weekday == DateTime.sunday) {
                  final text = DateFormat.E().format(day);

                  return Center(
                    child: Text(
                      text,
                      style: const TextStyle(color: Colors.red),
                    ),
                  );
                }
              },
            ),
            calendarStyle: const CalendarStyle(
              // Use `CalendarStyle` to customize the UI
              outsideDaysVisible: false,
            ),
            onDaySelected: _onDaySelected,
            onRangeSelected: _onRangeSelected,
            onFormatChanged: (format) {
              if (_calendarFormat != format) {
                setState(() {
                  _calendarFormat = format;
                });
              }
            },
            onPageChanged: (focusedDay) {
              _focusedDay = focusedDay;
            },
          ),
          const SizedBox(height: 10.0),
          Text(
            " Selectionner l'etat du jour: " +
                _selectedDay!.day.toString() +
                "  ",
            style: const TextStyle(color: Colors.black45, fontSize: 18.0),
          ),
          const SizedBox(height: 8.0),
          Card(
            color: Colors.grey[300],
            elevation: 7,
            shadowColor: Colors.black54,
            child: DropdownButton<String>(
              dropdownColor: Colors.grey[300],

              elevation: 0,
              borderRadius: BorderRadius.circular(0),

              value: _chosenValue,
              //elevation: 5,
              style: const TextStyle(color: Colors.black, fontSize: 18.0),

              items: <String>[
                'Congé',
                'Maladie',
                'Travail',
                'Télé Travail',
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              hint: const Text(
                "Etat du jour",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),

              onChanged: (value) {
                setState(() {
                  _chosenValue = value;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
