package game.debug.ui;

import feathers.skins.RectangleSkin;
import game.state.StateManager;
import game.object.Game;
import feathers.controls.Header;
import feathers.layout.VerticalLayout;
import feathers.controls.LayoutGroup;
import feathers.controls.Label;

class RelicsList extends LayoutGroup {
	private var _relicsGroup:LayoutGroup;
	private var _header:Header;
	private var _leafRelicLabel:Label;
	private var _fireRelicLabel:Label;
	private var _turtleRelicLabel:Label;
	private var _waterRelicLabel:Label;
	private var _iceRelicLabel:Label;
    private var _pebbleRelicLabel:Label;

	public function new() {
		super();
		setup();
	}	

	private function setup():Void {
		var vLayout:VerticalLayout = new VerticalLayout();
		this.layout = vLayout;

		this._header = new Header("Relics");
		this._header.width = 212;
		this.addChild(this._header);

		_setupRelicsGroup();
		_setupRelicsLabels();
	}

	private function _setupRelicsGroup():Void {
		var vLayout:VerticalLayout = new VerticalLayout();
		vLayout.gap = 2;
		this._relicsGroup = new LayoutGroup();
		this._relicsGroup.layout = vLayout;
		this._relicsGroup.backgroundSkin = new RectangleSkin(SolidColor(0xffffff));
		this._relicsGroup.width = this._header.width;
		this._relicsGroup.height = 212;
		addChild(this._relicsGroup);
	}

	private function _setupRelicsLabels():Void {
		this._leafRelicLabel = new Label();
		this._relicsGroup.addChild(this._leafRelicLabel);

		this._fireRelicLabel = new Label();
		this._relicsGroup.addChild(this._fireRelicLabel);

		this._turtleRelicLabel = new Label();
		this._relicsGroup.addChild(this._turtleRelicLabel);

		this._waterRelicLabel = new Label();
		this._relicsGroup.addChild(this._waterRelicLabel);

		this._iceRelicLabel = new Label();
		this._relicsGroup.addChild(this._iceRelicLabel);
        
        this._pebbleRelicLabel = new Label();
		this._relicsGroup.addChild(this._pebbleRelicLabel);

		validateRelics();
	}

	public function validateRelics():Void {        
        var hasLeafRelic:Bool = StateManager.current.getSwitch(Game.LEAF_RELIC_STATE);
		var hasFireRelic:Bool = StateManager.current.getSwitch(Game.FIRE_RELIC_STATE);
		var hasTurtleRelic:Bool = StateManager.current.getSwitch(Game.TURTLE_RELIC_STATE);
		var hasWaterRelic:Bool = StateManager.current.getSwitch(Game.WATER_RELIC_STATE);
		var hasIceRelic:Bool = StateManager.current.getSwitch(Game.ICE_RELIC_STATE);
		var hasPebbleRelic:Bool = StateManager.current.getSwitch(Game.PEBBLE_RELIC_STATE);

		this._leafRelicLabel.text = 'Leaf Clan(${hasLeafRelic})';
		this._fireRelicLabel.text = 'Fire Clan(${hasFireRelic})';
		this._turtleRelicLabel.text = 'Turtle Clan(${hasTurtleRelic})';
		this._waterRelicLabel.text = 'Water Clan(${hasWaterRelic})';
		this._iceRelicLabel.text = 'Ice Clan(${hasIceRelic})';
        this._pebbleRelicLabel.text = 'Pebble Clan(${hasPebbleRelic})';
	} 
}
