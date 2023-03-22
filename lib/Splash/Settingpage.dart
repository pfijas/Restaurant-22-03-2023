import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Editprofilepage.dart';
import 'Profilepage.dart';
class setting_1 extends StatefulWidget {
  const setting_1({Key? key}) : super(key: key);

  @override
  State<setting_1> createState() => _setting_1State();
}

class _setting_1State extends State<setting_1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        leading:  IconButton( onPressed: (){
          Navigator.pop(context);
        },icon:Icon(Icons.arrow_back_ios,size: 20,color: Colors.black,)),
        title: Text("Settings",
          style: GoogleFonts.notoSerifLao(),

        ),
      ),
      body: ListView(
        children: [
          Card(
              elevation: 10,
              child: Column(
                children: [
                  SizedBox(height: 20,),
                  SizedBox(
                      child: Text("Account Settings",style:TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),)),
                  InkWell(onTap:(){Navigator.of(context).push(MaterialPageRoute(builder: (context) =>Editprofile(),));} ,child: ListTile(leading: Icon(Icons.account_circle_outlined),title:Text("Edit Profile"),trailing: Icon(Icons.chevron_right),)),
                  InkWell(onTap:(){},child:ListTile(leading: Icon(Icons.account_balance_wallet_outlined),title:Text("Saved Card & Wallet"),trailing: Icon(Icons.chevron_right),)),
                  InkWell(onTap:(){},child:ListTile(leading: Icon(Icons.location_on_outlined),title:Text("Saved Addresses"),trailing: Icon(Icons.chevron_right),)),
                  ListTile(leading: Icon(Icons.edit_notifications_outlined),title:Text("Notification Settings"),trailing: Icon(Icons.chevron_right),),
                ],
              ),
              ),
          Card(
            elevation: 20,
            child: Column(
              children: [
                SizedBox(height:40),
                Text("My Activity", style:TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),),
               InkWell(onTap: (){},child: ListTile(leading: Icon(Icons.reviews),title: Text("Reviews"), trailing: Icon(Icons.chevron_right),),),
                InkWell(onTap: (){},child: ListTile(leading: Icon(Icons.question_answer),title: Text("Question and answer"), trailing: Icon(Icons.chevron_right),),),
              ],
            ),
          ),
          Card(
            elevation: 10,
            child: Column(
              children: [
                SizedBox(height: 10,),
                Text("Feedback & information",style:TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),),
                InkWell(onTap:(){},child: ListTile(leading: Icon(Icons.paste_outlined),title:Text("Terms,Policies and Licenses"),trailing: Icon(Icons.chevron_right),)),
                InkWell(onTap:(){},child:ListTile(leading: Icon(Icons.question_mark_outlined),title:Text("Browse FAQs"),trailing: Icon(Icons.chevron_right),)),
              ],
            ),
          ),

      ],
      ),

    );
  }
}
