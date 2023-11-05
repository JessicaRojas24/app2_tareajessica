import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: MyHomePage(),
    );
  }
}
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Persona> _personas = [
    Persona('Jessica Judith', 'Rojas', '20185901'),
    Persona('Bryan', 'Luna', '20189076'),
    Persona('Hugo', 'Luna', '20186532'),
    Persona('Luis', 'Ramirez', '20186734'),
    Persona('Hugo', 'Segoviano', '20192367'),
    Persona('Luisa', 'Torres', '20193627'),
  ];

  //Agregar persona hecha
  void _agregarPersona() {
    setState(() {
      _personas.add(Persona('Jessica Judith', 'Rojas', '20185901'));
    });
  }


  //poder eliminar
  void _borrarPersona(int index) {
    setState(() {
      _personas.removeAt(index);
    });
  }

  Future<void> _Eliminar(int index) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, 
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: Text('Eliminar persona'),
          content: Text('¿Deseas eliminar a: ${_personas[index].name}?'),
          actions: <Widget>[
            TextButton(
              child: Text('Cancelar'),
              onPressed: () {
                Navigator.of(dialogContext).pop(); 
              },
            ),
            TextButton(
              child: Text('Eliminar'),
              onPressed: () {
                _borrarPersona(index);
                Navigator.of(dialogContext).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('App Lista de Personas'),
      ),
      body: ListView.builder(
        itemCount: _personas.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text('${_personas[index].name} ${_personas[index].lastName}'),
            subtitle: Text(_personas[index].cuenta),
            leading: CircleAvatar(
              child: Text(_personas[index].name.substring(0, 1)),
            ),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () => _Eliminar(index), 
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.purple,
        child: Icon(Icons.add),
        onPressed: _agregarPersona,
      ),
    );
  }
}

class Persona {
  String name;
  String lastName;
  String cuenta;

  Persona(this.name, this.lastName, this.cuenta);
}