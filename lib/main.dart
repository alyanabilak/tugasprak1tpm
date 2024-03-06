import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FlowerApp',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _nama = "";
  var _nim = "";

  var _namaController = TextEditingController();
  var _nimController = TextEditingController();

  var _isHide = false;

  var _imageList = [
    {"image": "assets/image1.jpeg", "nama": "Bunga Buku"},
    {"image": "assets/image2.jpeg", "nama": "Bunga Mawar"},
    {"image": "assets/image3.jpeg", "nama": "Bunga Kucing"},
    {"image": "assets/image1.jpeg", "nama": "Bunga Kumbang"},
    {"image": "assets/image2.jpeg", "nama": "Bunga Aja"},
    {"image": "assets/image3.jpeg", "nama": "Bunga Harum"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        centerTitle: true,
        title: const Text(
          'FlowerApp',
          style:
              TextStyle(fontSize: 17, color: Colors.white, letterSpacing: 0.53),
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
        leading: InkWell(
          onTap: () {},
          child: const Icon(
            Icons.subject,
            color: Colors.white,
          ),
        ),
        actions: [],
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                children: [
                  TextField(
                      autofocus: false,
                      controller: _namaController,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                          labelText: "Nama",
                          labelStyle: TextStyle(color: Colors.pink),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  BorderSide(color: Colors.pink, width: 2)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  BorderSide(color: Colors.pink, width: 2)))),
                  SizedBox(height: 10),
                  TextField(
                      autofocus: false,
                      controller: _nimController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          labelText: "NIM",
                          labelStyle: TextStyle(color: Colors.pink),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  BorderSide(color: Colors.pink, width: 2)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  BorderSide(color: Colors.pink, width: 2)))),
                  SizedBox(height: 10),
                  Container(
                      height: 40,
                      width: MediaQuery.of(context).size.width,
                      child: ElevatedButton(
                          onPressed: () {
                            FocusManager.instance.primaryFocus?.unfocus();

                            setState(() {
                              _nama = _namaController.text;
                              _nim = _nimController.text;
                            });
                          },
                          child: Text("SIMPAN"))),
                  SizedBox(height: 25),
                  _isHide
                      ? SizedBox()
                      : Row(
                          children: [
                            Expanded(
                                flex: 1,
                                child: Text(
                                  "Nama:",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                )),
                            Expanded(
                                flex: 2,
                                child: Text(
                                  _nama,
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ))
                          ],
                        ),
                  SizedBox(height: _isHide ? 0 : 10),
                  _isHide
                      ? SizedBox()
                      : Row(
                          children: [
                            Expanded(
                                flex: 1,
                                child: Text(
                                  "NIM:",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                )),
                            Expanded(
                                flex: 2,
                                child: Text(
                                  _nim,
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ))
                          ],
                        ),
                  SizedBox(height: _isHide ? 0 : 10),
                  Container(
                      height: 40,
                      width: MediaQuery.of(context).size.width,
                      child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                _isHide ? Colors.pink : Colors.grey),
                          ),
                          onPressed: () {
                            FocusManager.instance.primaryFocus?.unfocus();

                            setState(() {
                              _isHide = !_isHide;
                            });
                          },
                          child: Text(_isHide ? "TAMPILKAN" : "SEMBUNYIKAN"))),
                ],
              ),
            ),
            SizedBox(height: 10),
            Container(
                margin: EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    Icon(Icons.sort),
                    SizedBox(width: 5),
                    Text(
                      "Data Bunga",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    )
                  ],
                )),
            SizedBox(height: 10),
            Expanded(
                child: GridView.builder(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 5.0,
                      mainAxisSpacing: 5.0,
                    ),
                    itemCount: _imageList.length,
                    itemBuilder: (context, i) {
                      var data = _imageList[i];
                      return ListTile(
                        title: Text("${data['nama']}"),
                        subtitle: Container(
                            height: 100,
                            width: 100,
                            margin: EdgeInsets.only(top: 15),
                            child: Image.asset(
                              "${data['image']}",
                              fit: BoxFit.cover,
                            )),
                        trailing: Icon(Icons.favorite, color: Colors.pink),
                      );
                    }))
          ],
        ),
      ),
    );
  }
}
