package ui;

@:xml('
<vbox width="100%" height="100%">
	<vbox id="mainbox" horizontalAlign="center" verticalAlign="center">
		<label id="logo" styleName="title" horizontalAlign="center" text="Tiny Realms" />
		<vbox id="buttonbox" horizontalAlign="center">
			<button id="play" text="Play" />
			<hbox horizontalAlign="center">
				<button id="credits" text="Credits" />
				<button id="github" height="100%" icon="assets/images/github-mark.png" />
			</hbox>
		</vbox>
	</vbox>
	<style>
		label {
			color: white;
			font-name: "assets/fonts/PixelOperator-Bold.ttf";
			font-size: 12px;
		}

		#mainbox {
			spacing: 24px;
			margin: 24px;
			margin-top: 36px;
		}

		#logo {
			font-size: 42px;
			filter: drop-shadow(1, 45, #000000, 0.05, 6, 1, 30, 35, false);
		}

		#buttonbox {
			width: 50%;
		}

		#play {
			width: 100%;
			height: 28px;
			color: #f4f4f4;
			border: $normal-border-size solid #27070d;
			background: #d24b64 #b13e53 vertical;
			font-size: 16px;
		}

		#play:hover {
			border: $normal-border-size solid #3c0f18;
			background: #bf435a #953345 vertical;
		}

		#play:down {
			border: $normal-border-size solid #3c0f18;
			background: #ab3b50 #862d3d;
		}

		#discord {
			filter: drop-shadow(1, 45, #000000, 0.05, 6, 1, 30, 35, false);
			background-color: white;
		}
	</style>
</vbox>
')
class HomePage extends haxe.ui.containers.VBox {}
