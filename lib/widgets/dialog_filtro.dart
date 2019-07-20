import 'package:flutter/material.dart';
import 'package:flutter_app/model/CaixaModel.dart';
import 'package:flutter_app/pojos/Operador.dart';
import 'package:flutter_app/util/OUtils.dart';
import 'package:scoped_model/scoped_model.dart';

class FilterDialog extends StatefulWidget {

  final CaixaModel _caixaModel;

  FilterDialog(this._caixaModel);

  @override
  _FilterDialogState createState() => _FilterDialogState(_caixaModel);
}

class _FilterDialogState extends State<FilterDialog> {

  final CaixaModel caixaModel;

  _FilterDialogState(this.caixaModel);

  @override
  void initState() {
    if(caixaModel.dtIni==null){
      caixaModel.dtIni=DateTime.now();
      caixaModel.dtFin=DateTime.now();
    }
    super.initState();
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

    _getDropDownItens(dynamic snapshot){
      List<DropdownMenuItem<int>> list=List();
      for(var v in snapshot){
        Operador op = v;
        list.add(DropdownMenuItem<int>(value: op.idOperador,child: Text(op.nome),));
      }
      return list;
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
                        value: caixaModel.turno,
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
                            caixaModel.turno= turno;
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
