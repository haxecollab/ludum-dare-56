package ui;

import haxe.ui.events.MouseEvent;

@:xml('
<vbox styleName="credits" width="100%" height="100%">
	<hbox width="100%">
		<box width="100%">
			<button id="back" text="back" />
		</box>
		<hbox width="100%" height="100%">
			<label id="title" styleName="title" text="Credits" textAlign="center" width="100%"/>
		</hbox>
		<box width="100%" />
	</hbox>
	<hbox width="100%" height="100%">
		<scrollview id="contributors" height="100%" width="50%" scrollMode="drag" contentWidth="100%" />
		<vbox id="profile" width="50%" height="100%">
			<scrollview contentWidth="100%" width="100%" height="100%">
				<label style="font-size: 12px;" width="100%" styleName="title" id="name" text="Name" />
				<label style="font-size: 6px;" width="100%" id="role" text="Role" />
				<label id="description" width="100%" text="Description" />
			</scrollview>
			<vbox id="buttons" width="100%" />
		</vbox>
	</hbox>
	<style>
		.credits {
			padding: 12px;
		}

		#title {
			font-size: 12px;
			horizontal-align: center;
			vertical-align: center;
		}

		#contributors, #profile {
			background-color: #1a1c2c;
			background-opacity: 0.5;
			border: 1px solid #333c57;
		}

		#profile {
			padding: 6px;
			border-radius: 1px;
			background-opacity: 0.6;
		}

		#profile > scrollview {
			background-opacity: 0;
			border: 0;
			margin: 0;
		}
	</style>
</vbox>
')
class Credits extends haxe.ui.containers.VBox {
	var current(default, set): ui.CreditsContributor;

	override public function new() {
		super();
		final rand = new flixel.math.FlxRandom();
		final contribs = Contributors.getContributors();
		rand.shuffle(contribs);

		var first = true;
		for (c in contribs) {
			var newContributor = new ui.CreditsContributor(c);
			newContributor.percentWidth = 100;
			newContributor.onClick = (_) -> {
				current = newContributor;
			};
			contributors.addComponent(newContributor);

			if (first) {
				first = false;
				current = newContributor;
			}
		}
	}

	function set_current(newCurrent) {
		current?.removeClass(":active");
		newCurrent.addClass(":active");
		// Update profile fields
		name.text = newCurrent.contributor.name;
		role.text = newCurrent.contributor.role;
		description.text = newCurrent.contributor.description;
		buttons.removeAllComponents();
		for (l in newCurrent.contributor.links.slice(0, 3) ?? []) {
			var button = new haxe.ui.components.Button();
			button.text = l.title;
			button.onClick = (_) -> {
				flixel.FlxG.openURL(l.link);
			};
			button.percentWidth = 100;
			buttons.addComponent(button);
		}
		return current = newCurrent;
	}
}
