package game.debug.ui;

import game.object.Game;
import game.state.StateManager;
import game.asset.ImageData;
import openfl.display.Bitmap;
import feathers.controls.Button;
import feathers.data.ListViewItemState;
import feathers.controls.dataRenderers.ItemRenderer;
import haxe.Json;
import util.DataUtil;
import game.asset.AssetManager;
import feathers.controls.Header;
import feathers.layout.VerticalLayout;
import feathers.controls.LayoutGroup;
import openfl.Lib;
import feathers.controls.Label;
import feathers.layout.HorizontalLayout;
import feathers.controls.dataRenderers.LayoutGroupItemRenderer;
import feathers.utils.DisplayObjectRecycler;
import feathers.data.ArrayCollection;
import game.object.NPC;
import feathers.controls.ListView;

class NPCList extends LayoutGroup {
	private var _listView:ListView;
	private var _header:Header;
	private var _id:String;

	public function new(id:String) {
		super();

		this._id = id;
		setup();
	}

	public function setData(data:Array<NPC>) {
		this._listView.dataProvider = new ArrayCollection(data);
        validateHeaderData();
	}

    public function validateHeaderData():Void{
        var clanData:Dynamic = AssetManager.getData(CLANS);
		var object:Dynamic = DataUtil.getObjectByID(this._id, clanData.clans);

        var name:String = Std.string(object.name + " NPC");
        if(this._listView.dataProvider != null){
           name += "(" + Std.string(_listView.dataProvider.length) + ")";
        }
        this._header.text = name;
    }

	private function setup():Void {
		var vLayout:VerticalLayout = new VerticalLayout();
		this.layout = vLayout;

		this._header = new Header();
		this._header.width = (Lib.current.stage.stageWidth / 6) - 2;
		addChild(this._header);

		this._listView = new ListView();
		this._listView.itemRendererRecycler = DisplayObjectRecycler.withFunction(_renderNPC);
        this._listView.itemRendererRecycler.update = (itemRenderer:LayoutGroupItemRenderer, state:ListViewItemState) -> {
            var label = cast(itemRenderer.getChildByName("label"), Label);

            label.text = state.data.name;
            //loader.source = state.data.icon;
        };
		this._listView.width = this._header.width;
		this._listView.height = 212;
		

		addChild(this._listView);
	}

	private function _renderNPC():LayoutGroupItemRenderer {
		var itemRenderer = new LayoutGroupItemRenderer();
		 var layout = new HorizontalLayout(); 
				layout.gap = 6.0;
				layout.paddingTop = 4.0;
				layout.paddingBottom = 4.0;
				layout.paddingLeft = 6.0;
				layout.paddingRight = 6.0;
				itemRenderer.layout = layout;

                var button:Button = new Button();
                button.useHandCursor = true;
                button.width = 20;
                button.height = 20;
                button.icon = new Bitmap(AssetManager.getImage(ImageData.DIALOGUE_ICON));
                itemRenderer.addChild(button);

                var label = new Label();
				label.name = "label";
				itemRenderer.addChild(label);
		 
		return itemRenderer;
	}
}
