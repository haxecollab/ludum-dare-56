package ui;

import haxe.ui.events.MouseEvent;

@:xml('
<vbox styleName="credits" width="100%" height="100%">
	<label id="title" text="Credits" />
	<hbox width="100%" height="100%">
		<scrollview id="contributors" height="100%" width="50%" scrollMode="hybrid" contentWidth="100%" />
	</hbox>
	<style>
		.credits {
			padding: 12px;
		}

		#title {
			font-size: 12px;
			horizontal-align: center;
		}

		#contributors {
			margin-top: 6px;
			background-color: #1a1c2c;
			background-opacity: 0.5;
			border: 1px solid #333c57;
		}
	</style>
</vbox>
')
class Credits extends haxe.ui.containers.VBox {
	override public function new() {
		super();
		final contribs = Contributors.getContributors();
		for (c in contribs) {
			var newContributor = new ui.CreditsContributor();
			newContributor.name.text = c.name;
			newContributor.role.text = c.role;
			newContributor.avatar.resource = 'assets/avatars/${c.github}.png';
			newContributor.percentWidth = 100;
			contributors.addComponent(newContributor);
		}
	}
}
