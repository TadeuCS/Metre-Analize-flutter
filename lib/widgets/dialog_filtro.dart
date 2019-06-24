import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class FilterDialog extends StatefulWidget {
  @override
  _FilterDialogState createState() => _FilterDialogState();
}

class _FilterDialogState extends State<FilterDialog> {
  List<String> operadores = List();
  List<String> turnos = List();
  String _operadorSelecionado;
  String _turnoSelecionado;
  DateTime _dtIni;
  DateTime _dtFim;

  final DateFormat _dateFormat = DateFormat('dd/MM/yyyy');

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    operadores.add("Tadeu");
    operadores.add("João");
    operadores.add("Marvin");

    turnos.add("1 - Manhã");
    turnos.add("2 - Tarde");
    turnos.add("3 - Noite");
    _dtIni = DateTime.now();
    _dtFim = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _FormKey = GlobalKey();
    final TextEditingController _dtInicialController = TextEditingController();
    final TextEditingController _dtFinalController = TextEditingController();

    List<DropdownMenuItem<String>> getDropDownMenuItems(List<String> lista) {
      List<DropdownMenuItem<String>> items = new List();
      for (String item in lista) {
        items.add(new DropdownMenuItem(value: item, child: new Text(item)));
      }
      return items;
    }

    Future<DateTime> _selectDate() => showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2019),
        lastDate: DateTime(2025));

    return AlertDialog(
      title: const Text("Informe os Filtros",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
      content: Form(
        key: _FormKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              DropdownButtonFormField(
                value: _operadorSelecionado,
                items: getDropDownMenuItems(operadores),
                hint: Text("Selecione  operador"),
                onChanged: (operador) {
                  setState(() {
                    _operadorSelecionado = operador;
                  });
                },
                validator: (value) {
                  if (value == null) {
                    return "Informe o Operador";
                  }
                },
              ),
              SizedBox(
                height: 20.0,
              ),
              DropdownButtonFormField(
                value: _turnoSelecionado,
                hint: Text("Selecione turno"),
                items: getDropDownMenuItems(turnos),
                onChanged: (turno) {
                  setState(() {
                    _turnoSelecionado = turno;
                  });
                },
                validator: (value) {
                  if (value == null) {
                    return "Informe o Turno";
                  }
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
                          _dateFormat.format(_dtIni),
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
                          _dateFormat.format(_dtFim),
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
            if (_FormKey.currentState.validate()) {
              Navigator.of(context).pop();
            }
          },
          child: Text("Filtrar"),
        )
      ],
    );
  }
}
