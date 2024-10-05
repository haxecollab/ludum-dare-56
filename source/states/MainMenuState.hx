package states;

class MainMenuState extends FlxTransitionableState {
	override public function create() {
		var bg = new FlxSprite().loadGraphic(AssetPaths.mainmenubg__png);
		bg.setGraphicSize(FlxG.width, FlxG.height);
		bg.updateHitbox();
		add(bg);

		final mainMenu = new ui.MainMenu();
		mainMenu.percentWidth = 100;
		mainMenu.percentHeight = 100;
		Screen.instance.addComponent(mainMenu);
	}
}
