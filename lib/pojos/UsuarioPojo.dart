class UsuarioPojo {
  String nome;
  String usuario;
  String authToken;
  String foto;
  bool ativo;

  UsuarioPojo(
      this.nome, this.usuario, this.authToken, this.foto, this.ativo) {
    foto = (foto == null ? "user.img" : foto);
  }
  
}