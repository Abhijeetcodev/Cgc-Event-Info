import 'package:cgc_landran_information/Page/home_page.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cgc_landran_information/Page/home_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AddEvent extends StatefulWidget {
  const AddEvent({Key? key}) : super(key: key);

  @override
  _AddEventState createState() => _AddEventState();
}

class _AddEventState extends State<AddEvent> {
late TextEditingController eventTilteInputController;
late TextEditingController eventDiscriptionInputController;
late TextEditingController eventDateInputController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    eventTilteInputController = TextEditingController();
    eventDiscriptionInputController = TextEditingController();
    eventDateInputController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: 
            Text(" FILL OUT THE FORM PLEASE",
            style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold), 
            ),
        actions: [
          
          Row( 
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

             
              Padding(
                  padding: EdgeInsets.only(right: 20.0),
                
                  child: GestureDetector(
                    onTap: () {
                      eventTilteInputController.clear();
                      eventDateInputController.clear();
                      eventDiscriptionInputController.clear();
                    },
                    child: Icon(
                      Icons.delete,
                      size: 26.0,
                    ),
                  )),
            ],
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(

          children: [
            
           
            
                SizedBox(height: 5,),
                TextField(
                
                autofocus: true,
                
                autocorrect: true,
                decoration: InputDecoration(
                    labelText: "Event Name",
                border: OutlineInputBorder(
                  

                ),
                 
                hintText: 'Enter The Event Name',  
                ),
                controller: eventTilteInputController,
                maxLength: 15,
                
                
              ),
                  
               SizedBox(height: 5,),
               Container(
                height:  150,  
                child: Expanded(
                  
                  child: TextField(
                  autofocus: true,
                  autocorrect: true,
                  maxLines: 10,
                  decoration: InputDecoration(labelText: "Event Description",
                  border: OutlineInputBorder(),
                  hintText: 'Description',),
                  controller: eventDiscriptionInputController,
                  maxLength: 500,
                  minLines: 2,
                  
                ),
            ),
               ),
               SizedBox(height: 5,),
            TextField(
              autofocus: true,
              autocorrect: true,
              decoration: InputDecoration(labelText: "Event date",
              border: OutlineInputBorder(),
               
              hintText: 'Enter The Event Date',  
              ),
              controller: eventDateInputController,
              maxLength: 15,
            ),
             SizedBox(height: 5,),
            ElevatedButton(
                
                onPressed: () {
                  if (eventDateInputController.text.isNotEmpty &&
                      eventDiscriptionInputController.text.isNotEmpty &&
                      eventTilteInputController.text.isNotEmpty) {


                    FirebaseFirestore.instance.collection("user").add({
                      "title": eventTilteInputController.text,
                      "description": eventDiscriptionInputController.text,
                      "date" : eventDateInputController.text,
                     
                    })
                    .then((value) {
                      
                      Navigator.pop(context);
                      eventTilteInputController.clear();
                      eventDateInputController.clear();
                      eventDiscriptionInputController.clear();
                    }).catchError((onError) => print(onError)
                    );
                  }
                },
                 
                child: Text("Save")),
                
            //Spacer(),
          ],
        ),
      ),
    );
  }
}
