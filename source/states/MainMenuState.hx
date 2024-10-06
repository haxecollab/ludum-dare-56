package states;

class MainMenuState extends FlxTransitionableState {
	override public function create() {
		final bg = new FlxSprite().loadGraphic(AssetPaths.mainmenubg__png);
		bg.setGraphicSize(FlxG.width, FlxG.height);
		bg.updateHitbox();
		bg.alpha = .6;
		add(bg);

		final mainMenu = new ui.MainMenu();
		mainMenu.percentWidth = 100;
		mainMenu.percentHeight = 100;
		add(mainMenu);

		camera.fade(0, .4, true);
	}
}
