package game.level;

import openfl.events.MouseEvent;
import openfl.events.Event;
import game.asset.ImageData;
import game.asset.AssetManager;
import openfl.display.Bitmap;
import openfl.display.Sprite;

class GameMap extends Sprite {
    var background:Bitmap;
    var zoom:Float = 1.0;
    var camera:Sprite;
    var moveSpeed:Float = 10;

    public function new() {
        super();
        camera = new Sprite();
        addChild(camera);

        background = new Bitmap(AssetManager.getImage(ImageData.MAP_BG), null, true);
      
        camera.addChild(background);

        addEventListener(Event.ADDED_TO_STAGE, _init);
    }

    private function _init(e:Event):Void {
        removeEventListener(Event.ADDED_TO_STAGE, _init);
        stage.addEventListener(MouseEvent.MOUSE_WHEEL, _onMouseWheel);
        stage.addEventListener(Event.ENTER_FRAME, _onEnterFrame);

        camera.x = (stage.stageWidth - background.width) / 2;
        camera.y = (stage.stageHeight - background.height) / 2;
    }

    private function _onMouseWheel(e:MouseEvent):Void {
        var zoomIn:Bool = e.delta > 0;
        var oldZoom:Float = zoom;

        if (zoomIn) {
            zoom = Math.min(zoom + 0.1, 2);
        } else {
            zoom = Math.max(zoom - 0.1, Math.min(stage.stageWidth / background.width, stage.stageHeight / background.height));
        }

        updateCamera(oldZoom);
    }

    public function updateCamera(oldZoom:Float):Void {
        var stageCenterX:Float = stage.stageWidth / 2;
        var stageCenterY:Float = stage.stageHeight / 2;

        var localCenterX:Float = (stageCenterX - camera.x) / oldZoom;
        var localCenterY:Float = (stageCenterY - camera.y) / oldZoom;

        camera.scaleX = camera.scaleY = zoom;

        camera.x = stageCenterX - localCenterX * zoom;
        camera.y = stageCenterY - localCenterY * zoom;

        updateCameraBounds();
    }

    private function _onEnterFrame(e:Event):Void {
        var mouseX:Float = stage.mouseX;
        var mouseY:Float = stage.mouseY;

        if (mouseX < 50) {
            camera.x += moveSpeed;
        } else if (mouseX > stage.stageWidth - 50) {
            camera.x -= moveSpeed;
        }

        if (mouseY < 50) {
            camera.y += moveSpeed;
        } else if (mouseY > stage.stageHeight - 50) {
            camera.y -= moveSpeed;
        }

        updateCameraBounds();
    }

    private function updateCameraBounds():Void {
        var maxX:Float = 0;
        var minX:Float = stage.stageWidth - (background.width * zoom);
        var maxY:Float = 0;
        var minY:Float = stage.stageHeight - (background.height * zoom);

        camera.x = Math.max(minX, Math.min(maxX, camera.x));
        camera.y = Math.max(minY, Math.min(maxY, camera.y));
    }
}
