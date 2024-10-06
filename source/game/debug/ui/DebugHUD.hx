package game.debug.ui;

import game.debug.ui.LogVIew.LogView;
import feathers.layout.VerticalLayout;
import openfl.Lib;
import feathers.layout.HorizontalLayout;
import feathers.controls.LayoutGroup;

class DebugHUD extends LayoutGroup {
	public var pebbleNPCList:NPCList;
	public var leafNPCList:NPCList;
	public var iceNPCList:NPCList;
	public var waterNPCList:NPCList;
	public var turtleNPCList:NPCList;
	public var fireNPCList:NPCList;

	private var _listGroup:LayoutGroup;
	private var _dialogGroup:LayoutGroup;
	private var _dialogueBox:DialogueBox;
	private var _logView:LogView;

	public function new() {
		super();
		setup();
	}

	private function setup():Void {
		var vLayout:VerticalLayout = new VerticalLayout();
        vLayout.gap = 2;
		this.layout = vLayout;

		_setupListGroup();
		_setupDialogueBox();
		_setupLogView();
	}

	private function _setupListGroup():Void {
		var hLayout:HorizontalLayout = new HorizontalLayout();
		hLayout.gap = 2;

		this._listGroup = new LayoutGroup();
		this._listGroup.layout = hLayout;

		this.pebbleNPCList = new NPCList("pebble_clan");
		this.leafNPCList = new NPCList("leaf_clan");
		this.iceNPCList = new NPCList("ice_clan");
		this.waterNPCList = new NPCList("water_clan");
		this.turtleNPCList = new NPCList("turtle_clan");
		this.fireNPCList = new NPCList("fire_clan");

		this._listGroup.addChild(leafNPCList);
		this._listGroup.addChild(pebbleNPCList);
		this._listGroup.addChild(iceNPCList);
		this._listGroup.addChild(waterNPCList);
		this._listGroup.addChild(turtleNPCList);
		this._listGroup.addChild(fireNPCList);

		this.addChild(_listGroup);
	}

	private function _setupDialogueBox():Void {
		var hLayout:HorizontalLayout = new HorizontalLayout();
        hLayout.gap = 2;
		this._dialogGroup = new LayoutGroup();
		this._dialogGroup.layout = hLayout;
		this.addChild(_dialogGroup);

		this._dialogueBox = new DialogueBox();
		this._dialogueBox.width = Lib.current.stage.stageWidth - 216;
		this._dialogGroup.addChild(_dialogueBox);

	}

	private function _setupLogView():Void {
		this._logView = new LogView();
		this._dialogGroup.addChild(_logView);
	}
}
