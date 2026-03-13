class AuthService{

  final String usuarioCadastrado = "admin@ecotrack.com";
  final String senhaCadastrada = "123456";

  String? login(String email, String senha){

    if (email != usuarioCadastrado){
      return "Usuário não Cadastrado";
    }
    if (senha != senhaCadastrada){
      return "Usuário ou Senha incorretos";
    }
    return null;
  }
}