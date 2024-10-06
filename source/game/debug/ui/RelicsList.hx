package game.debug.ui;

import feathers.controls.Header;
import feathers.layout.VerticalLayout;
import feathers.controls.LayoutGroup;
import feathers.controls.Label;
import feathers.layout.HorizontalLayout;
import feathers.controls.dataRenderers.LayoutGroupItemRenderer;
import feathers.data.ArrayCollection;
import feathers.controls.ListView;

//Probably just create a base class headerlist since we have duplicate features here
class RelicsList extends LayoutGroup{
    private var _listView:ListView;
    private var _header:Header;

    public function new(){
        super();       
        setup();
    }

    public function setData(data:Array<String>){
        this._listView.dataProvider = new ArrayCollection(data);
    }

    private function setup():Void{
        var vLayout:VerticalLayout = new VerticalLayout();
        this.layout = vLayout;

        this._header = new Header("Relics");
        this._header.width = 212;
        this.addChild(this._header);

        this._listView = new ListView();
       // this._listView.itemRendererRecycler = DisplayObjectRecycler.withFunction(_renderItem);
        this._listView.width = this._header.width;
        this._listView.height = 212;
        addChild(this._listView);
    }

    private function _renderITem():LayoutGroupItemRenderer{
        var itemRenderer = new LayoutGroupItemRenderer();

        var layout = new HorizontalLayout(); 
        layout.gap = 6.0;
        layout.paddingTop = 4.0;
        layout.paddingBottom = 4.0;
        layout.paddingLeft = 6.0;
        layout.paddingRight = 6.0;
        itemRenderer.layout = layout;
    
        /* var icon = new AssetLoader();
        icon.name = "loader";
        itemRenderer.addChild(icon); */
    
        var label = new Label();
        label.name = "label";
        itemRenderer.addChild(label);
    
        return itemRenderer;
    }


}