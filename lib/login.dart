import 'package:app_de_libros/screens/home.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:app_de_libros/register.dart';

class MyLogin extends StatefulWidget {
  const MyLogin({Key? key}) : super(key: key);

  @override
  State<MyLogin> createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();

  Future<bool> validarDatos() async {
    bool res = false;
    try {
      CollectionReference ref =
          FirebaseFirestore.instance.collection('Usuarios');
      QuerySnapshot usuario = await ref.get();
      if (usuario.docs.isNotEmpty) {
        for (var doc in usuario.docs) {
          if (doc.get("Email") == email.text &&
              doc.get("Password") == pass.text) {
            res = true;
            email.clear();
            pass.clear();
          }
        }
      } else {
        debugPrint("No hay Usuarios registrados");
      }
    } catch (e) {
      debugPrint("ERROR: $e");
    }
    return res;
  }

  entrarPagina(StatefulWidget destino) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => destino,
      ),
    );
  }

  notifica(String mensaje, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(mensaje),
        backgroundColor: color,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black54,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: Container(
        margin: const EdgeInsets.only(left: 40, right: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Center(
              child: Image.asset('images/librolandia.png'),
            ),
            const Text(
              'Bienvenido',
              style: TextStyle(
                color: Colors.black,
                fontSize: 33,
              ),
            ),
            TextField(
              controller: email,
              style: const TextStyle(color: Colors.black),
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                  fillColor: Colors.grey.shade50,
                  filled: true,
                  hintText: "Email",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  )),
            ),
            TextField(
              controller: pass,
              style: const TextStyle(),
              obscureText: true,
              onSubmitted: (value) async {
                if (await validarDatos()) {
                  entrarPagina(const Catalogo());
                } else {
                  notifica("Email o contraseña incorrectos", Colors.red);
                }
              },
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: Colors.grey,
                  ),
                ),
                fillColor: Colors.grey.shade50,
                filled: true,
                hintText: "Contraseña",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    if (await validarDatos()) {
                      entrarPagina(const Catalogo());
                    } else {
                      notifica("Email o contraseña incorrectos", Colors.red);
                    }
                  },
                  style: const ButtonStyle(
                    padding: MaterialStatePropertyAll(
                      EdgeInsets.all(15),
                    ),
                  ),
                  child: const Text(
                    'Iniciar sesión',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (BuildContext context) {
                          return const MyRegister();
                        },
                      ),
                    );
                  },
                  style: const ButtonStyle(),
                  child: const Text(
                    'Registrarse',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Color(0xff4c505b),
                        fontSize: 18),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    '¿Olvidaste tu contraseña?',
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: Color(0xff4c505b),
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
