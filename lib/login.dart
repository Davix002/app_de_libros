import 'package:app_de_libros/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:app_de_libros/register.dart';

class MyLogin extends StatefulWidget {
  const MyLogin({Key? key}) : super(key: key);

  @override
  State<MyLogin> createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
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
              style: const TextStyle(),
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
                  hintText: "Contraseña",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  )),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Catalogo()));
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
