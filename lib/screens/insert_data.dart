import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import '../main.dart';
import 'package:fluttertoast/fluttertoast.dart';

class InsertData extends StatefulWidget {
  const InsertData({Key? key}) : super(key: key);

  @override
  State<InsertData> createState() => _InsertDataState();
}

class _InsertDataState extends State<InsertData> {
  final dateController = TextEditingController();
  final speedController = TextEditingController();
  final timeController = TextEditingController();
  final latitudeController = TextEditingController();
  final longitudeController = TextEditingController();

  late DatabaseReference dbRef;

  @override
  void initState() {
    super.initState();
    //dbRef = FirebaseDatabase.instance.ref().child('Students');
    dbRef = FirebaseDatabase.instance.ref();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inserting data'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Inserting data in Firebase Realtime Database',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: dateController,
                  keyboardType: TextInputType.datetime,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Date',
                    hintText: 'Enter Date',
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: speedController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Speed',
                    hintText: 'Enter Your Speed',
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: timeController,
                  keyboardType: TextInputType.datetime,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Time',
                    hintText: 'Enter Time',
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: latitudeController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Latitude',
                    hintText: 'Enter Latitude',
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: longitudeController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Longitude',
                    hintText: 'Enter Longitude',
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                MaterialButton(
                  onPressed: () {
                    if (dateController.text.isEmpty ||
                        speedController.text.isEmpty ||
                        timeController.text.isEmpty ||
                        latitudeController.text.isEmpty ||
                        longitudeController.text.isEmpty) {
                      Fluttertoast.showToast(
                          msg:
                              "You have one or more empty fields. Please fill in all",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 16.0);
                      return;
                    }
                    ;

                    Map<String, String> students = {
                      'D': dateController.text,
                      'SP': speedController.text,
                      'T': timeController.text,
                      'lat': latitudeController.text,
                      'lon': longitudeController.text
                    };
                    dbRef.push().set(students);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => const MyHomePage()));
                  },
                  color: Colors.blue,
                  textColor: Colors.white,
                  minWidth: 300,
                  height: 40,
                  child: const Text('Insert Data'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
