package objects;

import differ.shapes.Polygon;
import h2d.col.Point;
import mech.Movable;
import h2d.Object;
import hxd.Math;

class MovingObject extends Object implements Movable {
		public var col : Polygon;
		public var velocity : Point;
		public var maxVelocity : Int;
    public function new(?parent:Object) {
        super(parent);
				this.velocity = new Point(0,0);
				this.maxVelocity = 100;
				this.col = Polygon.rectangle(this.x,this.y,32,32,true);
    }

    public function moveSelf(moveKeyFlag:Int, acceleration:Float, delta:Float):Void {
			var keyCount : Int = 0;
			if(moveKeyFlag & 0x1 != 0 || moveKeyFlag & 0x2 != 0) keyCount+=1;
			if(moveKeyFlag & 0x4 != 0 || moveKeyFlag & 0x8 != 0) keyCount+=1;

			if(keyCount == 0)
			{
				this.velocity = new Point(0,0);
				return;
			}
			if(moveKeyFlag & 0x1 != 0)
				this.velocity.x += acceleration * delta;
			if(moveKeyFlag & 0x2 != 0)
				this.velocity.x -= acceleration * delta;
			if(moveKeyFlag & 0x4 != 0)
				this.velocity.y -= acceleration * delta;
			if(moveKeyFlag & 0x8 != 0)
				this.velocity.y += acceleration * delta;

			if(moveKeyFlag & 0x3 == 0)
				this.velocity.x = 0;

			if(moveKeyFlag & (0x4 | 0x8) == 0)
				this.velocity.y = 0;
			
			var d = Math.atan2(this.velocity.y, this.velocity.x);
			var m = Math.sqrt(2*maxVelocity*maxVelocity);

			if(this.velocity.x > 0)
				this.velocity.x = Math.min( Math.cos(d) * m, this.velocity.x);
			else if(this.velocity.x < 0)
				this.velocity.x = Math.max( Math.cos(d) * m, this.velocity.x);

			if(this.velocity.y > 0)
				this.velocity.y = Math.min( Math.sin(d) * m, this.velocity.y);
			else if(this.velocity.y < 0)
				this.velocity.y = Math.max( Math.sin(d) * m, this.velocity.y);
			
			this.x += this.velocity.x * delta;
			this.y += this.velocity.y * delta;

			this.x = Math.clamp(this.x, 0, 640-32);
			this.y = Math.clamp(this.y, 0, 320-32);
			this.col = Polygon.rectangle(this.x, this.y, 32,32,true);
    }
}
