
class UsuarioPojo{
  String _nome;
  String _usuario;
  String _authToken;
  String _foto;
  bool _ativo;

  UsuarioPojo(this._nome, this._usuario, this._authToken, this._foto,
      this._ativo);

  bool get ativo => _ativo==null?true:_ativo;

  set ativo(bool value) {
    _ativo = value;
  }

  String get foto => _foto==null?"user.img":_foto;

  set foto(String value) {
    _foto = value;
  }

  String get authToken => _authToken;

  set authToken(String value) {
    _authToken = value;
  }

  String get usuario => _usuario;

  set usuario(String value) {
    _usuario = value;
  }

  String get nome => _nome;

  set nome(String value) {
    _nome = value;
  }


}