package;

import hxd.Key;
import hxd.Window;
import objects.*;

class Main extends hxd.App {
	var moveKeyFlag : Int = 0;
	var speed : Float = 100;
	var cat : Cat;
	override function init() {
		s2d.scaleMode = ScaleMode.LetterBox(640, 320);
		engine.backgroundColor = 0xFF202020;
		var g = new Ghost(s2d);
		g.x = 0;
		g.y = 0;

		var obstacle = new Obstacle(s2d);
		obstacle.x = 32;
		obstacle.y = 0;

		cat = new Cat(s2d);
		cat.x = 32*2;
		cat.y = 0;

		var plate = new Plate(s2d);
		plate.x = 32*3;

		var pump = new Pumpkin(s2d);
		pump.x = 32*4;

		var gate = new Gate(s2d);
		gate.x = 32*5;

		Window.getInstance().addEventTarget((event:hxd.Event)-> {
			switch(event.kind){
				case EKeyDown: 
					if(event.keyCode == Key.D)
						moveKeyFlag |= 0x1;
					else if(event.keyCode == Key.A)
						moveKeyFlag |= 0x2;
					else if(event.keyCode == Key.W)
						moveKeyFlag |= 0x4;
					else if(event.keyCode == Key.S)
						moveKeyFlag |= 0x8;
				case EKeyUp:
					if(event.keyCode == Key.D)
						moveKeyFlag &= ~0x1;
					else if(event.keyCode == Key.A)
						moveKeyFlag &= ~0x2;
					else if(event.keyCode == Key.W)
						moveKeyFlag &= ~0x4;
					else if(event.keyCode == Key.S)
						moveKeyFlag &= ~0x8;
				case _:
			}
		});
	}

	function movePlayer(delta : Float) : Void {
		var keyCount : Int = 0;
		if(moveKeyFlag & 0x1 != 0) keyCount+=1;
		if(moveKeyFlag & 0x2 != 0) keyCount+=1;
		if(moveKeyFlag & 0x4 != 0) keyCount+=1;
		if(moveKeyFlag & 0x8 != 0) keyCount+=1;

		if(keyCount == 0)
			return;
		var floatingSpeed = speed / keyCount;
		if(moveKeyFlag & 0x1 != 0) cat.x += floatingSpeed * delta;
		if(moveKeyFlag & 0x2 != 0) cat.x -= floatingSpeed * delta;
		if(moveKeyFlag & 0x4 != 0) cat.y -= floatingSpeed * delta;
		if(moveKeyFlag & 0x8 != 0) cat.y += floatingSpeed * delta;
	}

	override function update(dt:Float) {
		movePlayer(dt);
	}

	static function main() {
		new Main();
	}
}
