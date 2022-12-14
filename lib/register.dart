import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:app_de_libros/login.dart';

class MyRegister extends StatefulWidget {
  const MyRegister({super.key});

  @override
  State<MyRegister> createState() => _MyRegisterState();
}

class _MyRegisterState extends State<MyRegister> {
  notifica(String mensaje, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(mensaje),
        backgroundColor: color,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  entrarPagina(StatefulWidget destino) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => destino,
      ),
    );
  }

  TextEditingController nombres = TextEditingController();
  TextEditingController apellidos = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController telefono = TextEditingController();
  TextEditingController password = TextEditingController();

  final firebase = FirebaseFirestore.instance;

  Future<bool> registroUsuario() async {
    bool res = false;
    try {
      await firebase.collection('Usuarios').doc().set(
        {
          'Nombres': nombres.text,
          'Apellidos': apellidos.text,
          'Email': email.text,
          'Telefono': telefono.text,
          'Password': password.text,
        },
      );
      res = true;
      nombres.clear();
      apellidos.clear();
      email.clear();
      telefono.clear();
      password.clear();
    } catch (e) {
      debugPrint('Error: $e');
    }
    return res;
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
            Container(
              margin: const EdgeInsets.all(40),
              child: const Text(
                'Crear cuenta',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 33,
                ),
              ),
            ),
            TextField(
              controller: nombres,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: Colors.grey,
                  ),
                ),
                fillColor: Colors.grey.shade50,
                filled: true,
                hintText: "Nombres",
                hintStyle: const TextStyle(color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            TextField(
              controller: apellidos,
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                  fillColor: Colors.grey.shade50,
                  filled: true,
                  hintText: "Apellidos",
                  hintStyle: const TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  )),
            ),
            TextField(
              controller: email,
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
                  hintStyle: const TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  )),
            ),
            TextField(
              controller: telefono,
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                  fillColor: Colors.grey.shade50,
                  filled: true,
                  hintText: "Tel??fono",
                  hintStyle: const TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  )),
            ),
            TextField(
              controller: password,
              obscureText: true,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: Colors.grey,
                  ),
                ),
                fillColor: Colors.grey.shade50,
                filled: true,
                hintText: "Contrase??a",
                hintStyle: const TextStyle(color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onSubmitted: (value) async {
                if (nombres.text.isNotEmpty &&
                    apellidos.text.isNotEmpty &&
                    email.text.isNotEmpty &&
                    password.text.isNotEmpty) {
                  if (await registroUsuario()) {
                    notifica("Usuario registrado con exito", Colors.green);
                    entrarPagina(const MyLogin());
                  }
                } else {
                  notifica("Llene los espacios requeridos", Colors.red);
                }
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    if (nombres.text.isNotEmpty &&
                        apellidos.text.isNotEmpty &&
                        email.text.isNotEmpty &&
                        password.text.isNotEmpty) {
                      if (await registroUsuario()) {
                        notifica("Usuario registrado con exito", Colors.green);
                        entrarPagina(const MyLogin());
                      }
                    } else {
                      notifica("Llene los espacios requeridos", Colors.red);
                    }
                  },
                  style: const ButtonStyle(
                    padding: MaterialStatePropertyAll(
                      EdgeInsets.all(15),
                    ),
                  ),
                  child: const Text(
                    'Registrarse',
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
                          return const MyLogin();
                        },
                      ),
                    );
                  },
                  style: const ButtonStyle(),
                  child: const Text(
                    'Iniciar sesi??n',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Color(0xff4c505b),
                        fontSize: 18),
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

// Route _createRoute() {
//   return PageRouteBuilder(
//     pageBuilder: (context, animation, secondaryAnimation) => const MyLogin(),
//     transitionsBuilder: (context, animation, secondaryAnimation, child) {
//       return child;
//     },
//   );
// }