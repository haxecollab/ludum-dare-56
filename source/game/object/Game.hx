package game.object;

import openfl.events.Event;
import game.event.GameEvent;
import openfl.events.EventDispatcher;
import game.state.StateManager;
import game.settings.Global;
import game.enums.Clan;

class Game {

    //NPC STATES
    public static inline var LEAF_NPCS_STATE:String = "leaf_npcs";
    public static inline var FIRE_NPCS_STATE:String = "fire_npcs";
    public static inline var WATER_NPCS_STATE:String = "water_npcs";
    public static inline var ICE_NPCS_STATE:String = "ice_npcs";
    public static inline var TURTLE_NPCS_STATE:String = "turtle_npcs";
    public static inline var PEBBLE_NPCS_STATE:String = "pebble_npcs";

    //MISC STATES
    public static inline var LOG_STATE:String = "log";
    public static inline var TIME_STATE:String = "time";    
    public static inline var TIME_MODIFIER_STATE:String = "time_modifier";

    //DIPLOMACY STATES
    public static inline var LEAF_DIPLOMACY_STATE:String = "leaf_diplomacy";
    public static inline var FIRE_DIPLOMACY_STATE:String = "fire_diplomacy";
    public static inline var WATER_DIPLOMACY_STATE:String = "water_diplomacy";
    public static inline var ICE_DIPLOMACY_STATE:String = "ice_diplomacy";
    public static inline var TURTLE_DIPLOMACY_STATE:String = "turtle_diplomacy";
    public static inline var PEBBLE_DIPLOMACY_STATE:String = "pebble_diplomacy";

    //ATTRIBUTE STATES

    public var population(get, null):Int;
    public var morale(get, null):Float;
    public var illness(get, null):Float;
    public var resources(get, null):Int;
    public var gloom:Int;

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

    private function get_leafDiplomacy():Float {
        return StateManager.current.getValue(LEAF_DIPLOMACY_STATE);
    }
    
    private function set_leafDiplomacy(value:Float):Float {
        return StateManager.current.setValue(LEAF_DIPLOMACY_STATE, value);
    }
    
    private function get_fireDiplomacy():Float {
        return StateManager.current.getValue(FIRE_DIPLOMACY_STATE);
    }
    
    private function set_fireDiplomacy(value:Float):Float {
        return StateManager.current.setValue(FIRE_DIPLOMACY_STATE, value);
    }
    
    private function get_waterDiplomacy():Float {
        return StateManager.current.getValue(WATER_DIPLOMACY_STATE);
    }
    
    private function set_waterDiplomacy(value:Float):Float {
        return StateManager.current.setValue(WATER_DIPLOMACY_STATE, value);
    }
    
    private function get_iceDiplomacy():Float {
        return StateManager.current.getValue(ICE_DIPLOMACY_STATE);
    }
    
    private function set_iceDiplomacy(value:Float):Float {
        return StateManager.current.setValue(ICE_DIPLOMACY_STATE, value);
    }
    
    private function get_turtleDiplomacy():Float {
        return StateManager.current.getValue(TURTLE_DIPLOMACY_STATE);
    }
    
    private function set_turtleDiplomacy(value:Float):Float {
        return StateManager.current.setValue(TURTLE_DIPLOMACY_STATE, value);
    }
    
    private function get_pebbleDiplomacy():Float {
        return StateManager.current.getValue(PEBBLE_DIPLOMACY_STATE);
    }
    
    private function set_pebbleDiplomacy(value:Float):Float {
        return StateManager.current.setValue(PEBBLE_DIPLOMACY_STATE, value);
    }

    private function get_population():Int {
        return 0;
    }

    private function get_morale():Float {
        return 0;
    }

    private function get_illness():Float {
        return 0;
    }

   private function get_resources():Int {
        return 0;
    }

    public function new(){
        setup();
    }

    private function setup(){
        eventDispatcher = new EventDispatcher();
        timeModifier = 1.0;        
        this._log = cast StateManager.current.setArray(LOG_STATE, []);
        this._relics = cast StateManager.current.setArray(LOG_STATE, []);

        _setupNPCStates();
        _setupDiplomacyStates();

    }

    private function _setupDiplomacyStates():Void {
        leafDiplomacy = 0.0;
        fireDiplomacy = 0.0;
        waterDiplomacy = 0.0;
        iceDiplomacy = 0.0;
        turtleDiplomacy = 0.0;
        pebbleDiplomacy = 0.0;
    }

    private function _setupNPCStates():Void{
        this._leafNPCs = cast StateManager.current.setArray(LEAF_NPCS_STATE, []);
        this._fireNPCs = cast StateManager.current.setArray(FIRE_NPCS_STATE, []);
        this._waterNPCs = cast StateManager.current.setArray(WATER_NPCS_STATE, []);
        this._iceNPCs = cast StateManager.current.setArray(ICE_NPCS_STATE, []);
        this._turtleNPCs = cast StateManager.current.setArray(TURTLE_NPCS_STATE, []);
        this._pebbleNPCs = cast StateManager.current.setArray(PEBBLE_NPCS_STATE, []);
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
        
        dispatchEvent(new GameEvent(GameEvent.POPULATION_CHANGE, clan));
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