package game.object;

import openfl.utils.Object;
import game.asset.AssetManager;
import game.asset.GameData;
import openfl.events.Event;
import game.enums.Clan;
import game.level.GameMap;
import game.enums.NPCBehavior;
import game.state.StateManager;
import game.settings.Global;
import util.RNGUtil;
import openfl.geom.Point;
import game.level.NPCSprite;

class NPC {
	public static inline var MAX_X:Float = 1292;
	public static inline var MAX_Y:Float = 608;

	private static inline var TICK_TIMER:Float = 2;
	public var name:String;
	public var clan:Clan;
	public var sprite:NPCSprite;
	public var y:Float;
	public var x:Float;
	public var timer:Float;

	public var dialogue:Dialogue;

	public function new(name:String, clan:String, x:Float, y:Float) {
		this.name = name;
		this.clan = clan;
		this.x = x;
		this.y = y;
		timer = TICK_TIMER;
	}

	public function getLocation():Point {
		return new Point(x, y);
	}

	public function setLocation(x:Float, y:Float):Void {
		this.x = x;
		this.y = y;
	}

	public function update(dt:Float):Void{
		timer -= dt;
		if(timer <= 0){
			_tick();
			timer += TICK_TIMER;
		}
	}

	public function listenForButton():Void{
		sprite.addEventListener("button_press",(e:Event)->{
			 var clanName:String ="";
			 var text:String = "";
			var dialogue:Object = AssetManager.getData(GameData.DIALOGUE);
			var clanText:Array<String> = null;

			 switch(clan){
				case FIRE:
					clanName = "Fire";
					clanText = dialogue["fire_clan_npc_dialogues"];
					text = clanText[Std.random(100)];
				case LEAF:
					clanName = "Leaf";
					clanText = dialogue["leaf_clan_npc_dialogues"];
					text = clanText[Std.random(100)];
				case PEBBLE:
					clanName = "Pebble";
					clanText = dialogue["pebble_clan_npc_dialogues"];
					text = clanText[Std.random(100)];
				case ICE:
					clanName = "Ice";
					clanText = dialogue["ice_clan_npc_dialogues"];
					text = clanText[Std.random(100)];
				case TURTLE:
					clanName = "Turtle";
					clanText = dialogue["turtle_clan_npc_dialogues"];
					text = clanText[Std.random(100)];
				case WATER:
					clanName = "water";
					clanText = dialogue["water_clan_npc_dialogues"];
					text = clanText[Std.random(100)];
			}
			GameMap.addDialogue('$name of the $clanName clan says', text);
		});
	}
	private function _tick():Void{
		var morale:Float = StateManager.current.getValue(Game.MORALE_STATE);
		var illness:Float = StateManager.current.getValue(Game.ILLNESS_STATE);
		var resources:Int = StateManager.current.getNumber(Game.RESOURCES_STATE);

		var behavior:NPCBehavior = RNGUtil.generateBehavior(morale, resources, illness, 50);
		switch(behavior){
			case MOVE:
				var signX:Bool = Std.random(2) == 0;
				if(signX){
					this.x += Math.min(Std.random(5) + 1, MAX_X);
				} else {
					this.x -= Math.max(Std.random(5) + 1, 0);
				}

				var signY:Bool = Std.random(2) == 0;
				if(signY){
					this.y += Math.min(Std.random(5) + 1, MAX_Y);
				} else {
					this.y -= Math.max(Std.random(5) + 1, 0);
				}
				validateLocation();

			case DEATH:
			case EVENT_ACTION:
				if(Std.random(2) ==0){
					sprite.showButton();
				}
			case IDLE:
			case PROCREATE:

				
		}
	}

	public function validateLocation():Void{
		this.sprite.x = this.x;
		this.sprite.y = this.y;
	}

	public static function generate(clanId:String):NPC {
		var name:String = RNGUtil.generateRandomName(clanId);
		var clan:String = clanId;

		var x:Float = Std.random(Std.int(MAX_X));
		var y:Float = Std.random(Std.int(MAX_Y));
		
		return new NPC(name, clan, x, y);
	}
}
