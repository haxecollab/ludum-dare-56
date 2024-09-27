package;

import flixel.FlxState;
import haxe.ui.core.Screen;

class PlayState extends FlxState {
	override public function create() {
		super.create();
		// TODO: Go to next minigame after close callback
		var minigames: Array<flixel.FlxSubState> = [
			new minigames.test.Test()
		];
		this.openSubState(minigames[0]);
	}

	override public function update(elapsed:Float) {
		super.update(elapsed);
	}
}
