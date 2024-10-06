package game.debug.ui;

import feathers.controls.Header;
import feathers.layout.VerticalLayout;
import feathers.controls.TextArea;
import feathers.controls.LayoutGroup;

class LogView extends LayoutGroup {
	private var _textArea:TextArea;
	private var _header:Header;

	public function new() {
		super();
		setup();
	}

    public function setLog(logs:Array<String>){
        this.clear();
        for(log in logs){
            _textArea.text += log + "\n";
        }
    }

    public function clear():Void{
        _textArea.text = "";
    }

    private function setup():Void {
		var vLayout:VerticalLayout = new VerticalLayout();
		this.layout = vLayout;

		this._header = new Header("Log");
        this._header.width = 212;
		this.addChild(_header);

		this._textArea = new TextArea();
        this._textArea.wordWrap = false;
		this._textArea.height = 256;
        this._textArea.width = 212;
		this._textArea.editable = false;
		this.addChild(_textArea);
    }
}