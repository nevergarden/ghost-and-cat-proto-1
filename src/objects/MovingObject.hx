package objects;

import mech.Movable;
import h2d.Object;

class MovingObject extends Object implements Movable {
    public function new(?parent:Object) {
        super(parent);
    }

    public function moveTo():Void {

    }
}