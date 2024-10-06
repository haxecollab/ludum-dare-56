package game.debug.ui;

import feathers.controls.Header;
import feathers.layout.VerticalLayout;
import openfl.events.Event;
import feathers.controls.TextArea;
import feathers.controls.LayoutGroup;

class DialogueBox extends LayoutGroup{

    private var _textArea:TextArea;
    private var _header:Header;

    public function new(){
        super();
        setup();
    }

    private function setup():Void{
        var vLayout:VerticalLayout = new VerticalLayout();
        vLayout.gap = 1;
        this.layout = vLayout; 

        this._header = new Header("Dialogue");
        this.addChild(_header);
        
        this._textArea = new TextArea();
        this._textArea.height = 128;
        this._textArea.editable = false;
       this.addEventListener(Event.RESIZE, _onResize);
       this.addChild(_textArea);
    }

    private function _onResize(e:Event):Void{
        this._textArea.width = this.width;
        this._header.width = this.width;

    }
}