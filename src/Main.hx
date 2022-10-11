package;

import mech.Movable;
import hxd.Key;
import hxd.Window;
import objects.*;

class Main extends hxd.App {
	var moveKeyFlag : Int = 0;
	var playerAccel : Float = 100;
	var player : Movable;

	var cat : Cat;
	var ghost : Ghost;
	var obstacle : Obstacle;
	override function init() {
		s2d.scaleMode = ScaleMode.LetterBox(640, 320, true);
		engine.backgroundColor = 0xFF202020;
		cat = new Cat(s2d);
		cat.x = 32*2;
		cat.y = 0;

		ghost = new Ghost(s2d);
		ghost.x = 0;
		ghost.y = 0;

		obstacle = new Obstacle(s2d);
		obstacle.x = 32;
		obstacle.y = 0;

		var plate = new Plate(s2d);
		plate.x = 32*3;

		var pump = new Pumpkin(s2d);
		pump.x = 32*4;

		var gate = new Gate(s2d);
		gate.x = 32*5;

		player = cat;

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

	override function update(dt:Float) {
		player.moveSelf(moveKeyFlag, playerAccel, dt);
		if(obstacle.collideCheck(player)!=null)
		{
			trace("Collision");
		}
		if(Key.isPressed(Key.SPACE)) {
			trace("Switch");
			if(player is Cat) player = ghost;
			else if(player is Ghost) player = cat;
			trace(player);
		}
	}

	static function main() {
		new Main();
	}
}
