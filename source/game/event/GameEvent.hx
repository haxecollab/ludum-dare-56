package game.event;

import openfl.events.EventType;
import openfl.events.Event;

class GameEvent extends Event {

    public static inline var POPULATION_CHANGE:EventType<GameEvent> = "population_change";

    public function new(type:String){
        super(type);
    }
}