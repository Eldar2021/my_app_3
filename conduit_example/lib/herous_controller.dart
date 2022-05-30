import 'package:conduit_example/conduit_example.dart';

class HerousController extends Controller {
  final _heroes = [
    {'id': 11, 'name': 'Mr. Nice'},
    {'id': 12, 'name': 'Narco'},
    {'id': 13, 'name': 'Bombasto'},
    {'id': 14, 'name': 'Celeritas'},
    {'id': 15, 'name': 'Magneta'},
  ];

  @override
  FutureOr<RequestOrResponse?> handle(Request request) {
    if (request.path.variables.containsKey('id')) {
      final id = int.parse(request.path.variables['id'] ?? '');

      final hero = _heroes.firstWhere(
        (element) => element['id'] == id,
        orElse: () => {},
      );

      if (hero == {}) {
        return Response.notFound();
      } else {
        return Response.ok(hero);
      }
    }

    return Response.ok(_heroes);
  }
}
