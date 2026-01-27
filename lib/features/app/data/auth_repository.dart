class AuthRepository {

static const _email = 'test@test.com';
static const _password = '123456';

  Future<bool> authMe() async {
    await Future.delayed(Duration(seconds: 2));
    
    return false;
  }

  Future<bool> login(String email, String password) async {
    await Future.delayed(Duration(seconds: 2));
    return email == _email && password == _password;
  }

  Future<bool> registern(String email, String password) async {
    await Future.delayed(Duration(seconds: 2));
    return email == _email && password == _password;
  }
}
