package ui;

@:xml('
<hbox height="36px" styleName="contributor">
	<image id="avatar" resource="assets/avatars/Dimensionscape.png" width="32px" height="32px" />

	<vbox verticalAlign="center">
		<label id="name" text="Dimensionscape" />
		<label id="role" style="font-size: 6px;" text="TBD" />
	</vbox>

	<style>
		.contributor {
			pointer-events: true;
			padding: 2px;
		}

		.contributor:hover {
			background-color: #1a1c2c;
			background-opacity: 0.2;
		}
	</style>
</hbox>
')
class CreditsContributor extends haxe.ui.containers.HBox {}
