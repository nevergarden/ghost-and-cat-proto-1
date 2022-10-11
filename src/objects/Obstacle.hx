package objects;

import mech.Collidable;
import differ.data.ShapeCollision;
import differ.shapes.Polygon;
import h2d.Graphics;
import h2d.Object;

class Obstacle extends Object implements Collidable {
  public var col:Polygon;
	var sprite:Graphics;
	public function new(?parent:Object) {
		super(parent);
		col = Polygon.rectangle(this.x,this.y,32,32, true);
		create();
	}

	private function create() {
		this.sprite = new Graphics(this);
		sprite.beginFill(0xff20430b);
		sprite.drawRect(0,0,32,32);
		sprite.endFill();
	}

	public function checkCollision(player:Collidable):ShapeCollision {
		this.col.x = this.x;
		this.col.y = this.y;
		var collision = this.col.testPolygon(player.col);
		return collision;
	}
}
