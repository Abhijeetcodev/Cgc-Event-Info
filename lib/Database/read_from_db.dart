import 'package:cgc_landran_information/Page/Eventdetail.dart';
import 'package:cgc_landran_information/Page/update_Event.dart';
import 'package:cgc_landran_information/widget/sign_up_widget.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cgc_landran_information/Page/Event_add_class.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

EventdetailAddClass event = new EventdetailAddClass();

class UserInformation extends StatefulWidget {
  @override
  _UserInformationState createState() => _UserInformationState();
}

class _UserInformationState extends State<UserInformation> {
  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('user').snapshots();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _usersStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        
        return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                height: 150,
                
                child: Container(
                decoration:  BoxDecoration(
             borderRadius: BorderRadius.circular(50),
            
            ),
          
                  child: Card(
                  
                    
                    elevation: 10,
                    child: Column(
                      children: [
                        ListTile(
                          
                            leading: Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                    color: Colors.green,
                    image: DecorationImage(
                      image: AssetImage("assets/images/colorful.jpg"),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(10.0)))),
                            title: Text(
                              snapshot.data!.docs[index]['title'],
                              textScaleFactor: 1.5,
                            ),
                            trailing: Text(snapshot.data!.docs[index]['date']),
                            subtitle:
                                Text( snapshot.data!.docs[index]['description'],
        maxLines: 1,softWrap: true,
        style: TextStyle(fontSize: 18),
        overflow: TextOverflow.ellipsis,),
                              
                            selected: true,
                            
                            onTap: () {
                              
                              event.titleEventfun =
                                  snapshot.data!.docs[index]['title'];
                              event.discriptionfun =
                                  snapshot.data!.docs[index]['description'];
                              event.dateofEventfun =
                                  snapshot.data!.docs[index]['date'];
                              event.idOfEventfun = snapshot.data!.docs[index].id;
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Eventdetails()),
                              );
                            }),
                        Row(
                          children: [
                            Visibility(
                              visible: Admin,
                              child: IconButton(
                                  
                                  icon: Icon(
                                    FontAwesomeIcons.edit,
                                    size: 15,
                                  ),
                                  onPressed: () async {
                                    event.titleEventfun =
                                        snapshot.data!.docs[index]['title'];
                                    event.discriptionfun =
                                        snapshot.data!.docs[index]['description'];
                                    event.dateofEventfun =
                                        snapshot.data!.docs[index]['date'];
                                    event.idOfEventfun = snapshot.data!.docs[index].id; 
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => UpdateEvent()),
                                    );
                                  }),
                            ),
                            Visibility(
                              visible: Admin,
                              child: IconButton(
                                onPressed: () async {
                                  event.idOfEventfun =
                                      snapshot.data!.docs[index].id;

                                  await FirebaseFirestore.instance
                                      .collection('user')
                                      .doc(event.idOfEventfun)
                                      .delete();
                                },
                                icon: Icon(
                                  FontAwesomeIcons.trashAlt,
                                  size: 15,
                                ),
                              ),
                            ),
                          //  IconButton(onPressed: (){

                          //  }, icon: Fal)
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            });
      },
    );
  }
}
