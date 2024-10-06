package;

import game.object.Game;
import util.RNGUtil;
import game.debug.ui.DebugHUD;
import game.asset.GameData;
import flixel.FlxGame;
import openfl.display.Sprite;
import game.asset.AssetManager;
import game.state.StateManager;

class Main extends Sprite {

	var game:Game;
	public function new() {
		super();
	
		AssetManager.init();
		StateManager.init();
		game = new Game();
		

		#if text_only
			trace(RNGUtil.generateRandomName("leaf_clan"));
			addChild(new DebugHUD(game));
		#else 
		addChild(new FlxGame(1280, 720, InitState, 60, 60, true));
		#end

		game.newGame();
	}
}
