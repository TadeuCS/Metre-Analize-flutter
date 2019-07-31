import 'package:flutter/material.dart';
import 'package:flutter_app/model/CaixaModel.dart';
import 'package:flutter_app/pojos/Operador.dart';
import 'package:flutter_app/pojos/Turno.dart';
import 'package:flutter_app/util/OUtils.dart';
import 'package:flutter_app/util/Session.dart';
import 'package:scoped_model/scoped_model.dart';

class FilterDialog extends StatefulWidget {
  @override
  _FilterDialogState createState() => _FilterDialogState();
}

class _FilterDialogState extends State<FilterDialog> {
  CaixaModel caixaModel = Session().caixaModel;

  @override
  void initState() {
    super.initState();
    if (caixaModel.dtIni == null) {
      caixaModel.dtIni = DateTime.now();
      caixaModel.dtFin = DateTime.now();
    }
  }

  @override
  Widget build(BuildContext context) {
    Future<DateTime> _selectDate() => showDatePicker(
        context: context,
        initialDate: caixaModel.dtIni,
        firstDate: DateTime(2019),
        lastDate: DateTime(2025));

    List<DropdownMenuItem<String>> getDropDownMenuItems(List<dynamic> lista) {
      List<DropdownMenuItem<String>> items = new List();
      for (String item in lista) {
        items.add(new DropdownMenuItem(value: item, child: new Text(item)));
      }
      return items;
    }

    _getDropDownItens(dynamic snapshot) {
      List<DropdownMenuItem<int>> list = List();
      for (var v in snapshot) {
        Operador op = v;
        list.add(DropdownMenuItem<int>(
          value: op.idOperador,
          child: Text(op.nome),
        ));
      }
      return list;
    }

    return AlertDialog(
      title: const Text("Informe os Filtros",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            FutureBuilder(
                future: caixaModel.listOperadores(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return DropdownButton(
                      isExpanded: true,
                      value: caixaModel.idOperador,
                      items: snapshot.data
                          .map<DropdownMenuItem<int>>((Operador op) {
                        return DropdownMenuItem<int>(
                          value: op.idOperador,
                          child: Text(op.nome),
                        );
                      }).toList(),
                      hint: Text("Selecione  operador"),
                      onChanged: (oper) {
                        setState(() {
                          print(oper);
                          caixaModel.idOperador = oper;
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
                future: caixaModel.listTurnos(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return DropdownButton(
                      isExpanded: true,
                      value: caixaModel.turno==null?"Selecione Turno":caixaModel.turno,
                      items: snapshot.data
                          .map<DropdownMenuItem<String>>((Turno turno) {
                        return DropdownMenuItem<String>(
                          value: turno.nome,
                          child: Text(turno.nome),
                        );
                      }).toList(),
                      hint: Text("Selecione Turno"),
                      onChanged: (turno) {
                        setState(() {
                          if (turno.toString().contains("Selecione"))
                            caixaModel.turno = null;
                          else
                            caixaModel.turno = turno;
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
                        OUtils.formataData(caixaModel.dtIni),
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
                    caixaModel.dtIni = dateSelected;
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
                        OUtils.formataData(caixaModel.dtFin),
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
                    caixaModel.dtFin = dateSelected;
                  });
              },
            )
          ],
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
            caixaModel.filtrarCaixasEncerrados();
            Navigator.of(context).pop();
          },
          child: Text("Filtrar"),
        )
      ],
    );
  }
}
