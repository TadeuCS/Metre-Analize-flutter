import 'package:intl/intl.dart';

class OUtils{

  OUtils();

  static DateTime getDateByJSON(String data){
    DateTime dtFormatada = DateFormat('MMM dd, yyyy HH:mm:ss a').parse(data);
    return dtFormatada;
  }
  static String formataData(DateTime data){
    return DateFormat('dd/MM/yyyy').format(data);
  }

  static String formataDataSQL(DateTime data){
    return DateFormat('yyyy-MM-dd').format(data);
  }

  static String formataDataHora(DateTime data){
    return DateFormat('dd/MM/yyyy HH:mm').format(data);
  }

  static String formataMoeda(double valor){
    valor = valor==null?0.00:valor;
    final formatter = new NumberFormat("R\$ #,##0.00", "pt-br");
    return formatter.format(valor);
  }

  static String onlyInteger(double valor){
    return valor.toInt().toString();
  }

  static double convertToDouble(dynamic value){
    return value==null?0.00:value+0.00;
  }

}