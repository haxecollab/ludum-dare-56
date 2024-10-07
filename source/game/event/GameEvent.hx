package game.event;

import openfl.utils.Object;
import openfl.events.EventType;
import openfl.events.Event;

class GameEvent extends Event {

    public static inline var POPULATION_CHANGE:EventType<GameEvent> = "population_change";
    public static inline var UPDATE_STATS:EventType<GameEvent> = "update_stats";
    public static inline var ACQUIRE_RELIC:EventType<GameEvent> = "acquire_relic";
    public static inline var DIPLOMACY_CHANGE:EventType<GameEvent> = "diplomacy_change";

    public var data:Object;

    public function new(type:String, ?data:Object){
        super(type);
        this.data = data;
    }

    override function clone():Event {
        var event:GameEvent = cast super.clone();
        event.data = this.data;
        return event;
    }
}