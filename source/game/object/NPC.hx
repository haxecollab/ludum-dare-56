package game.object;

import game.settings.Global;
import util.RNGUtil;
import openfl.geom.Point;

class NPC {
	public var name:String;
	public var clan:String;
	public var morale:Float;
	public var illnesss:Int;
	public var productivity:Float;
	public var x:Float;
	public var y:Float;

	public var dialogue:Dialogue;

	public function new(name:String, clan:String, x:Float, y:Float) {
		this.name = name;
		this.clan = clan;
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

	public function update():Void{

	}

	public static function generate(clanId:String):NPC {
		var name:String = RNGUtil.generateRandomName(clanId);
		var clan:String = clanId;

		var x:Float = 0;
		var y:Float = 0;
		return new NPC(name, clan, x, y);
	}
}
