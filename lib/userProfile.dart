import 'package:flutter/material.dart';

Widget col(String name, String value, double screenWidth){
  return Container(
      width: screenWidth,
      //height: 60,
      //padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
        ),
        color: Colors.indigo.shade300,
        elevation: 10,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("    $name:",style: const TextStyle(
              color: Colors.black54,
              fontSize: 14,
              fontStyle: FontStyle.italic,
            ),
            ),
          Text("    $value",style: const TextStyle(
          color: Colors.black,
          fontSize: 24,
          fontStyle: FontStyle.italic,
          )),
          ],
        )
    ),
  );
}

Widget userdet(Map<String, dynamic> user_details, double screenWidth){
  print(user_details);
  return SingleChildScrollView(
    child: Column(
      children: [
        col("First Name",user_details["First Name"].toString(),screenWidth),
        col("Middle Name",user_details["Middle Name"].toString(),screenWidth),
        col("Last Name",user_details["Last Name"].toString(),screenWidth),
        col("Date Of Birth",user_details["Date Of Birth"].toString(),screenWidth),
        col("Gender",user_details["Gender"].toString(),screenWidth),
        col("Blood Group",user_details["Blood Group"].toString(),screenWidth),
        col("Aadhaar Number",user_details["Aadhaar Number"].toString(),screenWidth),
        col("Pan Card Number",user_details["Pan Card Number"].toString(),screenWidth),
        col("Voter Card Number",user_details["Voter Card Number"].toString(),screenWidth),
        col("Occupation",user_details["Occupation"].toString(),screenWidth),
        col("Primary Address",user_details["Primary Address"].toString(),screenWidth),
        col("Primary Email",user_details["Primary Email"].toString(),screenWidth),
        col("Bank Name",user_details["Bank Name"].toString(),screenWidth),
        col("Branch Name",user_details["Branch Name"].toString(),screenWidth),
        col("IFSC Code",user_details["IFSC Code"].toString(),screenWidth),
        col("Bank Account Number",user_details["Bank Account Number"].toString(),screenWidth),
        col("Phone Number",user_details["Phone Number"].toString(),screenWidth),
        col("Alternative Phone Number",user_details["Alternative Phone Number"].toString(),screenWidth),
        col("Nominee Name",user_details["Nominee Name"].toString(),screenWidth),
        col("Nominee Phone Number",user_details["Nominee Phone Number"].toString(),screenWidth),
        col("Nominee Relation",user_details["Nominee Relation"].toString(),screenWidth),
        col("Nominee Email",user_details["Nominee Email"].toString(),screenWidth),
        col("Nominee Address",user_details["Nominee Address"].toString(),screenWidth),
      ],
    ),
  );
}

class user extends StatefulWidget {
  final Map<String, dynamic> user_details;
  const user({Key? key, required this.user_details}) : super(key: key);

  @override
  State<user> createState() => _userState(user_details);
}

class _userState extends State<user> {

  final Map<String, dynamic> user_details;
  _userState(this.user_details);
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Image.asset('assets/images/logo.png',height: 50,width: 300,
            alignment: Alignment.centerLeft),
        backgroundColor: Colors.indigo.shade900,
      ),
      body: userdet(user_details,screenWidth)
      );
  }
}
