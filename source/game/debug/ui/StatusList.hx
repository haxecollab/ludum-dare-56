package game.debug.ui;

import game.object.Game;
import feathers.skins.RectangleSkin;
import feathers.controls.Header;
import feathers.layout.VerticalLayout;
import feathers.controls.LayoutGroup;
import feathers.controls.Label;
import feathers.layout.HorizontalLayout;
import feathers.controls.dataRenderers.LayoutGroupItemRenderer;
import feathers.data.ArrayCollection;
import feathers.controls.ListView;

// Probably just create a base class headerlist since we have duplicate features here
class StatusList extends LayoutGroup {
	private var _statusGroup:LayoutGroup;
	private var _header:Header;
	private var _populationLabel:Label;
	private var _illnessLabel:Label;
	private var _resourcesLabel:Label;
	private var _moraleLabel:Label;
	private var _gloomLabel:Label;

	public function new() {
		super();
		setup();
	}	

	private function setup():Void {
		var vLayout:VerticalLayout = new VerticalLayout();
		this.layout = vLayout;

		this._header = new Header("Status");
		this._header.width = 212;
		this.addChild(this._header);

		_setupStatusGroup();
		_setupStatusLabels();
	}

	private function _setupStatusGroup():Void {
		var vLayout:VerticalLayout = new VerticalLayout();
		vLayout.gap = 2;
		this._statusGroup = new LayoutGroup();
		this._statusGroup.layout = vLayout;
		this._statusGroup.backgroundSkin = new RectangleSkin(SolidColor(0xffffff));
		this._statusGroup.width = this._header.width;
		this._statusGroup.height = 212;
		addChild(this._statusGroup);
	}

	private function _setupStatusLabels():Void {
		this._populationLabel = new Label();
		this._statusGroup.addChild(this._populationLabel);

		this._illnessLabel = new Label();
		this._statusGroup.addChild(this._illnessLabel);

		this._resourcesLabel = new Label();
		this._statusGroup.addChild(this._resourcesLabel);

		this._moraleLabel = new Label();
		this._statusGroup.addChild(this._moraleLabel);

		this._gloomLabel = new Label();
		this._statusGroup.addChild(this._gloomLabel);

		updateStats(0, 0, 0, 0, 0);
	}

	public function updateStats(population:Int, illness:Float, resources:Int, morale:Float, gloom:Int):Void {
		this._populationLabel.text = 'Population($population)';
		this._illnessLabel.text = 'Illness($illness)';
		this._resourcesLabel.text = 'Resources($resources)';
		this._moraleLabel.text = 'Morale($morale)';
		this._gloomLabel.text = 'Gloom($gloom)';
	}
}
