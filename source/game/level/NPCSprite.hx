package game.level;

import openfl.events.Event;
import openfl.display.Sprite;
import game.asset.ImageData;
import game.asset.AssetManager;
import feathers.controls.Button;
import feathers.layout.VerticalLayout;
import feathers.controls.LayoutGroup;
import openfl.display.Bitmap;
import openfl.display.BitmapData;

class NPCSprite extends Sprite {
	public var bmp:Bitmap;
	public var spriteGroup:LayoutGroup;
	var button:Button;
	public function new(bitmapData:BitmapData) {
		super();
		var vLayout:VerticalLayout = new VerticalLayout();
		spriteGroup = new LayoutGroup();
		spriteGroup.layout = vLayout;
		spriteGroup.x = -16;
		spriteGroup.y = -32;
		addChild(spriteGroup);

		
			button = new Button(null, _onButtonPressed);
			button.useHandCursor = true;
			button.width = 24;
			button.height = 24;
			button.icon = new Bitmap(AssetManager.getImage(ImageData.DIALOGUE_ICON));
			button.visible = Std.random(2) == 0;
			spriteGroup.addChild(button);
		

		bmp = new Bitmap(bitmapData);
		spriteGroup.addChild(bmp);
	}

	private function _onButtonPressed(e):Void{
		dispatchEvent(new Event("button_press"));
	}
	public function showButton():Void{
		button.visible = !button.visible;
	}
}
