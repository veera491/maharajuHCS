import 'package:flutter/material.dart';

class docSlot extends StatefulWidget {
  const docSlot({Key? key}) : super(key: key);

  @override
  State<docSlot> createState() => _docSlotState();
}

class _docSlotState extends State<docSlot> {
  String dropdownValue = 'Monday';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Image.asset('assets/images/logo.png',height: 50,width: 300,
            alignment: Alignment.centerLeft), backgroundColor: Colors.indigo.shade900),
        body: Column(
          children: [
            Stack(
              children: [
                Image.asset('assets/images/veera.jpg'),
                const Text('Dr.Veera Sutapalli\nOne of the our Best Doctors',style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontStyle: FontStyle.italic,
                ),),
              ],
            ),

            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(bottomRight:  Radius.circular(20.0),bottomLeft: Radius.circular(20.0)),
                color: Colors.indigo.shade300,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Book a Slot : ',style: TextStyle(fontSize: 28),),

                  DropdownButton<String>(
                    value: dropdownValue,
                    items: <String>['Monday', 'Tuesday', 'Wednesday', 'Thursday','Friday','Saturday','Sunday'].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: const TextStyle(fontSize: 24),
                        ),
                      );}).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownValue = newValue!;
                      });
                    },
                  ),
                ],
              ),
            ),
            const Text("\n\n\n"),
            ElevatedButton(onPressed: (){
              showDialog(
                context: context,
                builder: (BuildContext context) {
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
                                borderRadius: BorderRadius
                                    .circular(15),
                                color: Colors.white
                            ),
                            padding: const EdgeInsets.fromLTRB(
                                20, 50, 20, 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Text(
                                    "For Slot Booking,\nA Conformation Email Will be Sent !!",
                                    style: TextStyle(
                                        fontSize: 20),
                                    textAlign: TextAlign.center),
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context)
                                        .popUntil((route) =>
                                    route.isFirst);
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(16),
                                    decoration: BoxDecoration(color: Colors.indigo.shade900, borderRadius: const BorderRadius.all(Radius.circular(32.0))),
                                    child: const Text(
                                        "Click Here!!",
                                        style: TextStyle(color: Colors.white)),
                                  ),
                                ),
                              ],
                            )
                        ),

                        Positioned(
                            top: -100,
                            child: Image.asset(
                                "assets/images/thanks.gif",
                                width: 150, height: 150)
                        )
                      ],
                    ),
                  );
                },
              );
            },style: ElevatedButton.styleFrom(
              backgroundColor: Colors.indigo.shade900,
            ), child: const Text('Confirm the slot'),)
          ],
        )
    );
  }
}
