
// ignore_for_file: constant_identifier_names

class ConfigURL {
  static const CONSTRUCAO = '{CONSTRUCAO}';

  Future<String?> url(String value) async {
    switch (value) {
      case CONSTRUCAO:
        return 'https://schedulingservice.herokuapp.com/';

     

      default:
        return 'https://schedulingservice.herokuapp.com/';
    }
  }
}