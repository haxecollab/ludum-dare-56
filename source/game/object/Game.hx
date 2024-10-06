package game.object;

import openfl.events.Event;
import game.event.GameEvent;
import openfl.events.EventDispatcher;
import game.state.StateManager;
import game.settings.Global;
import game.enums.Clan;

class Game {

    public static inline var LEAF_NPCS_STATE:String = "leaf_npcs";
    public static inline var FIRE_NPCS_STATE:String = "fire_npcs";
    public static inline var WATER_NPCS_STATE:String = "water_npcs";
    public static inline var ICE_NPCS_STATE:String = "ice_npcs";
    public static inline var TURTLE_NPCS_STATE:String = "turtle_npcs";
    public static inline var PEBBLE_NPCS_STATE:String = "pebble_npcs";
    public static inline var LOG_STATE:String = "log";
    public static inline var TIME_STATE:String = "time";
    public static inline var TIME_MODIFIER_STATE:String = "time_modifier";

    private var timeModifier(get, set):Float;
    private var totalTime(get, set):Float;

    private var _leafNPCs:Array<NPC>;
    private var _fireNPCs:Array<NPC>;
    private var _waterNPCs:Array<NPC>;
    private var _iceNPCs:Array<NPC>;
    private var _turtleNPCs:Array<NPC>;
    private var _pebbleNPCs:Array<NPC>;
    private var _log:Array<String>;

    public var eventDispatcher:EventDispatcher;

    private function get_timeModifier():Float{
        return StateManager.current.getValue(TIME_MODIFIER_STATE);
    }

    private function set_timeModifier(value:Float):Float{
        return StateManager.current.setValue(TIME_MODIFIER_STATE, value);
    }

    private function get_totalTime():Float{
        return StateManager.current.getValue(TIME_STATE);
    }

    private function set_totalTime(value:Float):Float{
        return StateManager.current.setValue(TIME_STATE, value);
    }

    public function new(){
        setup();
    }

    private function setup(){
        eventDispatcher = new EventDispatcher();

        timeModifier = 1.0;
        this._leafNPCs = cast StateManager.current.setArray(LEAF_NPCS_STATE, []);
        this._fireNPCs = cast StateManager.current.setArray(FIRE_NPCS_STATE, []);
        this._waterNPCs = cast StateManager.current.setArray(WATER_NPCS_STATE, []);
        this._iceNPCs = cast StateManager.current.setArray(ICE_NPCS_STATE, []);
        this._turtleNPCs = cast StateManager.current.setArray(TURTLE_NPCS_STATE, []);
        this._pebbleNPCs = cast StateManager.current.setArray(PEBBLE_NPCS_STATE, []);
        this._log = cast StateManager.current.setArray(LOG_STATE, []);
    }

    public function loadGame():Void{

    }

    public function newGame():Void{
        var startingNPCs:Int = Math.floor(10 * Global.difficulty);

        for(i in 0...startingNPCs){
            increasePopulation(LEAF);
        }
    }

    public function increasePopulation(clan:Clan):Void{
        var npc:NPC = NPC.generate(clan);
        var npcArray:Array<NPC> = switch (clan){
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
        
        dispatchEvent(new GameEvent(GameEvent.POPULATION_CHANGE));
    }



    public function update(dt:Float){
        _update(dt * this.timeModifier);

    }

    private inline function _update(explicitDt:Float):Void{

    }

    public inline function dispatchEvent(event:Event):Void{
        eventDispatcher.dispatchEvent(event);
    }
}