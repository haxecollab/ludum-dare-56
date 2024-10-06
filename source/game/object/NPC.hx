package game.object;

import openfl.geom.Point;

class NPC {
	public var name:String;
	public var clan:String;
	public var morale:Float;
	public var health:Int;
	public var productivity:Float;
	public var favor:Int;
	public var x:Float;
	public var y:Float;

	public function new(name:String, clan:String, morale:Float, health:Int, productivity:Float, favor:Int, x:Float, y:Float) {
		this.name = name;
		this.clan = clan;
		this.morale = morale;
		this.health = health;
		this.productivity = productivity;
		this.favor = favor;
		this.x = x;
		this.y = y;
	}

	public function getLocation():Point {
		return new Point(x, y);
	}

	public function setLocation(x:Float, y:Float):Void {
		this.x = x;
		this.y = y;
	}
}
