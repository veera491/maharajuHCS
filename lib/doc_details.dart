import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';


class doc_details extends StatefulWidget {
  final Map<String, dynamic> docData;
  const doc_details({Key? key, required this.docData}) : super(key: key);
  @override
  State<doc_details> createState() => _doc_detailsState(docData);
}

class _doc_detailsState extends State<doc_details> {
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (picked != null && picked != selectedTime) {
      setState(() {
        selectedTime = picked;
      });
    }
  }

  final Map<String, dynamic> docData;
  _doc_detailsState(this.docData);

  getUser() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.get('username');
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    http.Response response;
    return Scaffold(
        appBar: AppBar(
          title: Image.asset(
            'assets/images/logo.png',
            height: 50,
            width: 300,
            alignment: Alignment.centerLeft,
          ),
          backgroundColor: Colors.indigo.shade900,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Align(
                alignment: Alignment.center,
                child: Text("\nLet's Consult A Doctor\n",style: TextStyle(
                  fontSize: 24,
                  fontStyle: FontStyle.italic,
                  color: Colors.black,
                ),),
              ),

              Center(child: CircleAvatar(
                radius: 60, // adjust the size as needed
                child: ClipOval(
                  child: Image.network(
                    docData["doctor_details"]["doctor_picture"],
                    fit: BoxFit.cover,
                    //width: 100,
                    //height: 100,
                  ),
                ),)
              ),

              Center(child: SizedBox(
                width: 0.95*screenWidth, // set the desired width
                //height: 350, // set the desired height
                child: Card(
                  elevation: 5.0,
                  color: Colors.indigo.shade200,

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("\n  Doctor Details",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.indigo.shade900,
                        ),),

                      Text("${"       Dr."+docData["doctor_details"]["doctor_first_name"]+" "+docData["doctor_details"]["doctor_middle_name"]} "+docData["doctor_details"]["doctor_last_name"],
                        textAlign: TextAlign.start,
                        style: const TextStyle(
                          fontSize: 18,
                          fontStyle: FontStyle.italic,
                          color: Colors.black,
                        ),),

                      Text("       Specialist in "+docData["doctor_details"]["doctor_specialization"],
                      textAlign: TextAlign.start,
                        style: const TextStyle(
                          fontSize: 18,
                          fontStyle: FontStyle.italic,
                          color: Colors.black,
                        ),),

                      Text("       "+docData["doctor_details"]["doctor_DESIGNATION"],
                        textAlign: TextAlign.start,
                        style: const TextStyle(
                          fontSize: 18,
                          fontStyle: FontStyle.italic,
                          color: Colors.black,
                        ),),

                      Text("       "+docData["doctor_details"]["doctor_highest_degree"],
                        textAlign: TextAlign.start,
                        style: const TextStyle(
                          fontSize: 18,
                          fontStyle: FontStyle.italic,
                          color: Colors.black,
                        ),),

                      Text("${"       "+docData["doctor_details"]["willing_for_home_visit"]} Willing for Home Visit",
                        textAlign: TextAlign.start,
                        style: const TextStyle(
                          fontSize: 18,
                          fontStyle: FontStyle.italic,
                          color: Colors.black,
                        ),),

                      const Text(" ",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 24,
                          fontStyle: FontStyle.italic,
                          color: Colors.black,
                        ),),
                    ],
                  )
                ),
              ),),

              Center(child: SizedBox(
                width: 0.95*screenWidth, // set the desired width
                //height: 350, // set the desired height
                child: Card(
                    elevation: 5.0,
                    color: Colors.indigo.shade200,

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("\n  Works At",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: 24,
                            color: Colors.indigo.shade900,
                          ),),

                        Text("       "+docData["hospital_details"]["hospital_name"],
                          textAlign: TextAlign.start,
                          style: const TextStyle(
                            fontSize: 18,
                            fontStyle: FontStyle.italic,
                            color: Colors.black,
                          ),),

                        Text("       "+docData["hospital_details"]["hospital_address"],
                          textAlign: TextAlign.start,
                          style: const TextStyle(
                            fontSize: 18,
                            fontStyle: FontStyle.italic,
                            color: Colors.black,
                          ),),

                        Text("       ${docData["hospital_details"]["hospital_contact_phone"]}",
                          textAlign: TextAlign.start,
                          style: const TextStyle(
                            fontSize: 18,
                            fontStyle: FontStyle.italic,
                            color: Colors.black,
                          ),),

                        const Text(" ",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: 24,
                            fontStyle: FontStyle.italic,
                            color: Colors.black,
                          ),),
                      ],
                    )
                ),
              ),),

              Center(child: SizedBox(
                width: 0.95*screenWidth, // set the desired width
                //height: 350, // set the desired height
                child: Card(
                    elevation: 5.0,
                    color: Colors.indigo.shade200,

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("\n  Book Appointment",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: 24,
                            color: Colors.indigo.shade900,
                          ),),

                        Text(
                          '     Selected Date: ${selectedDate.year}-${selectedDate.month}-${selectedDate.day}',
                          style: const TextStyle(fontSize: 20),
                        ),

                        const Text(" ",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: 5,
                            fontStyle: FontStyle.italic,
                            color: Colors.black,
                          ),),

                        Container(
                            alignment: Alignment.center,
                            child: ElevatedButton(
                              onPressed: () => _selectDate(context),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.indigo.shade900,
                              ),
                              child: const Text('Select Slot Date'),
                            ),
                        ),

                        Text(
                          '     Selected Time: ${selectedTime.hour}:${selectedTime.minute}',
                          style: TextStyle(fontSize: 20),
                        ),

                        const Text(" ",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: 5,
                            fontStyle: FontStyle.italic,
                            color: Colors.black,
                          ),),

                        Container(
                            alignment: Alignment.center,
                            child: ElevatedButton(
                              onPressed: () => _selectTime(context),
                              style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.indigo.shade900,
                              ),
                              child: const Text('Select Slot Time'),
                          )
                        ),

                        const Text(" ",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: 10,
                            fontStyle: FontStyle.italic,
                            color: Colors.black,
                          ),),

                        Container(
                            alignment: Alignment.center,
                            child: ElevatedButton(
                              onPressed: () async => {
                                showDialog( context: context, builder: (BuildContext context) {
                                  return Dialog(
                                  backgroundColor: Colors.transparent,
                                  insetPadding: const EdgeInsets.all(10),
                                  child: Stack(
                                    clipBehavior: Clip.none,
                                    alignment: Alignment.center,
                                    children: <Widget>[
                                      Container(
                                      width: double.infinity,
                                      height: 200,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: Colors.white
                                      ),
                                      padding: const EdgeInsets.fromLTRB(20, 50, 20, 20),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          const Text("For Doctor Appointment Booking,\nA Conformation Email Will be Sent !!",
                                            style: TextStyle(fontSize: 20),
                                            textAlign: TextAlign.center),
                                          TextButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                              Navigator.pop(context);
                                              Navigator.pop(context);
                                            },
                                            child: Container(
                                              padding: const EdgeInsets.all(16),
                                              decoration: BoxDecoration(color: Colors.indigo.shade900, borderRadius: const BorderRadius.all(Radius.circular(32.0))),
                                              child: const Text("Click Here!!",style: TextStyle(color: Colors.white)),
                                            ),
                                         ),
                                        ],
                                      )
                                  ),

                                    Positioned(
                                      top: -100,
                                      child: Image.asset("assets/images/thanks.gif",
                                      width: 150, height: 150)
                                      )
                                    ],
                                  ),
                                );
                              },),



                              response = await http.post(
                              Uri.parse('http://127.0.0.1:5000/api'),
                              body: {
                                "doctor_id": docData['id'],
                                "patient_id": getUser(),
                                "appointment_date": '${selectedDate.year}-${selectedDate.month}-${selectedDate.day}',
                                "appointment_time": '${selectedTime.hour}:${selectedTime.minute}'
                              },
                              )
                            },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.indigo.shade900,
                              ),
                              child: const Text('Book Appointment'),
                            )
                        ),
                      ],
                    )
                ),
              ),),

            ],
          ),
        )
    );
  }
}
