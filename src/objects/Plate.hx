package objects;

import h2d.Graphics;
import h2d.Object;

class Plate extends Object {
	var sprite:Graphics;
	public function new(?parent:Object) {
		super(parent);
		this.create();
	}

	public function create() {
		sprite = new Graphics(this);
		sprite.beginFill(0xff75c9f8);
		sprite.drawRect(0,0,32,32);
		sprite.endFill();
	}
}
