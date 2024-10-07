package game.object;

import game.settings.Global;
import util.RNGUtil;
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

	public static function generate(clanId:String, baseMorale:Float = 100):NPC {
		var name:String = RNGUtil.generateRandomName(clanId);
		var clan:String = clanId;
		var morale:Float = baseMorale * Global.difficulty;
		var health:Int = Math.floor(100 * Global.difficulty);
		var productivity:Float = 100 * Global.difficulty;
		var favor:Int = 0;
		var x:Float = 0;
		var y:Float = 0;
		return new NPC(name, clan, morale, health, productivity, favor, x, y);
	}
}
