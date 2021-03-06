import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:nazarih/locator.dart';
import 'package:nazarih/routing/route_names.dart';
import 'package:nazarih/services/Shareddata.dart';
import 'package:nazarih/services/auth.dart';
import 'package:nazarih/widgets/centered_view/centered_view.dart';
import 'package:nazarih/widgets/navigation_bar/navigation_bar.dart';
import 'package:nazarih/extensions/hover_extension.dart';
import 'package:nazarih/services/navigation_service.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:sizer/sizer.dart';

class SignupViewMobile extends StatefulWidget {
  @override
  _SignupViewMobileState createState() => _SignupViewMobileState();
}

class _SignupViewMobileState extends State<SignupViewMobile> {
  String phoneNo, name;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final AuthService _auth = AuthService();
  bool error1 = false;
  bool error2 = false;
  bool writing = false;
  bool terms = false;

  Stream<DocumentSnapshot> loadAppInfo() {
    return _firestore.collection('info').doc('app').snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          CenteredView(child: NavigationBar(currentRoute: 'Signup')),
          Container(
            height: 10,
            width: MediaQuery.of(context).size.width,
            color: Color(0xFF2980b9),
          ),
          SizedBox(
            height: 100,
          ),
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: (MediaQuery.of(context).size.width / 2) - 40,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/vectors/login.png',
                        height: 250,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        width: (MediaQuery.of(context).size.width / 2) - 40,
                        child: Directionality(
                          textDirection: TextDirection.rtl,
                          child: TextField(
                            onChanged: (val) {
                              name = val;
                            },
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              fontFamily: 'Bahij',
                              fontSize: 8.sp,
                            ),
                            decoration: InputDecoration(
                                hintText: '???????? ?????????? ??????????',
                                fillColor: Colors.blueGrey[50],
                                filled: true,
                                labelStyle: TextStyle(
                                  fontSize: 8.sp,
                                  fontFamily: 'Bahij',
                                ),
                                hintStyle: TextStyle(
                                  fontSize: 8.sp,
                                  fontFamily: 'Bahij',
                                ),
                                contentPadding: EdgeInsets.only(right: 30),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.blueGrey[50],
                                    ),
                                    borderRadius: BorderRadius.circular(15)),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.blueGrey[50],
                                    ),
                                    borderRadius: BorderRadius.circular(15))),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        width: (MediaQuery.of(context).size.width / 2) - 40,
                        child: Directionality(
                          textDirection: (writing == false)
                              ? TextDirection.rtl
                              : TextDirection.ltr,
                          child: TextField(
                            keyboardType: TextInputType.number,
                            onChanged: (val) {
                              if (val != '') {
                                setState(() {
                                  writing = true;
                                });
                              } else {
                                setState(() {
                                  writing = false;
                                });
                              }
                              phoneNo = val;
                            },
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              fontFamily: "Bahij",
                              fontSize: 8.sp,
                            ),
                            decoration: InputDecoration(
                                hintText: '???????? ?????? ??????????' +
                                    " : " +
                                    "05" +
                                    'xxxxxxxx',
                                fillColor: Colors.blueGrey[50],
                                filled: true,
                                // icon: Icon(Icons.phone_android),
                                labelStyle: TextStyle(
                                  fontSize: 8.sp,
                                  fontFamily: 'Bahij',
                                ),
                                hintStyle: TextStyle(
                                  fontSize: 8.sp,
                                  fontFamily: 'Bahij',
                                ),
                                contentPadding:
                                    EdgeInsets.only(right: 30, left: 30),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.blueGrey[50],
                                    ),
                                    borderRadius: BorderRadius.circular(15)),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.blueGrey[50],
                                    ),
                                    borderRadius: BorderRadius.circular(15))),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        width: (MediaQuery.of(context).size.width / 2) - 40,
                        child: Directionality(
                          textDirection: TextDirection.rtl,
                          child: CheckboxListTile(
                            title: Text(
                              "?????????? ?????? ???????????? ????????????????",
                              style: TextStyle(
                                fontFamily: 'Bahij',
                                fontSize: 8.sp,
                                color: Colors.black,
                              ),
                              textAlign: TextAlign.right,
                            ),
                            value: terms,
                            onChanged: (newValue) {
                              setState(() {
                                terms = newValue;
                              });
                            },
                            controlAffinity: ListTileControlAffinity.leading,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        width: (MediaQuery.of(context).size.width / 2) - 40,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.blue[100],
                                  spreadRadius: 10,
                                  blurRadius: 20)
                            ]),
                        child: ElevatedButton(
                          child: Container(
                            width: double.infinity,
                            height: 50,
                            child: Center(
                                child: Text(
                              "???????? ????????",
                              style: TextStyle(
                                fontSize: 8.sp,
                                fontFamily: 'Bahij',
                              ),
                            )),
                          ),
                          onPressed: () async {
                            if (name == null ||
                                phoneNo == null ||
                                name == '' ||
                                phoneNo == '' ||
                                terms == false) {
                              setState(() {
                                error1 = true;
                              });
                            } else {
                              if (phoneNo.length != 10) {
                                setState(() {
                                  error1 = true;
                                });
                              } else {
                                if (error1 == true) {
                                  setState(() {
                                    error1 = false;
                                  });
                                }
                                var test = await _firestore
                                    .collection('users')
                                    .doc(phoneNo.replaceAll(' ', ''))
                                    .get();
                                if (test.exists == true) {
                                  setState(() {
                                    error1 = false;
                                    error2 = true;
                                  });
                                } else {
                                  savePhoneNumber(phoneNo);
                                  saveName(name);
                                  saveLogin(true);
                                  await _firestore
                                      .collection('users')
                                      .doc(phoneNo.replaceAll(' ', ''))
                                      .set({
                                    'Phone Number': phoneNo.replaceAll(' ', ''),
                                    'Name': name,
                                    'Commission': 'unpaid',
                                    'Membership': 'free',
                                    'rating': 0,
                                    'date': DateTime.now(),
                                    'last_seen': DateTime.now(),
                                    'photo_url': '/default/profile_default.png',
                                  });
                                  locator<NavigationService>()
                                      .navigateTo(HomeRoute);
                                }
                              }
                            }
                          },
                          style: ElevatedButton.styleFrom(
                              primary: Color(0xFF2980b9),
                              onPrimary: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15))),
                        ),
                      ).mouseUpOnHover,
                      (error1 == true)
                          ? Container(
                              width:
                                  (MediaQuery.of(context).size.width / 2) - 40,
                              height: 50,
                              child: Center(
                                child: Text(
                                  "???????????? ?????????? ?????????????????? ???????? ????????",
                                  style: TextStyle(
                                    fontSize: 8.sp,
                                    color: Colors.red,
                                    fontFamily: 'Bahij',
                                  ),
                                ),
                              ),
                            )
                          : (error2 == true)
                              ? Container(
                                  width:
                                      (MediaQuery.of(context).size.width / 2) -
                                          40,
                                  height: 50,
                                  child: Center(
                                    child: Text(
                                      "?????? ?????????? ???????? ???? ?????????? ???????????????? ???????????? ?????????? ????????????",
                                      style: TextStyle(
                                        fontSize: 8.sp,
                                        color: Colors.red,
                                        fontFamily: 'Bahij',
                                      ),
                                    ),
                                  ),
                                )
                              : Container(),
                    ],
                  ),
                ),
                Container(
                  width: (MediaQuery.of(context).size.width / 2) - 40,
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "???????? ???????? ???????? \n???? ???????? ????????",
                          style: TextStyle(
                              fontFamily: 'Bahij',
                              fontSize: 18.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.end,
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          "?????? ?????? ???????? ????????",
                          style: TextStyle(
                              fontFamily: 'Bahij',
                              fontSize: 20,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.end,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            locator<NavigationService>().navigateTo(LoginRoute);
                          },
                          child: Text(
                            "?????????? ?????????? ???????????? ???? ???????? ???????? ????????",
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                fontFamily: 'Bahij',
                                fontSize: 12.sp,
                                color: Color(0xFF2980b9),
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.right,
                          ),
                        ).showCursorOnHover.mouseUpOnHover,
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 100,
          ),
          Container(
            height: 10,
            width: MediaQuery.of(context).size.width,
            color: Color(0xFF2980b9),
          ),
          Container(
            height: 250,
            child: StreamBuilder<DocumentSnapshot>(
              stream: loadAppInfo(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  String appstore = snapshot.data.data()['appstore'];
                  String playstore = snapshot.data.data()['playstore'];
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          launch(playstore);
                        },
                        child: Image.asset(
                          'assets/images/icons/googleplay.png',
                          height: 100,
                          width: 150,
                        ).mouseUpOnHover.showCursorOnHover,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      GestureDetector(
                        onTap: () {
                          launch(appstore);
                        },
                        child: Image.asset(
                          'assets/images/icons/appstore.png',
                          height: 100,
                          width: 150,
                        ).mouseUpOnHover.showCursorOnHover,
                      ),
                    ],
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
