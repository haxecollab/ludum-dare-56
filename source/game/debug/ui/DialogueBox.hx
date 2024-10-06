package game.debug.ui;

import feathers.core.ToggleGroup;
import openfl.utils.Object;
import feathers.controls.ScrollContainer;
import feathers.controls.Header;
import feathers.layout.VerticalLayout;
import openfl.events.Event;
import feathers.controls.TextArea;
import feathers.controls.LayoutGroup;

class DialogueBox extends LayoutGroup {
	private var _textArea:TextArea;
	private var _header:Header;
	private var _responseView:ScrollContainer;
    private var _toggleGroup:ToggleGroup;

	public function new() {
		super();
		setup();
	}

    public function set(dialogue:String):Void{
        _textArea.text = dialogue;
    }

    public function setResponse(options:Array<Object>):Void{
        for(obj in options){
            var item:ResponseItem = new ResponseItem(obj.id);
            item.setToggleGroup(_toggleGroup);
            _responseView.addChild(item);
        }
    }

	public function reset():Void {
		resetResponseView();
		resetDialogueView();
	}

	private function resetResponseView():Void {
        _toggleGroup.removeAllItems();
		_responseView.removeChildren();
	}

	private function resetDialogueView():Void {
		_textArea.text = "";
	}

	private function setup():Void {
		var vLayout:VerticalLayout = new VerticalLayout();
		this.layout = vLayout;

		this._header = new Header("Dialogue");
		this.addChild(_header);

		this._textArea = new TextArea();
        this._textArea.wordWrap = false;
		this._textArea.height = 128;
		this._textArea.editable = false;
		this.addChild(_textArea);

        _toggleGroup = new ToggleGroup();
		_setupResponseView();
	}

	private function _setupResponseView():Void {
        var vLayout:VerticalLayout = new VerticalLayout();
		this._responseView = new ScrollContainer();
        this._responseView.layout = vLayout;
		this._responseView.height = 128;
		this.addChild(_responseView);
	}

        override function set_width(value:Float):Float {
            		this._textArea.width = value;
		this._header.width = value;
		this._responseView.width = value;

               return this.width;
        }

	
}
