package mech;

import differ.data.ShapeCollision;
import differ.shapes.Polygon;

interface Collidable {
	public var col : Polygon;
	public function checkCollision(other:Collidable):ShapeCollision;
}
