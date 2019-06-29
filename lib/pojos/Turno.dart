
class Turno{

  String nome;

  Turno(this.nome);

  Turno.fromJson(Map<String, dynamic> json){
    this.nome=json["nome"];
  }


}