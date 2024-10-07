package game.object;

import haxe.Timer;
import openfl.events.Event;
import game.event.GameEvent;
import openfl.events.EventDispatcher;
import game.state.StateManager;
import game.settings.Global;
import game.enums.Clan;

class Game {
	// NPC STATES
	public static inline var LEAF_NPCS_STATE:String = "leaf_npcs";
	public static inline var FIRE_NPCS_STATE:String = "fire_npcs";
	public static inline var WATER_NPCS_STATE:String = "water_npcs";
	public static inline var ICE_NPCS_STATE:String = "ice_npcs";
	public static inline var TURTLE_NPCS_STATE:String = "turtle_npcs";
	public static inline var PEBBLE_NPCS_STATE:String = "pebble_npcs";

	// MISC STATES
	public static inline var LOG_STATE:String = "log";
	public static inline var TIME_STATE:String = "time";
	public static inline var TIME_MODIFIER_STATE:String = "time_modifier";

	// RELIC STATES
	public static inline var LEAF_RELIC_STATE:String = "leaf_relic";
	public static inline var FIRE_RELIC_STATE:String = "fire_relic";
	public static inline var ICE_RELIC_STATE:String = "ice_relic";
	public static inline var WATER_RELIC_STATE:String = "water_relic";
	public static inline var TURTLE_RELIC_STATE:String = "turtle_relic";
	public static inline var PEBBLE_RELIC_STATE:String = "pebble_relic";

	// DIPLOMACY STATES
	public static inline var LEAF_DIPLOMACY_STATE:String = "leaf_diplomacy";
	public static inline var FIRE_DIPLOMACY_STATE:String = "fire_diplomacy";
	public static inline var WATER_DIPLOMACY_STATE:String = "water_diplomacy";
	public static inline var ICE_DIPLOMACY_STATE:String = "ice_diplomacy";
	public static inline var TURTLE_DIPLOMACY_STATE:String = "turtle_diplomacy";
	public static inline var PEBBLE_DIPLOMACY_STATE:String = "pebble_diplomacy";

	private static inline var STATS_TIMER:Float = 3.0;
	public static inline var DAY_TIMER:Float = 10.0;

	// ATTRIBUTE STATES
	public var population(get, null):Int;
	public var morale(get, null):Float;
	public var illness(get, null):Float;
	public var resources(get, null):Int;
	public var gloom:Int;

	public var hasLeafRelic(get, set):Bool;
	public var hasFireRelic(get, set):Bool;
	public var hasIceRelic(get, set):Bool;
	public var hasWaterRelic(get, set):Bool;
	public var hasTurtleRelic(get, set):Bool;
	public var hasPebbleRelic(get, set):Bool;

	public var leafDiplomacy(get, set):Float;
	public var fireDiplomacy(get, set):Float;
	public var waterDiplomacy(get, set):Float;
	public var iceDiplomacy(get, set):Float;
	public var turtleDiplomacy(get, set):Float;
	public var pebbleDiplomacy(get, set):Float;

	private var timeModifier(get, set):Float;
	private var totalTime(get, set):Float;

	private var _leafNPCs:Array<NPC>;
	private var _fireNPCs:Array<NPC>;
	private var _waterNPCs:Array<NPC>;
	private var _iceNPCs:Array<NPC>;
	private var _turtleNPCs:Array<NPC>;
	private var _pebbleNPCs:Array<NPC>;
	private var _log:Array<String>;
	private var _relics:Array<String>;

	public var eventDispatcher:EventDispatcher;

	private var _statsTimer:Float;
	private var _dayTimer:Float;

	private function get_timeModifier():Float {
		return StateManager.current.getValue(TIME_MODIFIER_STATE);
	}

	private function set_timeModifier(value:Float):Float {
		return StateManager.current.setValue(TIME_MODIFIER_STATE, value);
	}

	private function get_totalTime():Float {
		return StateManager.current.getValue(TIME_STATE);
	}

	private function set_totalTime(value:Float):Float {
		return StateManager.current.setValue(TIME_STATE, value);
	}

	private function get_leafDiplomacy():Float {
		return StateManager.current.getValue(LEAF_DIPLOMACY_STATE);
	}

	private function set_leafDiplomacy(value:Float):Float {
		StateManager.current.setValue(LEAF_DIPLOMACY_STATE, value);
        this.dispatchEvent(new GameEvent(GameEvent.DIPLOMACY_CHANGE, Clan.LEAF));
        return value;
	}

	private function get_fireDiplomacy():Float {
		return StateManager.current.getValue(FIRE_DIPLOMACY_STATE);
	}

	private function set_fireDiplomacy(value:Float):Float {
		StateManager.current.setValue(FIRE_DIPLOMACY_STATE, value);
        this.dispatchEvent(new GameEvent(GameEvent.DIPLOMACY_CHANGE, Clan.FIRE));
        return value;
	}

	private function get_waterDiplomacy():Float {
		return StateManager.current.getValue(WATER_DIPLOMACY_STATE);
	}

	private function set_waterDiplomacy(value:Float):Float {
		StateManager.current.setValue(WATER_DIPLOMACY_STATE, value);
        this.dispatchEvent(new GameEvent(GameEvent.DIPLOMACY_CHANGE, Clan.WATER));
        return value;
	}

	private function get_iceDiplomacy():Float {
		return StateManager.current.getValue(ICE_DIPLOMACY_STATE);
	}

	private function set_iceDiplomacy(value:Float):Float {
		StateManager.current.setValue(ICE_DIPLOMACY_STATE, value);
        this.dispatchEvent(new GameEvent(GameEvent.DIPLOMACY_CHANGE, Clan.ICE));
        return value;
	}

	private function get_turtleDiplomacy():Float {
		return StateManager.current.getValue(TURTLE_DIPLOMACY_STATE);
	}

	private function set_turtleDiplomacy(value:Float):Float {
		StateManager.current.setValue(TURTLE_DIPLOMACY_STATE, value);
        this.dispatchEvent(new GameEvent(GameEvent.DIPLOMACY_CHANGE, Clan.TURTLE));
        return value;
	}

	private function get_pebbleDiplomacy():Float {
		return StateManager.current.getValue(PEBBLE_DIPLOMACY_STATE);
	}

	private function set_pebbleDiplomacy(value:Float):Float {
		StateManager.current.setValue(PEBBLE_DIPLOMACY_STATE, value);
        this.dispatchEvent(new GameEvent(GameEvent.DIPLOMACY_CHANGE, Clan.PEBBLE));
        return value;
	}

	private function get_population():Int {
		return 1;
	}

	private function get_morale():Float {
		return 1;
	}

	private function get_illness():Float {
		return 1;
	}

	private function get_resources():Int {
		return 1;
	}

	private function get_hasLeafRelic():Bool {
		return StateManager.current.getSwitch(LEAF_RELIC_STATE);
	}

	private function set_hasLeafRelic(value:Bool):Bool {
		StateManager.current.setSwitch(LEAF_RELIC_STATE, value);
		return value;
	}

	private function get_hasFireRelic():Bool {
		return StateManager.current.getSwitch(FIRE_RELIC_STATE);
	}

	private function set_hasFireRelic(value:Bool):Bool {
		StateManager.current.setSwitch(FIRE_RELIC_STATE, value);
		return value;
	}

	private function get_hasIceRelic():Bool {
		return StateManager.current.getSwitch(ICE_RELIC_STATE);
	}

	private function set_hasIceRelic(value:Bool):Bool {
		StateManager.current.setSwitch(ICE_RELIC_STATE, value);
		return value;
	}

	private function get_hasWaterRelic():Bool {
		return StateManager.current.getSwitch(WATER_RELIC_STATE);
	}

	private function set_hasWaterRelic(value:Bool):Bool {
		StateManager.current.setSwitch(WATER_RELIC_STATE, value);
		return value;
	}

	private function get_hasTurtleRelic():Bool {
		return StateManager.current.getSwitch(TURTLE_RELIC_STATE);
	}

	private function set_hasTurtleRelic(value:Bool):Bool {
		StateManager.current.setSwitch(TURTLE_RELIC_STATE, value);
		return value;
	}

	private function get_hasPebbleRelic():Bool {
		return StateManager.current.getSwitch(PEBBLE_RELIC_STATE);
	}

	private function set_hasPebbleRelic(value:Bool):Bool {
		StateManager.current.setSwitch(PEBBLE_RELIC_STATE, value);
		return value;
	}

	public function new() {
		setup();
	}

	private function setup() {
		eventDispatcher = new EventDispatcher();
		timeModifier = 1.0;
		_statsTimer = STATS_TIMER;
		_dayTimer = DAY_TIMER;
		totalTime = 0.0;

		this._log = cast StateManager.current.setArray(LOG_STATE, []);

        _setupRelicStates();
		_setupNPCStates();
		_setupDiplomacyStates();
	}

    private function _setupRelicStates():Void{
        hasFireRelic = false;
        hasLeafRelic = false;
        hasWaterRelic = false;
        hasIceRelic = false;
        hasTurtleRelic = false;
        hasPebbleRelic = false;
    }

	private function _setupDiplomacyStates():Void {
		leafDiplomacy = 50.0 * Global.difficulty;
		fireDiplomacy = 0.0;
		waterDiplomacy = 0.0;
		iceDiplomacy = 0.0;
		turtleDiplomacy = 0.0;
		pebbleDiplomacy = 0.0;
	}

	private function _setupNPCStates():Void {
		this._leafNPCs = cast StateManager.current.setArray(LEAF_NPCS_STATE, []);
		this._fireNPCs = cast StateManager.current.setArray(FIRE_NPCS_STATE, []);
		this._waterNPCs = cast StateManager.current.setArray(WATER_NPCS_STATE, []);
		this._iceNPCs = cast StateManager.current.setArray(ICE_NPCS_STATE, []);
		this._turtleNPCs = cast StateManager.current.setArray(TURTLE_NPCS_STATE, []);
		this._pebbleNPCs = cast StateManager.current.setArray(PEBBLE_NPCS_STATE, []);
	}

	public function loadGame():Void {}

	public function newGame():Void {
		var startingNPCs:Int = Math.floor(10 * Global.difficulty);

		for (i in 0...startingNPCs) {
			increasePopulation(LEAF);
		}
	}

	public function increasePopulation(clan:Clan):Void {
		var npc:NPC = NPC.generate(clan);
		var npcArray:Array<NPC> = switch (clan) {
			case LEAF:
				this._leafNPCs;
			case FIRE:
				this._fireNPCs;
			case ICE:
				this._iceNPCs;
			case PEBBLE:
				this._pebbleNPCs;
			case WATER:
				this._waterNPCs;
			case TURTLE:
				this._turtleNPCs;
		}

		npcArray.push(npc);

		dispatchEvent(new GameEvent(GameEvent.POPULATION_CHANGE, clan));
	}

	public function increaseFavor(value:Float, clan:Clan):Void {
		var acquireRelic:Bool = false;
		switch (clan) {
			case LEAF:
				this.leafDiplomacy += value;
				if ((this.leafDiplomacy == 100) && (!this.hasLeafRelic)) {
					this.hasLeafRelic = true;
					acquireRelic = true;
				}
			case FIRE:
				this.fireDiplomacy += value;
				if ((this.fireDiplomacy == 100) && (!this.hasFireRelic)) {
					this.hasFireRelic = true;
					acquireRelic = true;
				}
			case ICE:
				this.iceDiplomacy += value;
				if ((this.iceDiplomacy == 100) && (!this.hasIceRelic)) {
					this.hasIceRelic = true;
					acquireRelic = true;
				}
			case PEBBLE:
				this.pebbleDiplomacy += value;
				if ((this.pebbleDiplomacy == 100) && (!this.hasPebbleRelic)) {
					this.hasPebbleRelic = true;
					acquireRelic = true;
				}
			case WATER:
				this.waterDiplomacy += value;
				if ((this.waterDiplomacy == 100) && (!this.hasWaterRelic)) {
					this.hasWaterRelic = true;
					acquireRelic = true;
				}
			case TURTLE:
				this.turtleDiplomacy += value;
				if ((this.turtleDiplomacy == 100) && (!this.hasTurtleRelic)) {
					this.hasTurtleRelic = true;
					acquireRelic = true;
				}
		}

        if(acquireRelic){
            this.dispatchEvent(new GameEvent(GameEvent.ACQUIRE_RELIC));
        }
	}

	public function update(dt:Float) {		
		this._update(dt * this.timeModifier);
	}

	private inline function _update(explicitDt:Float):Void {
		this._updateTimers(explicitDt);
		totalTime += explicitDt;
	}

	private inline function _updateTimers(dt:Float) {
		this._dayTimer -= dt;
		this._statsTimer -= dt;
		if (this._statsTimer <= 0) {
			this._statsTimer += STATS_TIMER;
			this.dispatchEvent(new GameEvent(GameEvent.UPDATE_STATS));
		}

		if (this._dayTimer <= 0) {
			this._dayTimer += DAY_TIMER;
			this.dispatchEvent(new GameEvent(GameEvent.UPDATE_TIME));
		}
	}

	public inline function dispatchEvent(event:Event):Void {
		this.eventDispatcher.dispatchEvent(event);
	}
}
