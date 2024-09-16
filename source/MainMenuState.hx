package;

import haxe.ui.core.Screen;
import flixel.FlxState;

class MainMenuState extends FlxState {
	override public function create() {
		final mainMenu = new ui.MainMenu();
		mainMenu.percentWidth = 100;           		
		mainMenu.percentHeight = 100;
		Screen.instance.addComponent(mainMenu);
	}
}
