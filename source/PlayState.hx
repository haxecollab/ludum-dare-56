package;

import objects.*;
import flixel.FlxState;

class PlayState extends FlxState {
	public static var self:PlayState;
	public var gameCamera:Camera;
	public var player:Player;

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
