// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:pnavigator/spref/pref.dart';

class HomePage extends StatefulWidget {
  final void Function(int, dynamic)? updateMyApp;
  const HomePage({super.key, required this.updateMyApp});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int appColor = 2;
  bool isDark = false;
  bool openFAQ = true;

  @override
  void initState() {
    super.initState();
    PREF.instance.prefs.then((value) => appColor = value.getInt(PREF.appColor) ?? 3);
    PREF.instance.prefs.then((value) => isDark = value.getBool(PREF.isDark) ?? false);
  }
  @override
  Widget build(BuildContext context) {
    var header =Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("p:Navigator", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
        Row ( 
          children: [
            GestureDetector(
          onTap: () => setState(() {
            appColor = 0; widget.updateMyApp!(1, appColor);
          }),
          child: Container (
            height: 24,
            width: 24,
            decoration: BoxDecoration(shape:BoxShape.circle, color: Colors.red),
            child: (appColor == 0) ? Icon(Icons.check_rounded, color: Colors.white,size: 18.0) : null,
            
          ),
        ),
        SizedBox(width: 10,),
        GestureDetector(
          onTap: () => setState(() {
            appColor = 1; widget.updateMyApp!(1, appColor);
          }),
          child: Container (
            height: 24,
          width: 24,
          decoration: BoxDecoration(shape:BoxShape.circle, color: Colors.green),
          child: (appColor == 1) ? Icon(Icons.check_rounded, color: Colors.white,size: 18.0) : null,
          
          ),
        ),
        SizedBox(width: 10,),
        GestureDetector(
          onTap: () => setState(() {
            appColor = 2; widget.updateMyApp!(1, appColor);
          }),
          child: Container (
            height: 24,
          width: 24,
          decoration: BoxDecoration(shape:BoxShape.circle, color: Colors.blue),
          child: (appColor == 2) ? Icon(Icons.check_rounded, color: Colors.white,size: 18.0) : null,
          
          ),
        ),
          ],
        )
      ]
    );
    return Material(
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(24),
          child: Column (
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              header,
              SizedBox(height: 20),
              Flexible(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                        Text("Unlock the secrets of your unique personality type, based on the widely acclaimed Myers-Briggs Type Indicator (MBTI) ✅"),
                  SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          
                        },
                        child: Container(
                          height: 96,
                          width: 96,
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: BorderRadius.circular(16)
                          ),
                          child: Column (
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                            Icon(Icons.manage_accounts_outlined, size: 32, color: Colors.white),
                            SizedBox(height: 5),
                            Text("Test Yourself", style: TextStyle(fontSize: 12,color: Colors.white)),
                          ],)
                        ),
                      ),
                      SizedBox(width: 20),
                      GestureDetector(
                        onTap: () {
                          
                        },
                        child: Container(
                          height: 96,
                          width: 96,
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: BorderRadius.circular(16)
                          ),
                          child: Column (
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                            Icon(Icons.add_circle_outline_outlined, size: 32,color: Colors.white),
                            SizedBox(height: 5),
                            Text("Test Others", style: TextStyle(fontSize: 12,color: Colors.white)),
                          ],)
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          
                        },
                        child: Container(
                          height: 96,
                          width: 96,
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: BorderRadius.circular(16)
                          ),
                          child: Column (
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                            Icon(Icons.file_open_outlined, size: 32,color: Colors.white),
                            SizedBox(height: 5),
                            Text("See Reports", style: TextStyle(fontSize: 12,color: Colors.white)),
                          ],)
                        ),
                      ),
                      SizedBox(width: 20),
                      GestureDetector(
                        onTap: () {
                          
                        },
                        child: Container(
                          height: 96,
                          width: 96,
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: BorderRadius.circular(16)
                          ),
                          child: Column (
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                            Icon(Icons.share, size: 32,color: Colors.white,),
                            SizedBox(height: 5),
                            Text("Share App", style: TextStyle(fontSize: 12, color: Colors.white)),
                          ],)
                        ),
                      ),
                      
                    
                    ],
                  ),
                  SizedBox(height: 40),
                  InkWell(
                    onTap: () => setState(() {
                      openFAQ = !openFAQ;
                    }),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Frequently Asked Questions", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                        Icon(
                          openFAQ ?  Icons.arrow_drop_down_rounded:  Icons.arrow_drop_up_rounded,
                          size: 32)
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: !openFAQ ? null: Card(
                      elevation: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(18),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [       
                                        Text("What is the Myers-Briggs Type Indicator (MBTI)? and How does this app work?"),
                                        SizedBox(height: 10),
                                        ElevatedButton(
                                          onPressed: () {
                                                      
                                          },
                                          child: Text("See Details"),
                                        ),
                        ]),
                      ),
                    ),
                  ),

                  SizedBox(
                    width: double.infinity,
                    child: !openFAQ ? null: Card(
                      elevation: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(18),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [       
                                        Text("How I will delete my account?"),
                                        SizedBox(height: 20),
                                        ElevatedButton(
                                          onPressed: () {
                                            
                                          },
                                          child: Text("Request Account Deletion"),
                                    
                                        ),
                        ]),
                      ),
                    ),
                  ),

                  SizedBox(
                    
                    width: double.infinity,
                    child: !openFAQ ? null: Card(
                      elevation: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(18),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [       
                                        Text("How to change theme of the app?"),
                                        SizedBox(height: 20),
                                        ElevatedButton(
                                          onPressed: () {
                                            setState(() {
                                              isDark = !isDark;
                                              widget.updateMyApp!(2, isDark);
                                            });
                                          },
                                          child: Text("Toggle Theme"),
                                    
                                        ),
                        ]),
                      ),
                    ),
                  ),
                    ],
                  
                )
                
                ),
              )    
          ],)
        ),
      )
      );
  }
}