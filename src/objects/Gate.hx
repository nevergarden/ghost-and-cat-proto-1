package objects;

import h2d.Graphics;
import h2d.Object;

class Gate extends Object {
	var sprite:Graphics;
	public function new(?parent:Object) {
		super(parent);
		this.create();
	}

	public function create() {
		sprite = new Graphics(this);
		sprite.beginFill(0xff848c74);
		sprite.drawRect(0,0,32,32);
		sprite.endFill();
	}
}
