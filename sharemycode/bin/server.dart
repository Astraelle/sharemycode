import 'dart:io';

import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'package:shelf_router/shelf_router.dart';
import 'connexion/connexion.dart';
import 'user/user.dart';

// Configure routes.
final _router = Router()
  ..get('/', _rootHandler)
  ..get('/echo/<message>', _echoHandler)
  ..post('/login', _loginHandler)
  ..post('/signup', _signUpHandler);

Response _rootHandler(Request req) {

  return Response.ok('Hello, World!\n');
}

Response _echoHandler(Request request) {
  final message = request.params['message'];
  return Response.ok('$message\n');
}

Response _loginHandler(Request request){
  final message = request.params;
    var m = request.readAsString().then((value) => print(value));
    print(m);
    Connexion().openDataBase();
    return Response.ok('$message');
}

Response _signUpHandler(Request request){
  final message = request.params;
    var m = request.readAsString().then((value) => print(value));
    print(m);
    Connexion().openDataBase();
    return Response.ok('$message');
}

void main(List<String> args) async {
  // Use any available host or container IP (usually `0.0.0.0`).
  final ip = InternetAddress.anyIPv4;

  // Configure a pipeline that logs requests.
  final handler =
      Pipeline().addMiddleware(logRequests()).addHandler(_router.call);

  // For running in containers, we respect the PORT environment variable.
  final port = int.parse(Platform.environment['PORT'] ?? '8080');
  final server = await serve(handler, ip, port);
  print('Server listening on port ${server.port}');
}
