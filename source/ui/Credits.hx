package ui;

@:xml('
<vbox styleName="credits" width="100%" height="100%">
	<hbox width="100%">
		<box width="100%">
			<button id="back" text="Back" />
		</box>
		<hbox width="100%" height="100%">
			<label id="title" styleName="title" text="Credits" textAlign="center" width="100%"/>
		</hbox>
		<box width="100%" />
	</hbox>
	<hbox width="100%" height="100%">
		<listview id="contributors" height="100%" width="50%" scrollMode="drag" selectedIndex="0">
			<item-renderer styleName="contributor" width="100%" layout="horizontal">
            	<image id="avatar" width="32" height="32" />
            	<vbox width="100%">
                	<label id="github" styleName="title" width="100%" style="font-size: 16px;font-weight:bold;" />
                	<label style="font-size: 8px;" id="role" width="100%" />
            	</vbox>
        	</item-renderer>
			<data />
		</listview>
		<vbox id="profile" width="50%" height="100%">
			<scrollview contentWidth="100%" width="100%" height="100%">
				<label style="font-size: 14px;" width="100%" styleName="title" id="name" text="Name" />
				<label style="font-size: 8px;" width="100%" id="role" text="Role" />
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

		#contributors, .contributor, #profile {
			background-color: #1a1c2c;
			background-opacity: 0.5;
		}
	
		#contributors {
			border: 1px solid #333c57;
		}

		.contributor:hover {
			background-color: #1a1c2c;
			background-opacity: 0.2;
		}

		.contributor:selected {
			background-color: #1a1c2c;
			background-opacity: 0.7;
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
	override public function new() {
		super();
		
		final contribs = Contributors.getContributors();
		FlxG.random.shuffle(contribs);

		for (c in contribs) {
			contributors.dataSource.add(c);
		}

		contributors.onChange = (_) -> {
			var newCurrent = contribs[contributors.selectedIndex];
			name.text = newCurrent.name;
			role.text = newCurrent.role;
			description.text = newCurrent.description;
			buttons.removeAllComponents();
			for (l in newCurrent.links.slice(0, 3) ?? []) {
				var button = new haxe.ui.components.Button();
				button.text = l.title;
				button.onClick = (_) -> {
					flixel.FlxG.openURL(l.link);
				};
				button.percentWidth = 100;
				buttons.addComponent(button);
			}
		};
	}
}
