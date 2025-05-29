part of 'remote_lib.dart';

class CloudSource {
  static final String host = dotenv.get('HOST');
  static final String searchProxy = dotenv.get('SEARCH_PROXY');
}