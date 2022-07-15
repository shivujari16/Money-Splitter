import 'package:flutter/material.dart';
import 'package:flutter_application_9/Dimension.dart';
import 'package:flutter_application_9/home.dart';

class Welcome extends StatefulWidget {
  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  String noPeople = '';
  bool time = false;
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    //print(MyDimension.screenWidth);
    Future.delayed(Duration(seconds: 3),() {
      setState(() {
        time=true;
      });
    });
  
    if(time == false){
      return Container(
        color: Colors.white,
        child: Center(
          child: CircularProgressIndicator(
              color: Color(0xFF5C00A3),
              strokeWidth: 5.0,
          ),
        )
        
      );
    }
    else{
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          //height: MyDimension.screenHeight,
          width: MyDimension.screenWidth,
          child: Column(
            children: [
              Image.asset(
                "assets/top1.jpg",
                width: MyDimension.screenWidth * 0.4,
              ),
              //SizedBox(height: MyDimension.height40),
              SizedBox(height: MyDimension.height15),
              Text(
                "Welcome to Money Splitter",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: MyDimension.font22, color: Color(0xFF5C00A3), fontWeight: FontWeight.bold),
              ),
              SizedBox(height: MyDimension.height20),
              // Container(
              //   height: 200,
              //   width: 200,
              //   decoration: BoxDecoration(color: Colors.blueGrey.withOpacity(0.1), image: DecorationImage(image: AssetImage("assets/moneyfinal.jpg"), fit: BoxFit.cover)),
              // ),
              Image.asset("assets/chat.jpg", height: MyDimension.screenHeight * 0.4),
              SizedBox(height: MyDimension.height20),
              SizedBox(height: MyDimension.height10),
              Form(
                key: formkey,
                child: Padding(
                  padding: EdgeInsets.only(left: MyDimension.height20, right: MyDimension.height20),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      //int val = int.parse(value.toString());
                      //print('val: $val');
                      if (value!.isEmpty) {
                        return "Please Enter Text";
                      }
                      if (int.parse(value.toString()) < 2) {
                        return "Please enter number greater than 1";
                      }
                      return null;
                    },
                    decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)), hintStyle: TextStyle(color: Colors.black), hintText: "How many People you are?", enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0), borderSide: BorderSide(color: Color(0xFF5C00A3), width: 2.0))),
                    onChanged: (value) {
                      noPeople = value;
                    },
                  ),
                ),
              ),
              SizedBox(height: MyDimension.height20),
              GestureDetector(
                onTap: () {
                  print(noPeople);
                  if (formkey.currentState!.validate()) {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Home(totalNo: noPeople)));
              
                  showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                              title: Text("Warning!", style: TextStyle(fontSize: MyDimension.font22, fontWeight: FontWeight.bold)),
                              content: Text.rich(
                                TextSpan(
                                  children: <InlineSpan>[
                                    TextSpan(text: 'Make sure you click ', style: TextStyle(fontSize: MyDimension.font18)),
                                    WidgetSpan(
                                      child: Container(height: MyDimension.height35, width: MyDimension.width25, child: FloatingActionButton(backgroundColor: Color(0xFF7500D1), onPressed: () {}, child: Icon(Icons.done, color: Colors.white, size: MyDimension.icon20))),
                                    ),
                                    TextSpan(text: ' to add data each time', style: TextStyle(fontSize: MyDimension.font18)),
                                  ],
                                ),
                              ),
                              actions: <Widget>[
                                Center(
                                  child: ElevatedButton(
                                    style: ButtonStyle(
                                      minimumSize: MaterialStateProperty.all<Size>(Size(MyDimension.width40, MyDimension.height35)),
                                      backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF7500D1)),
                                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(20.0),
                                        )
                                      )
                                    ),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text("OK"),
                                  ),
                                )
                              ]);
                        });
                }
                },
                child: Container(
                  width: 120,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Color(0xFF7500D1)),
                  child: Text(
                    "GO",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: MyDimension.font22, color: Colors.white),
                  ),
                ),
              ),
              Align(alignment: Alignment.bottomLeft, child: Image.asset("assets/bottom1.png", alignment: Alignment.bottomLeft, width: MyDimension.screenWidth * 0.5, height: MyDimension.screenHeight * 0.15)),
              Text("Developed by Shivam Jariwala",style: TextStyle(color: Colors.grey,fontSize: 12))
            ],
          ),
        ),
      ),
    );
    }
  }
}
