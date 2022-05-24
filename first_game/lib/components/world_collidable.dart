import 'package:flame/components.dart';
import 'package:flame/geometry.dart';

class WorldCollidable extends PositionComponent with 
HasGameRef, Hitbox, Collidable {
  WorldCollidable() {
    addHitbox(HitboxRectangle());
  }

  // Future<void> addWorldCollision() async {
  //   (await MapLoader.readRayWorldCollisionMap()).forEach((rect) {
  //     add(WorldCollidable()
  //       ..position = Vector2(rect.left, rect.top)
  //       ..width = rect.width
  //       ..height = rect.height);
  //   });
  // }
}
