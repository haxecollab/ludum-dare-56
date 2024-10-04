package;

import flixel.FlxGame;
import openfl.display.Sprite;
import haxe.ui.Toolkit;

class Main extends Sprite {
	public function new() {
		super();
		// HaxeUI Initalisation
		Toolkit.init();
		Toolkit.autoScale = false;
		Toolkit.scale = 2;
		// And Flixel...
		addChild(new FlxGame(0, 0, MainMenuState));
		flixel.FlxG.sound.volume = 0;
	}
}
