import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:movietest/services/authService.dart';

class movieDataEntry extends StatefulWidget {
  const movieDataEntry({Key? key}) : super(key: key);

  @override
  State<movieDataEntry> createState() => _movieDataEntryState();
}

class _movieDataEntryState extends State<movieDataEntry> {
  String? name, actor, actress, director;
  int? yearOfRelease;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: <Widget>[
        TextField(
          decoration: InputDecoration(labelText: 'Enter Name '),
          onChanged: (val) {
            name = val;
          },
        ),
        TextField(
          decoration: InputDecoration(labelText: 'Enter Actor '),
          onChanged: (val) {
            actor = val;
          },
        ),
        TextField(
          decoration: InputDecoration(labelText: 'Enter Actress '),
          onChanged: (val) {
            actress = val;
          },
        ),
        TextField(
          decoration: InputDecoration(labelText: 'Enter Director '),
          onChanged: (val) {
            director = val;
          },
        ),
        TextField(
          decoration: InputDecoration(labelText: 'Enter YearOfRelease '),
          onChanged: (val) {
            yearOfRelease = int.parse(val);
          },
        ),
        ElevatedButton(
            onPressed: () {
              AuthService()
                  .addMovie(name, actor, actress, director, yearOfRelease)
                  .then((val) {
                Fluttertoast.showToast(
                    msg: "Movie Added To Database",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    backgroundColor: Color(0xFFE53935),
                    textColor: Color(0xFFFFFFFF),
                    fontSize: 16.0);
              });
            },
            style: ElevatedButton.styleFrom(primary: Colors.blue),
            child: Text('Send The Data .'))
      ]),
    );
  }
}
