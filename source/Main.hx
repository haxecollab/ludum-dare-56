package;

import game.asset.AudioData;
import sound.SoundCollection;
import sound.SoundAsset;
import sound.SoundManager;
import lime.media.AudioManager;
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
		AssetManager.init();
		StateManager.init();

		#if html5
		SoundManager.playBGM(AudioData.BACKGROUND_TRACK_0_MP3);
		#else
		SoundManager.playBGM(AudioData.BACKGROUND_TRACK_0_OGG);
		#end
	}

	private function loadRoot():Void{	
		game = new Game();		
		addChild(new DebugHUD(game));

		game.newGame();

		lastFrameTime = Timer.stamp();
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
