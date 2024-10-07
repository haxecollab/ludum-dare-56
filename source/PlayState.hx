package;

import openfl.ui.Mouse;
import haxe.ui.backend.flixel.CursorHelper;
import game.asset.GameData;
import objects.*;
import flixel.FlxState;

class PlayState extends FlxState {
	public static var self:PlayState;
	public var gameCamera:Camera;
	public var player:Player;

	override public function create() {
		super.create();
		
		#if text_only
		CursorHelper.useCustomCursors = false;
		Mouse.show();
		Main.start();
		#end
		
	}

	override public function update(elapsed:Float) {
		super.update(elapsed);
	}
}
