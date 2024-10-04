package states;

import flixel.addons.transition.TransitionData;
import haxe.ui.Toolkit;

class InitState extends FlxState {
	public override function create():Void {
		super.create();

		// HaxeUI Initalisation
		Toolkit.init();
		Toolkit.autoScale = false;
		Toolkit.scale = 2;

		FlxG.sound.volume = 0;
		FlxSprite.defaultAntialiasing = true;

		FlxTransitionableState.defaultTransIn = new TransitionData(FADE, FlxColor.BLACK, .25, new FlxPoint(-1));
		FlxTransitionableState.defaultTransOut = new TransitionData(FADE, FlxColor.BLACK, .25, new FlxPoint(1));

		FlxG.switchState(() -> new MainMenuState());
	}
}
