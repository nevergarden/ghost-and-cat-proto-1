package objects;

import h2d.Graphics;
import h2d.Object;

class Obstacle extends Object {
	var sprite:Graphics;
	public function new(?parent:Object) {
		super(parent);
		create();
	}

	private function create() {
		this.sprite = new Graphics(this);
		sprite.beginFill(0xff20430b);
		sprite.drawRect(0,0,32,32);
		sprite.endFill();
	}
}
