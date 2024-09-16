package ui;

import haxe.ui.events.MouseEvent;

@:xml('
<vbox className="main-menu" width="100%" height="100%">
	<vbox id="mainbox" horizontalAlign="center" verticalAlign="center">
		<label id="logo" horizontalAlign="center" text="HaxeCollab" />
		<vbox id="buttonbox" horizontalAlign="center">
			<button id="play-button" text="play" />
			<hbox>
				<button text="credits" />
				<button id="github" height="100%" icon="assets/images/github-mark.png" />
			</hbox>
		</vbox>
	</vbox>
	<box width="100%" height="100%">
		<hbox id="discord" width="33.33%" height="38px" horizontalAlign="right" verticalAlign="center">
		</hbox>
	</box>
	<style>
		label {
			color: white;
			font-name: "assets/fonts/LibreFranklin-Black.ttf";
		}

		#mainbox {
			spacing: 24px;
			padding: 24px;
			padding-top: 36px;
		}

		#logo {
			font-size: 36px;
			filter: drop-shadow(1, 45, #000000, 0.05, 6, 1, 30, 35, false);
		}

		#buttonbox {
			width: 50%;
		}

		#play-button {
			width: 100%;
			height: 32px;
			color: #f4f4f4;
			border: $normal-border-size solid #27070d;
			background: #d24b64 #b13e53 vertical;
			font-size: 14px;
		}

		#play-button:hover {
			border: $normal-border-size solid #3c0f18;
			background: #bf435a #953345 vertical;
		}

		#play-button:down {
			border: $normal-border-size solid #3c0f18;
			background: #ab3b50 #862d3d;
		}

		#discord {
			filter: drop-shadow(1, 45, #000000, 0.05, 6, 1, 30, 35, false);
			background-color: white;
		}

		.main-menu {
			background-image: "assets/images/mainmenubg.png";
		}
	</style>
</vbox>
')
class MainMenu extends haxe.ui.containers.VBox {
	@:bind(github, MouseEvent.MOUSE_DOWN)
	function onGithub(_) {
		flixel.FlxG.openURL("https://github.com/haxecollab/ludum-dare-56");
	}
}
