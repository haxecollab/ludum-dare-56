package ui;

@:xml('
<hbox height="36px" styleName="contributor">
	<image id="avatar" resource="assets/avatars/Dimensionscape.png" width="32px" height="32px" />

	<vbox verticalAlign="center">
		<label id="name" styleName="title" text="Dimensionscape" />
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

		.contributor:active {
			background-color: #1a1c2c;
			background-opacity: 0.5;
		}
	</style>
</hbox>
')
class CreditsContributor extends haxe.ui.containers.HBox {
	public var contributor: Contributors.Contributor;

	public function new(contributor: Contributors.Contributor) {
		super();
		this.contributor = contributor;
		name.text = contributor.name;
		role.text = contributor.role;
		avatar.resource = 'assets/avatars/${contributor.github}.png';
	}
}
