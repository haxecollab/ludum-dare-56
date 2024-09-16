package;

import flixel.FlxState;
import haxe.ui.core.Screen;

class PlayState extends FlxState {
	override public function create() {
		super.create();
		//
		//
		//
		//

		var minigames: Array<flixel.FlxSubState> = [
			new minigames.test.Test()
		];
		var i = 0;
		this.openSubState(minigames[i]);
		minigames[i].closeCallback = () -> {
			if (i <= minigames.length) {
				i += 1;
				this.openSubState(minigames[i]);
			}
		};
	}

	override public function update(elapsed:Float) {
		super.update(elapsed);
	}
}
