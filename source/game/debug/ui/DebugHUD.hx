package game.debug.ui;

import game.state.StateManager;
import haxe.macro.Expr.Case;
import game.enums.Clan;
import game.event.GameEvent;
import game.object.Game;
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
	private var _footerGroup:LayoutGroup;
	private var _taskList:TaskList;
	private var _itemsList:ItemsList;
	private var _relicsList:RelicsList;
	private var _favorList:FavorList;
	private var _statusList:StatusList;
	private var _timeView:TimeBox;

	public var game(default, null):Game;

	public function new(game:Game) {
		super();
		this.game = game;
		setup();
	}

	private function setup():Void {
		var vLayout:VerticalLayout = new VerticalLayout();
		vLayout.gap = 2;
		this.layout = vLayout;

		_setupListGroup();
		_setupDialogueBox();
		_setupLogView();
		_setupFooterGroup();
		_setupEventSubs();
		_setupDataSync();

	}

	private function _onPopulationChange(e:GameEvent):Void {
		var npcList:NPCList = switch ((e.data : Clan)) {
			case FIRE:
				this.fireNPCList;
			case ICE:
				this.iceNPCList;
			case LEAF:
				this.leafNPCList;
			case WATER:
				this.waterNPCList;
			case TURTLE:
				this.turtleNPCList;
			case PEBBLE:
				this.pebbleNPCList;
		}
		npcList.validateHeaderData();
	}

	private function _setupDataSync():Void {
		this.pebbleNPCList.setData(cast StateManager.current.getArray(Game.PEBBLE_NPCS_STATE));
		this.fireNPCList.setData(cast StateManager.current.getArray(Game.FIRE_NPCS_STATE));
		this.waterNPCList.setData(cast StateManager.current.getArray(Game.WATER_NPCS_STATE));
		this.leafNPCList.setData(cast StateManager.current.getArray(Game.LEAF_NPCS_STATE));
		this.turtleNPCList.setData(cast StateManager.current.getArray(Game.TURTLE_NPCS_STATE));
		this.iceNPCList.setData(cast StateManager.current.getArray(Game.ICE_NPCS_STATE));
	}

	private function _onUpdateStats(e:GameEvent):Void {
		_statusList.updateStats(game.population, game.illness, game.resources, game.morale, game.gloom);
	}

	private function _onAcquireRelic(e:GameEvent):Void{
		_relicsList.validateRelics();
	}

	private function _onUpdateDayTime(e:GameEvent):Void{
		_timeView.validateTime();
	}

	private function _onDiplomacyChanged(e:GameEvent):Void{
		_favorList.updateDiplomacy();
	}

	private function _setupEventSubs():Void {
		game.eventDispatcher.addEventListener(GameEvent.POPULATION_CHANGE, _onPopulationChange);
		game.eventDispatcher.addEventListener(GameEvent.UPDATE_STATS, _onUpdateStats);
		game.eventDispatcher.addEventListener(GameEvent.ACQUIRE_RELIC, _onAcquireRelic);
		game.eventDispatcher.addEventListener(GameEvent.UPDATE_TIME, _onUpdateDayTime);
		game.eventDispatcher.addEventListener(GameEvent.DIPLOMACY_CHANGE, _onDiplomacyChanged);
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

	private function _setupFooterGroup():Void {
		var hLayout:HorizontalLayout = new HorizontalLayout();
		hLayout.gap = 2;
		this._footerGroup = new LayoutGroup();
		this._footerGroup.layout = hLayout;
		this.addChild(_footerGroup);

		_taskList = new TaskList();
		this._footerGroup.addChild(_taskList);

		_itemsList = new ItemsList();
		this._footerGroup.addChild(_itemsList);

		_relicsList = new RelicsList();
		this._footerGroup.addChild(_relicsList);

		_favorList = new FavorList();
		this._footerGroup.addChild(_favorList);

		_statusList = new StatusList();
		this._footerGroup.addChild(_statusList);

		_timeView = new TimeBox();
		this._footerGroup.addChild(_timeView);
	}
}
