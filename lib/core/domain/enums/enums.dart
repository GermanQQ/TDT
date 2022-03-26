export 'buttons_enum.dart';
// ignore: constant_identifier_names
enum AuthStatus { Uninitialized, Authenticated, Authenticating, Unauthenticated, Registering, Failed}
// ignore: constant_identifier_names
enum ViewState { Idle, Busy }

enum MessageType { output, input }

enum RegisterStep { name, email, password }

