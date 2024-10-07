package;

import haxe.Timer;
import openfl.events.Event;
import game.object.Game;
import util.RNGUtil;
import game.debug.ui.DebugHUD;
import game.asset.GameData;
import flixel.FlxGame;
import openfl.display.Sprite;
import game.asset.AssetManager;
import game.state.StateManager;

class Main extends Sprite {
	public static var openflRoot:Main;

	var game:Game;
	var lastFrameTime:Float = 0;

	public function new() {
		super();	
		
		openflRoot = this;
		addChild(new FlxGame(1280, 720, InitState, 60, 60, true));
	}

	private function loadRoot():Void{
		AssetManager.init();
		StateManager.init();
		game = new Game();		
		addChild(new DebugHUD(game));

		game.newGame();

		stage.addEventListener(Event.ENTER_FRAME, _onFrameUpdate);
	}

	private function _onFrameUpdate(e:Event):Void {
		var currentTime:Float = Timer.stamp(); 
		var delta:Float = (currentTime - lastFrameTime);
		lastFrameTime = currentTime;

		game.update(delta);
	}

	public static function start():Void{
		openflRoot.loadRoot();
	}
}
