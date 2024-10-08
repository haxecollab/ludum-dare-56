package game.hud;

import openfl.events.Event;
import feathers.skins.RectangleSkin;
import feathers.controls.LayoutGroup;
import feathers.controls.Button;
import openfl.text.Font;
import feathers.text.TextFormat;
import feathers.controls.TextArea;
import feathers.controls.Header;
import openfl.Assets;

class DialogueView extends LayoutGroup{

    private var _header:Header;
    private var _textArea:TextArea;
    private var _font:Font;
    public function new(){
        super();

        _font = Assets.getFont("assets/fonts/PixelOperator-Bold.ttf");
        _header = new Header("lorem");
        _header.width = 500;
        _header.textFormat = new TextFormat(_font.fontName, 18, 0x0);
        addChild(_header);
        _header.validateNow();

        _textArea = new TextArea("lorem");
        _textArea.width = 450;
        _textArea.height = 128;
        _textArea.selectable = false;
        _textArea.textFormat = new TextFormat(_font.fontName, 16, 0x0);
        _textArea.y = _header.height + 32;
        _textArea.editable = false;
        _textArea.x = 25;

        addChild(_textArea);
        _textArea.validateNow();

        var button:Button = new Button("Close", _onButtonClicked);
        button.textFormat = new TextFormat(_font.fontName, 14, 0x0);
        button.validateNow();
        button.x = _textArea.width - button.width + 22;
        button.y = _textArea.height + _textArea.y + 12;
        addChild(button);
        this.backgroundSkin = new RectangleSkin(SolidColor(0x1a1c2c, 0.6));
        this.validateNow();
        this.height += 16;
    }

    public function setHeaderText(text:String):Void{
        _header.text = text;
    }
    public function setBodyText(text:String):Void{
        _textArea.text = text;
    }

    private function _onButtonClicked(e:Event):Void{
        this.parent.removeChild(this);
    }

}