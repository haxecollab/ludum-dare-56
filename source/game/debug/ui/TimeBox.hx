package game.debug.ui;

import feathers.controls.LayoutGroup;
import game.object.Game;
import game.state.StateManager;
import feathers.controls.Header;

class TimeBox extends LayoutGroup{

    private var _header:Header;
    public function new(){
        super();
        setup();
    }

    private function setup():Void{
        this._header = new Header();
        this._header.width = 212;
        this.addChild(this._header);

       validateTime();
    }

    public function validateTime():Void{
        var time:Float = StateManager.current.getValue(Game.TIME_STATE);
        var days:Int = Math.floor(time/Game.DAY_TIMER) + 1;
        this._header.text = 'Day $days';
    }
}