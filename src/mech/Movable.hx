package mech;

import differ.shapes.Polygon;


interface Movable {
	public var col:Polygon;
  public function moveSelf(moveKeyFlag:Int, accel:Float, dt:Float):Void;
}
