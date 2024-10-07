package game.debug.ui;

import game.object.Game;
import game.enums.Clan;
import game.state.StateManager;
import feathers.skins.RectangleSkin;
import feathers.controls.Header;
import feathers.layout.VerticalLayout;
import feathers.controls.LayoutGroup;
import feathers.controls.Label;

//Probably just create a base class headerlist since we have duplicate features here
class FavorList extends LayoutGroup {
	private var _diplomacyGroup:LayoutGroup;
	private var _header:Header;
	private var _leafFavorLabel:Label;
	private var _fireFavorLabel:Label;
	private var _turtleFavorLabel:Label;
	private var _waterFavorLabel:Label;
	private var _iceFavorLabel:Label;
    private var _pebbleFavorLabel:Label;

	public function new() {
		super();
		setup();
	}	

	private function setup():Void {
		var vLayout:VerticalLayout = new VerticalLayout();
		this.layout = vLayout;

		this._header = new Header("Diplomacy");
		this._header.width = 212;
		this.addChild(this._header);

		_setupDiplomacyGroup();
		_setupDiplomacyLabels();
	}

	private function _setupDiplomacyGroup():Void {
		var vLayout:VerticalLayout = new VerticalLayout();
		vLayout.gap = 2;
		this._diplomacyGroup = new LayoutGroup();
		this._diplomacyGroup.layout = vLayout;
		this._diplomacyGroup.backgroundSkin = new RectangleSkin(SolidColor(0xffffff));
		this._diplomacyGroup.width = this._header.width;
		this._diplomacyGroup.height = 212;
		addChild(this._diplomacyGroup);
	}

	private function _setupDiplomacyLabels():Void {
		this._leafFavorLabel = new Label();
		this._diplomacyGroup.addChild(this._leafFavorLabel);

		this._fireFavorLabel = new Label();
		this._diplomacyGroup.addChild(this._fireFavorLabel);

		this._turtleFavorLabel = new Label();
		this._diplomacyGroup.addChild(this._turtleFavorLabel);

		this._waterFavorLabel = new Label();
		this._diplomacyGroup.addChild(this._waterFavorLabel);

		this._iceFavorLabel = new Label();
		this._diplomacyGroup.addChild(this._iceFavorLabel);
        
        this._pebbleFavorLabel = new Label();
		this._diplomacyGroup.addChild(this._pebbleFavorLabel);

		updateDiplomacy();
	}

	public function updateDiplomacy():Void {
        var leafDiplomacy:Float = StateManager.current.getValue(Game.LEAF_DIPLOMACY_STATE);
		var fireDiplomacy:Float = StateManager.current.getValue(Game.FIRE_DIPLOMACY_STATE);
		var turtleDiplomacy:Float = StateManager.current.getValue(Game.TURTLE_DIPLOMACY_STATE);
		var waterDiplomacy:Float = StateManager.current.getValue(Game.WATER_DIPLOMACY_STATE);
		var iceDiplomacy:Float = StateManager.current.getValue(Game.ICE_DIPLOMACY_STATE);
		var pebbleDiplomacy:Float = StateManager.current.getValue(Game.PEBBLE_DIPLOMACY_STATE);

		this._leafFavorLabel.text = 'Leaf Clan(${leafDiplomacy})';
		this._fireFavorLabel.text = 'Fire Clan(${fireDiplomacy})';
		this._turtleFavorLabel.text = 'Turtle Clan(${turtleDiplomacy})';
		this._waterFavorLabel.text = 'Water Clan(${waterDiplomacy})';
		this._iceFavorLabel.text = 'Ice Clan(${iceDiplomacy})';
        this._pebbleFavorLabel.text = 'Pebble Clan(${pebbleDiplomacy})';
	}
}
