package;

import objects.*;
import flixel.FlxState;

class PlayState extends FlxState {
	public static var self:PlayState;
	public var gameCamera:Camera;
	public var player:Player;

	override public function create() {
		super.create();
		persistentUpdate = true;
		persistentDraw = false;
		self = this;

		FlxG.cameras.reset(gameCamera = new Camera());
		add(player = new Player());

		gameCamera.followEntity(player);
		gameCamera.snapToTarget();

		for (i in 0...3)
			add(new flixel.FlxSprite(32 * i, 0));
	}

	override public function update(elapsed:Float) {
		super.update(elapsed);
	}
}
