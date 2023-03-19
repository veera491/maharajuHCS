import 'package:flutter/material.dart';
import 'package:maharaju/under.dart';

Widget card_scroller(BuildContext context, List<String> mylist, List<dynamic> mylist1){
  List<Widget> lst = [];
  for(var i=0;i<mylist.length;i++){
    lst.add(
      GestureDetector(
        onTap: () {
          Navigator.of(context).push(
              MaterialPageRoute(
                  builder:(context) => mylist1[i] )
          );
        },
        child: Container(
          padding: const EdgeInsets.all(15),
          child: Card(
            elevation: 10.0,
            color: Colors.indigo.shade300,
            child: Container(
              width: 200,
              height: 200,
              padding: const EdgeInsets.all(15),
              child: Center(
                  child: Image.asset(mylist[i])
              ),
            ),
          ),
        )
      ),
    );
  }
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: lst,
    ),
  );
}

List<Widget> doc_carder(BuildContext context, List mylist) {
  List<Widget> lst = [];
  for(var i=0;i<mylist.length;i++){
    lst.add(
      GestureDetector(
        onTap: () {
           Navigator.of(context).push(
               MaterialPageRoute(
                   builder:(context) => const under() ));
        },
        child: Card(
          color: Colors.indigo.shade300,
          child: Container(
              width: 300,
              height: 100,
              padding: const EdgeInsets.all(16),
              child: Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/veera.jpg'),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Center(
                          child: Text('Dr.Veera Sutapalli',style: TextStyle(
                            fontSize: 24,
                            color: Colors.black,
                          ),),
                        ),

                        Center(
                            child: Text('Mbbs,M.S. - Cardiology',style: TextStyle(
                              fontSize: 14,
                              color: Colors.black54,
                            ),)
                        ),
                      ],
                    )
                  ],
                ),
              )
          ),
        ),
      ),
    );
  }
  return lst;
}

