package ui;

import haxe.ui.events.MouseEvent;

@:xml('
<vbox width="100%" height="100%">
	<stack id="menu-stack" width="100%" height="100%">
		<homepage id="home" />
		<credits id="credits" />
	</stack>
</vbox>
')
class MainMenu extends haxe.ui.containers.VBox {
	@:bind(home.credits, MouseEvent.MOUSE_DOWN)
	function onCredits(_) {
		menuStack.selectedId = "credits";
	}

	@:bind(credits.back, MouseEvent.MOUSE_DOWN)
	function onCreditsBack(_) {
		menuStack.selectedId = "home";
	}
}
