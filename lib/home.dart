import 'package:flutter/material.dart';
import 'package:flutter_application_9/Dimension.dart';
import 'package:collection/collection.dart';
import 'package:flutter_application_9/welcome.dart';

class Home extends StatefulWidget {
  String totalNo;
  Home({required this.totalNo});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  static List<String> name = [];
  static List<int> a = [];
  static List<String> ans = [];

  String nm = '';
  int amt = 0;

  GlobalKey add = GlobalKey();

  @override
  Widget build(BuildContext context) {
    //print(int.parse(widget.No));

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            name.clear();
            a.clear();
            ans.clear();
            Navigator.push(context, MaterialPageRoute(builder: (context) => Welcome()));
          },
        ),
        title: Text("Splitter", textAlign: TextAlign.center, style: TextStyle(fontSize: MyDimension.font22, color: Colors.white)),
        backgroundColor: Color(0xFF7500D1),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
                shrinkWrap: true,
                physics: ScrollPhysics(),
                itemCount: int.parse(widget.totalNo),
                itemBuilder: (context, index) {
                  return Column(children: [
                    SizedBox(height: MyDimension.height20),
                    Row(
                      children: [
                        Form(
                          autovalidateMode: AutovalidateMode.always,
                          child: Container(
                              padding: EdgeInsets.only(left: MyDimension.width15),
                              width: MyDimension.width200,
                              child: TextFormField(
                                decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)), hintStyle: TextStyle(color: Colors.black), hintText: "Name of Person", enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0), borderSide: BorderSide(color: Color(0xFF5C00A3), width: 2.0))),
                                onChanged: (value) {
                                  nm = value;
                                },
                              )),
                        ),
                        SizedBox(width: MyDimension.width15),
                        Form(
                          autovalidateMode: AutovalidateMode.always,
                          child: Container(
                              //padding: EdgeInsets.only(right: MyDimension.height10),
                              width: MyDimension.width90,
                              child: TextFormField(
                                decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)), hintStyle: TextStyle(color: Colors.black), hintText: "Amount", enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0), borderSide: BorderSide(color: Color(0xFF5C00A3), width: 2.0))),
                                onChanged: (value) {
                                  amt = int.parse(value);
                                },
                                keyboardType: TextInputType.number,
                              )),
                        ),
                        SizedBox(width: MyDimension.width10),
                        Container(
                            height: MyDimension.height35,
                            width: MyDimension.width25,
                            child: FloatingActionButton(
                                heroTag: "btn$index",
                                backgroundColor: Color(0xFF7500D1),
                                onPressed: () {
                                  name.add(nm);
                                  a.add(amt);
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(title: Text("Added", style: TextStyle(fontSize: MyDimension.font22, fontWeight: FontWeight.bold)), content: Text("Data Added successfully!",style: TextStyle(fontSize: MyDimension.font18)), actions: <Widget>[
                                          Center(
                                            child:ElevatedButton(
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
                                },
                                child: Icon(Icons.done, color: Colors.white, size: MyDimension.icon20))),
                      ],
                    ),
                  ]);
                }),
            SizedBox(height: MyDimension.height20),
            GestureDetector(
              onTap: () {
                print(name);
                print(a);
                print(a.sum);
                //List<int> a = [];
                double avg = a.sum / a.length;
                for (int i = 0; i < a.length; i++) {
                  a[i] = a[i] - avg.toInt();
                  //print(a[i]);
                }
                print(a);
                //Navigator.push(context, MaterialPageRoute(builder: (context) => Home(totalNo: noPeople)));
                for (int i = 0; i < a.length; i++) {
                  for (int j = 0; j < a.length; j++) {
                    if (a[i] < 0) {
                      if (a[i].abs() < a[j] && i != j && a[j] > 0) {
                        a[j] = a[j] + a[i];
                        ans.add('${name[i]} has to pay ${a[i].abs()} rupees to ${name[j]}');
                        a[i] = 0;
                      } else if (a[i].abs() >= a[j] && i != j && a[j] > 0) {
                        a[i] = a[j] - a[i].abs();
                        ans.add('${name[i]} has to pay ${a[j]} rupees to ${name[j]}');
                        a[j] = 0;
                      }
                    } else {
                      break;
                    }
                  }
                }
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                          title: Text("Summary", style: TextStyle(fontSize: MyDimension.font22, fontWeight: FontWeight.bold)),
                          content: SingleChildScrollView(
                              child: ListBody(
                            children: <Widget>[
                              if (a.isEmpty)
                                Text("Please add details", style: TextStyle(fontSize: MyDimension.font18))
                              else
                                for (int i = 0; i < ans.length; i++) Text(ans[i], style: TextStyle(fontSize: MyDimension.font18)),
                            ],
                          )),
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
                print(ans);
              },
              child: Container(
                width: 120,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Color(0xFF7500D1)),
                child: Text(
                  "Split",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: MyDimension.font22, color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
