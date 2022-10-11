package objects;

import h2d.Graphics;
import h2d.Object;

class Ghost extends MovingObject {
	private var sprite : Graphics;

	public function new(?parent:Object) {
		super(parent);
		this.create();
	}

	private function create() {
		this.sprite = new Graphics(this);
		this.sprite.beginFill(0xffffff, 0.2);
		this.sprite.drawRect(0, 0, 32, 32);
		this.sprite.endFill();
	}
}
