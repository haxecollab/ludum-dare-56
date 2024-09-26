package ui;

import haxe.ui.events.MouseEvent;

@:xml('
<vbox styleName="main-menu" width="100%" height="100%">
	<stack id="menu-stack" width="100%" height="100%">
		<homepage id="home" />
		<credits id="credits" />
	</stack>
	<style>
		.main-menu {
			background-image: "assets/images/mainmenubg.png";
		}
	</style>
</vbox>
')
class MainMenu extends haxe.ui.containers.VBox {
	@:bind(home.credits, MouseEvent.MOUSE_DOWN)
	function onCredits(_) {
		menuStack.selectedId = "credits";
	}
}
