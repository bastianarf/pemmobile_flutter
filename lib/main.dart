import 'dart:convert';
import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:pemmobile_flutter/data/data.dart';
import 'package:pemmobile_flutter/model/detailmodel.dart';
import 'package:pemmobile_flutter/model/hotelmodel.dart';
import 'package:pemmobile_flutter/model/artikelmodel.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:shared_preferences/shared_preferences.dart';
void main() {
  runApp(MaterialApp(
    home: Login(),
    theme: ThemeData(),
  ));
}

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

enum LoginStatus { notSignIn, signIn }

class _LoginState extends State<Login> {
  LoginStatus _loginStatus = LoginStatus.notSignIn;
  String email, password;
  final _key = new GlobalKey<FormState>();

  bool _secureText = true;

  showHide() {
    setState(() {
      _secureText = !_secureText;
    });
  }

  check() {
    final form = _key.currentState;
    if (form.validate()) {
      form.save();
      login();
    }
  }

  login() async {
    final response = await http.post("http://testing-flutter022.000webhostapp.com/login.php",
        body: {"email": email, "password": password});
    final data = jsonDecode(response.body);
    int value = data['value'];
    String pesan = data['message'];
    String emailAPI = data['email'];
    String namaAPI = data['nama'];
    String id = data['id'];
    if (value == 1) {
      setState(() {
        _loginStatus = LoginStatus.signIn;
        savePref(value, emailAPI, namaAPI, id);
      });
      print(pesan);
    } else {
      print(pesan);
    }
  }

  savePref(int value, String email, String nama, String id) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      preferences.setInt("value", value);
      preferences.setString("nama", nama);
      preferences.setString("email", email);
      preferences.setString("id", id);
      preferences.commit();
    });
  }

  var value;
  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      value = preferences.getInt("value");

      _loginStatus = value == 1 ? LoginStatus.signIn : LoginStatus.notSignIn;
    });
  }

  signOut() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      preferences.setInt("value", null);
      preferences.commit();
      _loginStatus = LoginStatus.notSignIn;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPref();
  }

  @override
  Widget build(BuildContext context) {
    switch (_loginStatus) {
      case LoginStatus.notSignIn:
        return Scaffold(
          appBar: AppBar(
            title: Text("Login"),
          ),
          body: Form(
            key: _key,
            child: ListView(
              padding: EdgeInsets.all(16.0),
              children: <Widget>[
                TextFormField(
                  validator: (e) {
                    if (e.isEmpty) {
                      return "Silahkan masukkan email anda";
                    }
                  },
                  onSaved: (e) => email = e,
                  decoration: InputDecoration(
                    labelText: "email",
                  ),
                ),
                TextFormField(
                  obscureText: _secureText,
                  onSaved: (e) => password = e,
                  decoration: InputDecoration(
                    labelText: "Password",
                    suffixIcon: IconButton(
                      onPressed: showHide,
                      icon: Icon(_secureText
                          ? Icons.visibility_off
                          : Icons.visibility),
                    ),
                  ),
                ),
                MaterialButton(
                  onPressed: () {
                    check();
                  },
                  child: Text("Login"),
                ),
                MaterialButton(
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => Register()));
                  },
                  child: Text(
                    "Buat Akun Baru. Klik Disini",
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            ),
          ),
        );
        break;
      case LoginStatus.signIn:
        return MainMenu(signOut);
        break;
    }
  }
}
class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String email, password, nama;
  final _key = new GlobalKey<FormState>();

  bool _secureText = true;

  showHide() {
    setState(() {
      _secureText = !_secureText;
    });
  }

  check() {
    final form = _key.currentState;
    if (form.validate()) {
      form.save();
      save();
    }
  }

  save() async {
    final response = await http.post("http://testing-flutter022.000webhostapp.com/register.php",
        body: {"nama": nama, "email": email, "password": password});
    final data = jsonDecode(response.body);
    int value = data['value'];
    String pesan = data['message'];
    if (value == 1) {
      setState(() {
        Navigator.pop(context);
      });
    } else {
      print(pesan);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register"),
      ),
      body: Form(
        key: _key,
        child: ListView(
          padding: EdgeInsets.all(16.0),
          children: <Widget>[
            TextFormField(
              validator: (e) {
                if (e.isEmpty) {
                  return "Masukkan Nama Lengkap";
                }
              },
              onSaved: (e) => nama = e,
              decoration: InputDecoration(labelText: "Nama Lengkap"),
            ),
            TextFormField(
              validator: (e) {
                if (e.isEmpty) {
                  return "Masukkan Email";
                }
              },
              onSaved: (e) => email = e,
              decoration: InputDecoration(labelText: "email"),
            ),
            TextFormField(
              obscureText: _secureText,
              onSaved: (e) => password = e,
              decoration: InputDecoration(
                labelText: "Password",
                suffixIcon: IconButton(
                  onPressed: showHide,
                  icon: Icon(
                      _secureText ? Icons.visibility_off : Icons.visibility),
                ),
              ),
            ),
            MaterialButton(
              onPressed: () {
                check();
              },
              child: Text("Register"),
            )
          ],
        ),
      ),
    );
  }
}

class LoginMenu extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

  }
}

class MainMenu extends StatefulWidget {
  final VoidCallback signOut;
  MainMenu(this.signOut);
  @override
  _MainMenuState createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  List<HotelModel> hotel = new List();
  List<ArtikelModel> artikel = new List();
  List<DetailModel> detail = new List();
  signOut() {
    setState(() {
      widget.signOut();
    });
  }

//  String email = "", nama = "";
//  TabController tabController;

  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
//      email = preferences.getString("email");
//      nama = preferences.getString("nama");
    });
  }

  @override
  void initState() {
    hotel = getHotels();
    artikel = getArtikel();
    detail = getDetails();
    super.initState();
    getPref();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
          appBar: AppBar(
            leading: InkWell(
              onTap: (){ Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => LoginMenu(),
                ),
              );},
              child: Container(
                padding: EdgeInsets.all(7),
                child: Image.asset(
                  "assets/menu.png",
                  height: 20,
                  width: 20,
                ),
              ),
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/logo1.png",
                  height: 30,
                ),
                Text(
                  " RentRoom",
                  style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
                )
              ],
            ),
      /*      actions: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Icon(
                  Icons.more_vert,
                  color: Colors.white,
                ),
              )
            ],
            //actions
            */
            actions: <Widget>[
              IconButton(
                onPressed: () {
                  signOut();
                },
                icon: Icon(Icons.lock_open),
              )
            ],
            elevation: 0.0,
          ),
          body: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Text(
                "Temukan Hotel Favoritmu",
                style: TextStyle(
                    fontSize: 28,
                    color: Colors.black54,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                "Hotel Pilihan",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.black54,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                height: 240,
                child: ListView.builder(
                    itemCount: hotel.length,
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return HotelListTile(
                        label: hotel[index].label,
                        hotelName: hotel[index].hotelName,
                        hotelAddress: hotel[index].hotelAddress,
                        rating: hotel[index].rating,
                        imgUrl: hotel[index].imgUrl,
                      );
                    }),
              ),
              SizedBox(
                height: 8,
              ),
                  Text(
                    "Artikel",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black54,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  ListView.builder(
                      shrinkWrap: true,
                      physics: ClampingScrollPhysics(),
                      itemCount: artikel.length,
                      itemBuilder: (context, index) {
                        return ArtikelListTile(
                          desc: artikel[index].desc,
                          imgUrl: artikel[index].imgUrl,
                          title: artikel[index].title,
                        );
                      })
            ]),
          ),
      ),
      ),
    );
  }
}

class HotelListTile extends StatelessWidget {
  final String label;
  final String hotelName;
  final String hotelAddress;
  final double rating;
  final String imgUrl;
  HotelListTile(
      {@required this.hotelName,
        @required this.label,
        @required this.hotelAddress,
        @required this.rating,
        @required this.imgUrl});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: () {
      //   Navigator.push(
      //       context,
      //       MaterialPageRoute(
      //           builder: (context) => Details(
      //             imgUrl: imgUrl,
      //             placeName: title,
      //             rating: rating,
      //           )));
      // },
      child: Container(
        margin: EdgeInsets.only(right: 8),
        child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: CachedNetworkImage(
              imageUrl: imgUrl,
              height: 220,
              width: 150,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            height: 200,
            width: 150,
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                        margin: EdgeInsets.only(left: 8, top: 8),
                        padding:
                        EdgeInsets.symmetric(vertical: 6, horizontal: 8),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.white38),
                        child: Text(
                          label ?? "New",
                          style: TextStyle(color: Colors.white),
                        ))
                  ],
                ),
                Spacer(),
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 10, left: 8, right: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Text(
                              hotelName,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16),
                            ),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Text(
                            hotelAddress,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 13),
                          )
                        ],
                      ),
                    ),
                    Spacer(),
                    Container(
                        margin: EdgeInsets.only(bottom: 10, right: 8),
                        padding:
                        EdgeInsets.symmetric(horizontal: 3, vertical: 7),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3),
                            color: Colors.white38),
                        child: Column(
                          children: [
                            Text(
                              "4.5",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 13),
                            ),
                            SizedBox(
                              height: 2,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.white,
                              size: 20,
                            )
                          ],
                        ))
                  ],
                )
              ],
            ),
          )
        ],
      ),
    )
    );
  }
}

class ArtikelListTile extends StatelessWidget {
  final String imgUrl;
  final String title;
  final String desc;
  ArtikelListTile(
      {@required this.imgUrl,
        @required this.desc,
        @required this.title});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
     // onTap: () {
     //   Navigator.push(
     //       context,
     //       MaterialPageRoute(
     //           builder: (context) => Details(
     //             imgUrl: imgUrl,
     //             placeName: title,
     //             rating: rating,
     //           )));
     // },
      child: Container(
        margin: EdgeInsets.only(bottom: 8),
        decoration: BoxDecoration(
            color: Color(0xffE9F4F9), borderRadius: BorderRadius.circular(20)),
        child:SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    bottomLeft: Radius.circular(20)),
                child: CachedNetworkImage(
                  imageUrl: imgUrl,
                  width: 110,
                  height: 90,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff4E6059)),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Text(
                      desc,
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff89A097)),
                    ),
                    SizedBox(
                      height: 6,
                    ),

                  ],
                ),
              ),
              Container(
                  margin: EdgeInsets.only(bottom: 10, right: 8),
                  padding: EdgeInsets.symmetric(horizontal: 4, vertical: 12),
              )
            ],
          ),
        )
      ),
    );
  }
}