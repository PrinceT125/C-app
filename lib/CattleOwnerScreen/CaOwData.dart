class UserData {
  static String _name = '';
  static String _email = '';
  static String _location = '';
  static String _mobno = '';
  static String _specialization = '';

  static void setUser({required String name, required String email ,required String location}) {
    _name = name;
    _email = email;
    _location = location;
  }
 static void setMob({required String mobno}){
    _mobno = mobno;
 }
  static void setVet({required String name, required String specialization ,required String location}) {
    _name = name;
    _specialization = specialization;
    _location = location;
  }
  static String get name => _name;
  static String get email => _email;
  static String get location => _location;
  static String get mobno=> _mobno;
  static String get specialization=> _specialization;
}
