import 'package:flutter/material.dart';
import 'package:flutter_app/pojos/Operador.dart';
import 'package:flutter_app/util/OUtils.dart';
import 'package:flutter_app/util/Services.dart';
import 'package:intl/intl.dart';

class FilterDialog extends StatefulWidget {
  @override
  _FilterDialogState createState() => _FilterDialogState();
}

class _FilterDialogState extends State<FilterDialog> {
  String _operadorSelecionado;
  String _turnoSelecionado;
  DateTime _dtIni;
  DateTime _dtFim;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _dtIni = DateTime.now();
    _dtFim = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    Future<DateTime> _selectDate() => showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2019),
        lastDate: DateTime(2025));

    List<DropdownMenuItem<String>> getDropDownMenuItems(List<dynamic> lista) {
      List<DropdownMenuItem<String>> items = new List();
      for (String item in lista) {
        items.add(new DropdownMenuItem(value: item, child: new Text(item)));
      }
      return items;
    }

    return AlertDialog(
      title: const Text("Informe os Filtros",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
      content: Form(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              FutureBuilder(
                  future: Services().listOperadores(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return DropdownButton(
                        isExpanded: true,
                        value: _operadorSelecionado,
                        items: snapshot.data
                            .map<DropdownMenuItem<Operador>>((Operador op) {
                          return DropdownMenuItem<Operador>(
                            value: op,
                            child: Text(op.nome),
                          );
                        }).toList(),
                        hint: Text("Selecione  operador"),
                        onChanged: (operador) {
                          setState(() {
                            _operadorSelecionado = operador;
                          });
                        },
                      );
                    } else {
                      return Container();
                    }
                  }),
              SizedBox(
                height: 20.0,
              ),
              FutureBuilder(
                  future: Services().listTurnos(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return DropdownButton(
                        isExpanded: true,
                        value: _turnoSelecionado,
                        items: snapshot.data
                            .map<DropdownMenuItem<String>>((String texto) {
                          return DropdownMenuItem<String>(
                            value: texto,
                            child: Text(texto),
                          );
                        }).toList(),
                        hint: Text("Selecione Turno"),
                        onChanged: (turno) {
                          setState(() {
                            _turnoSelecionado = turno;
                          });
                        },
                      );
                    } else {
                      return Container();
                    }
                  }),
              SizedBox(
                height: 20.0,
              ),
              GestureDetector(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    color: Colors.black87,
                                    style: BorderStyle.solid))),
                        child: Text(
                          OUtils.formataData(_dtIni),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    Icon(Icons.calendar_today)
                  ],
                ),
                onTap: () async {
                  final dateSelected = await _selectDate();
                  if (dateSelected == null)
                    return;
                  else
                    setState(() {
                      _dtIni = dateSelected;
                    });
                },
              ),
              SizedBox(
                height: 20.0,
              ),
              GestureDetector(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    color: Colors.black87,
                                    style: BorderStyle.solid))),
                        child: Text(
                          OUtils.formataData(_dtFim),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    Icon(Icons.calendar_today)
                  ],
                ),
                onTap: () async {
                  final dateSelected = await _selectDate();
                  if (dateSelected == null)
                    return;
                  else
                    setState(() {
                      _dtFim = dateSelected;
                    });
                },
              )
            ],
          ),
        ),
      ),
      titleTextStyle: TextStyle(color: Colors.white),
      actions: <Widget>[
        FlatButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text("Cancelar"),
        ),
        FlatButton(
          onPressed: () {
            print(_operadorSelecionado);
            print(_turnoSelecionado);
            print(_dtIni);
            print(_dtFim);
            Navigator.of(context).pop();
          },
          child: Text("Filtrar"),
        )
      ],
    );
  }
}
