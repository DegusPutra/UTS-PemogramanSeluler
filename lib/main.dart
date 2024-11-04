import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  final biodata = <String, String>{};

  MainApp({super.key}) {
    biodata['name'] = 'I GEDE AGUS PERDANA PUTRA';
    biodata['email'] = 'igedeagusperdana03@gmail.com';
    biodata['phone'] = '+6285156694338';
    biodata['image'] = 'dgs.jpg';
    biodata['hobby'] = 'Teknologi Informasi';
    biodata['addr'] = '42230058';
    biodata['desc'] =
        '''Hai Perkenalkan saya I Gede Agus Perdana Putra akrab di panggil Degus, disini saya mempunyai hobby otomotif dan berolahraga yang lebih condong ke permainan futsal dan sepak bola. Disini mungkin saya punya bebrapa keahilan atau kemampuan yaitu berkomunikasi dengan baik, beradaptasi di lingkungan baru dengan cepat, dan juga manajemen konflik. Prinsip hidup saya adalah "LIVE YOUR LIFE LIKE IT'S YOUR LAST EVERY DAY".  ''';
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Biodata",
      home: Scaffold(
        appBar: AppBar(title: const Text("Biodata")),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            teksKotak(Colors.black, biodata['name'] ?? ''),
            Image(image: AssetImage('assets/${biodata["image"] ?? ''}')),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                btnContact(Icons.alternate_email, Colors.green[900],
                    "mailto:${biodata['email']}"),
                btnContact(Icons.mark_email_unread_rounded, Colors.blueAccent,
                    "https://wa.me/${biodata['phone']}"),
                btnContact(
                    Icons.phone, Colors.deepPurple, "tel:${biodata['phone']}"),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            textAtribute("Program Studi", biodata['hobby'] ?? ''),
            textAtribute("NIM", biodata['addr'] ?? ''),
            SizedBox(
              height: 20,
            ),
            teksKotak(
              Colors.black,
              'Deskripsi',
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              biodata['desc'] ?? '',
              style: TextStyle(fontSize: 24),
            ),
          ]),
        ),
      ),
    );
  }

  Container teksKotak(Color bgColor, String teks) {
    return Container(
      padding: EdgeInsets.all(10),
      alignment: Alignment.center,
      width: double.infinity,
      decoration: BoxDecoration(color: bgColor),
      child: Text(
        teks,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 80, // Ukuran font yang lebih masuk akal
          color: const Color.fromARGB(255, 255, 4, 4),
        ),
      ),
    );
  }

  Row textAtribute(String judul, String teks) {
    return Row(
      children: [
        Container(
          width: 150,
          child: Text(
            "* $judul",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
        ),
        Text(
          ":",
          style: TextStyle(fontSize: 24),
        ),
        Text(
          teks,
          style: TextStyle(fontSize: 24),
        ),
      ],
    );
  }

  Expanded btnContact(IconData icon, Color? color, String uri) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () {
          launch(uri);
        },
        child: Icon(icon),
        style: ElevatedButton.styleFrom(
            backgroundColor: color,
            foregroundColor: Colors.white,
            textStyle:
                TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
      ),
    );
  }

  void launch(String uri) async {
    if (!await launchUrl(Uri.parse(uri))) {
      throw Exception('Tidak Dapat Memanggil: $uri');
    }
  }
}
