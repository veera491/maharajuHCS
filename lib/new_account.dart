import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class newAccount extends StatefulWidget {
  const newAccount({Key? key}) : super(key: key);

  @override
  State<newAccount> createState() => _newAccountState();
}

class _newAccountState extends State<newAccount> {

  var data = {};
  final _formKey = GlobalKey<FormState>();
  bool showbtn = false;

  bool validateEmail(String email) {
    final RegExp regex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return regex.hasMatch(email);
  }

  bool validatePhoneNumber(String phone) {
    final RegExp regex = RegExp(r'^\+?[1-9]\d{9,11}$');
    return regex.hasMatch(phone);
  }

  String? _validateTextField(String? value, String labelText) {
    var notIn = ["Middle Name", "Alternative Phone Number"];
    var text = 'Please enter Valid Info';

    if(labelText=="Primary Email" || labelText=="Nominee Email"){
      if(!validateEmail(value!)){
        return 'Please enter Correct Email';
      }else{
        return null;
      }
    }

    if(labelText=="Phone Number" || labelText=="Nominee Phone Number"){
      if(!validatePhoneNumber(value!)){
        return 'Please enter Phone Number';
      }else{
        return null;
      }
    }

    if(labelText=="Alternative Phone Number"){
      if(value == null || value.isEmpty){
        return null;
      }else if(!validatePhoneNumber(value)){
        return 'Please enter Phone Number';
      }else{
        return null;
      }
    }

    if(value == null || value.isEmpty && !notIn.contains(labelText)) {
      return text;
    }
    return null;
  }

  String _hintText(String labelText){
    var text = 'Enter your $labelText';
    if(labelText == "Date Of Birth"){
      return '$text, Eg: 01/01/2023';
    }else if(labelText=="Gender"){
      return '$text, Eg: Male/Female';
    }else if(labelText=="Blood Group"){
      return '$text, Eg: O +ve';
    }
    return text;
  }

  Widget wig(String labelText){
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator:(value) => _validateTextField(value, labelText),
        //obscureText: true,
        decoration: InputDecoration(
            border: const OutlineInputBorder(),
            labelText: labelText,
            hintText: _hintText(labelText),
        ),
        onChanged: (value) => data[labelText]=value,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Image.asset('assets/images/logo.png',height: 50,width: 300,
          alignment: Alignment.centerLeft), backgroundColor: Colors.indigo.shade900),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              wig("First Name"),
              wig("Middle Name"),
              wig("Last Name"),
              wig("Date Of Birth"),
              wig("Gender"),
              wig("Blood Group"),
              wig("Aadhaar Number"),
              wig("Pan Card Number"),
              wig("Voter Card Number"),
              wig("Occupation"),
              wig("Primary Address"),
              wig("Primary Email"),
              wig("Bank Name"),
              wig("Branch Name"),
              wig("IFSC Code"),
              wig("Bank Account Number"),
              wig("Phone Number"),
              wig("Alternative Phone Number"),
              wig("Nominee Name"),
              wig("Nominee Phone Number"),
              wig("Nominee Relation"),
              wig("Nominee Email"),
              wig("Nominee Address"),
              Padding(
                  padding: EdgeInsets.only(left: 60, right: 60,bottom: 10,top: 20),
                  child: Container(
                    height: 50,
                    width: 250,
                    decoration: BoxDecoration(
                      color: Colors.indigo.shade900, borderRadius: BorderRadius.circular(20)),
                      child: TextButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
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
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              const Text(
                                                  "For Account Creation,\nA Conformation Email Will be Sent !!",
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


                            http.Response response = await http.post(
                              //http://jsonplaceholder.typicode.com/posts
                              Uri.parse('http://192.168.0.123:5000/api'),
                              headers: {"Content-Type": "application/json"},
                              body: json.encode(data),
                            );
                          }else{
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
                                                  "All are Mandatory Fields",
                                                  style: TextStyle(
                                                      fontSize: 20),
                                                  textAlign: TextAlign.center),
                                              TextButton(
                                                onPressed: () { Navigator.pop(context); },
                                                child: Container(
                                                  padding: const EdgeInsets.all(16),
                                                  decoration: BoxDecoration(color: Colors.indigo.shade900, borderRadius: const BorderRadius.all(Radius.circular(32.0))),
                                                  child: const Text(
                                                      "Click Here!!",
                                                      style: TextStyle(color: Colors.white)
                                                  ),
                                                ),
                                                )
                                            ],
                                          )
                                      ),

                                      Positioned(
                                          top: -100,
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(15.0),
                                            child: Image.asset(
                                                "assets/images/please.gif",
                                                width: 150, height: 150)
                                          )
                                      )
                                    ],
                                  ),
                                );
                              },
                            );
                          }

                        },
                        child: const Text('Submit',style: TextStyle(color: Colors.white, fontSize: 25)),
                      )
                  )
              )
            ],
          ),
        ),
      ),
    );
  }
}
