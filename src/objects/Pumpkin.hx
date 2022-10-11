package objects;

import h2d.Graphics;
import h2d.Object;

class Pumpkin extends Object {
	var sprite:Graphics;
	public function new(?parent:Object) {
		super(parent);
		this.create();
	}

	public function create() {
		sprite = new Graphics(this);
		sprite.beginFill(0xffff6340);
		sprite.drawRect(0,0,32,32);
		sprite.endFill();
	}
}
