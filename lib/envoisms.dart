import 'package:flutter/material.dart';

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  String alert = "Erreur";
  //Widget dialoge;

  final formkey = GlobalKey<FormState>();
  String gsm = "";
  String titre = "";
  String contenu = "";
  String img = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Envoie SMS",
        ),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          Form(
              key: formkey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        label: Text("N° GSM"),
                        labelStyle: TextStyle(color: Colors.blue),
                        hintText: "Entrer votre N° GSM",
                        filled: true,
                        fillColor: Colors.yellow,
                      ),
                      onSaved: (String? value) {
                        if (value!.length == 0) {
                          alert += "N° GSM est obligatoire";
                        } else if (value.length > 11) {
                          alert += "N° GSM est incorrecte";
                        } else
                          gsm = value;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        label: Text("Titre"),
                        labelStyle: TextStyle(color: Colors.blue),
                        hintText: "Entrer titre SMS",
                        filled: true,
                        fillColor: Colors.yellow,
                      ),
                      onSaved: (String? value) {
                        if (value!.length == 0) {
                          alert += "N° GSM est obligatoire";
                        } else if (value.length > 11) {
                          alert += "Titre SMS est incorrecte";
                        } else
                          titre = value;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        label: Text("Contenu SMS"),
                        labelStyle: TextStyle(color: Colors.blue),
                        hintText: "",
                        filled: true,
                        fillColor: Colors.yellow,
                      ),
                      onSaved: (String? value) {
                        if (value!.length == 0) {
                          alert += "Contenu SMS est obligatoire";
                        } else if (value.length > 20) {
                          alert += "Contenu SMS SMS est incorrecte";
                        } else
                          contenu = value;
                      },
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        int ngsm;
                        String operateur = "";

                        formkey.currentState?.save();
                        ngsm = int.parse(gsm);
                        if (ngsm == 5) {
                          operateur = "orange";
                          img = "orange.png";
                        }
                        if (ngsm == 2) {
                          operateur = "ooredoo";
                          img = "ooredoo.png";
                        }
                        if (ngsm == 9) {
                          operateur = "telecom";
                          img = "ttl.png";
                        }
                      },
                      child: Text("Valider")),
                  Image(image: "")
                ],
              )),
        ],
      ),

      //
    );
  }
}
