package;

import game.debug.ui.DebugHUD;
import game.asset.GameData;
import flixel.FlxGame;
import openfl.display.Sprite;
import game.asset.AssetManager;

class Main extends Sprite {
	public function new() {
		super();
	
		AssetManager.init();

		#if text_only
			addChild(new DebugHUD());
		#else 
		addChild(new FlxGame(1280, 720, InitState, 60, 60, true));
		#end

		
	}
}
