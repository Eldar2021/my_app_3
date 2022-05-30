import 'package:conduit_example/conduit_example.dart';
import 'package:conduit_example/herous_controller.dart';

class ConduitExampleChannel extends ApplicationChannel {
  @override
  Future prepare() async {
    logger.onRecord.listen(
      (rec) => print("$rec ${rec.error ?? ""} ${rec.stackTrace ?? ""}"),
    );
  }

  @override
  Controller get entryPoint {
    final router = Router();

    // router
    // .route('/users')
    // // .link(() => APIKeyValidator())
    // .link(() => Authorizer.bearer());
    // // ?.link(() => UsersController());

    router.route('/[:id]').link(() => HerousController());

    //router.route('/herous').link(() => HerousController());

    router.route("/example").linkFunction((request) async {
      return Response.ok({"key": "value"});
    });

    return router;
  }
}
