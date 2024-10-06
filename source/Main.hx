package;

import game.asset.GameData;
import flixel.FlxGame;
import openfl.display.Sprite;
import game.asset.AssetManager;

class Main extends Sprite {
	public function new() {
		super();
		addChild(new FlxGame(1280, 720, InitState, 60, 60, true));

	/* 	var t:GameData = GameData.CLANS;
		switch(t){
			case CLANS:
				trace('class');
			case DEFINITIONS:
				trace('definitions');
			case DIALOG:
				trace('dialog');
			case ITEMS:
				trace('items');
			case NAMES:
				trace('names');
		} */
		AssetManager.init();
		
	}
}
