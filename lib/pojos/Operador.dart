
class Operador{
  int idOperador;
  String nome;

  Operador(this.idOperador, this.nome);

  Operador.fromJson(Map<String, dynamic> json){
    this.idOperador=json["idOperador"];
    this.nome=json["nome"];
  }

  @override
  String toString() {
    return 'Operador{idOperador: $idOperador, nome: $nome}';
  }

}
