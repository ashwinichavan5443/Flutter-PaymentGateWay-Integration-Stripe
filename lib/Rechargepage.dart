import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Transactionpage.dart';
class RechargePage extends StatefulWidget
{
  _RechargePageState createState()=>new _RechargePageState();
}
TextEditingController PhoneNo = new TextEditingController();
TextEditingController Amount = new TextEditingController();
TextEditingController Serviceprovider = new TextEditingController();

class _RechargePageState extends State<RechargePage>{

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[200],
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(
                top: 60.0, left: 30.0, right: 30.0, bottom: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                InkWell(
                            onTap: () {
                Navigator.pop(context);
                },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(left: 0, top: 10, bottom: 10),
                          child: Icon(Icons.keyboard_arrow_left, color: Colors.white),
                        ),
                        Text('Back',
                            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500,color: Colors.white))
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 70),
              ],
            ),
          ),
          Expanded(

            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),

              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40.0),
                  topRight: Radius.circular(40.0),
                ),
              ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 70),
                    Text(
                      "Recharge",
                      style: GoogleFonts.portLligatSans(
                        textStyle: Theme.of(context).textTheme.display1,
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 40),
                    Text(
                      "Phone No:",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                    SizedBox(height: 15),
                    TextField(
                        keyboardType: TextInputType.phone,
                      controller: PhoneNo,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Enter Phone No.',
                        hintText: 'Enter Phone No.',
                      ),
                      autofocus: false,
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Service Provider Name:",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                    SizedBox(height: 15),
                    TextField(
                      controller: Serviceprovider,

                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Enter Service Provider Name',
                        hintText: 'Enter Service Provider Name',
                      ),
                      autofocus: false,
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Amount:",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                    SizedBox(height: 15),
                    TextField(
                        keyboardType: TextInputType.number,
                        controller: Amount,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Enter Amount ',
                        hintText: 'Enter Amount',
                      ),
                      autofocus: false,
                    ),
                    SizedBox(height: 25),
                    ButtonTheme(
                      minWidth: 400.0,
                      height: 50,
                      child: RaisedButton(

                        shape: RoundedRectangleBorder(

                            borderRadius: BorderRadius.circular(10.0),
                            side: BorderSide(color: Colors.purple[200])),
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (_) =>  Transaction(Amount.text)),
                          );
                        },
                        color: Colors.purple[200],
                        textColor: Colors.white,
                        child: Text("Login".toUpperCase(),
                            style: TextStyle(fontSize: 14)),
                      ),),
                  ],

                ),
            ),
          ),

        ],
      ),
    );
  }
}
