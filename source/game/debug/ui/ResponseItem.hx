package game.debug.ui;

import feathers.core.ToggleGroup;
import feathers.controls.ToggleButton;

class ResponseItem extends ToggleButton {
    
    private var _id:String;

    public function new(id:String){
        super();
        setup();
        this._id = id;
    }

    public function setToggleGroup(group:ToggleGroup):Void{
        group.addItem(this);
    }

    public function removeToggleGroup(group:ToggleGroup):Void{
        group.removeItem(this);
    }
    
    private function setup():Void{
        this.text = _id;
    }


}