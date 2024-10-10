package ui;

import haxe.ui.events.MouseEvent;

@:xml('
<vbox width="100%" height="100%">
	<stack id="menu-stack" width="100%" height="100%">
		<homepage id="home" />
		<loadscreen id="load" />
		<credits id="credits" />
	</stack>
</vbox>
')
class MainMenu extends haxe.ui.containers.VBox {
	@:bind(home.credits, MouseEvent.MOUSE_DOWN)
	function onCredits(_) {
		menuStack.selectedId = "credits";
	}

	@:bind(home.play, MouseEvent.MOUSE_DOWN)
	function onPlay(_) {
		menuStack.selectedId = "load";
	}

	@:bind(credits.back, MouseEvent.MOUSE_DOWN)
	@:bind(load.back, MouseEvent.MOUSE_DOWN)
	function goBack(_) {
		menuStack.selectedId = "home";
	}

	@:bind(home.github, MouseEvent.MOUSE_DOWN)
	function onGithub(_) {
		FlxG.openURL("https://github.com/haxecollab/ludum-dare-56");
	}
}
