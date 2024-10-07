package game.level;

import openfl.geom.Rectangle;
import openfl.display.Shape;
import openfl.events.MouseEvent;
import openfl.events.Event;
import game.asset.ImageData;
import game.asset.AssetManager;
import openfl.display.Bitmap;
import openfl.display.Sprite;
import openfl.Lib;

class GameMap extends Sprite {
	var background:Bitmap;
	var zoom:Float = 1.0;
	var camera:Sprite;
	var moveSpeed:Float = 10;
	var debugShape:Shape;

	var fireRect:Rectangle;
	var pebbleRect:Rectangle;
	var iceRect:Rectangle;
	var leafRect:Rectangle;
	var turtleRect:Rectangle;
	var waterRect:Rectangle;

	public var debugView:Bool = #if debug true #else false #end;

	public function new() {
		super();
		camera = new Sprite();
		addChild(camera);

		background = new Bitmap(AssetManager.getImage(ImageData.MAP_BG));
		background.smoothing = true;
		camera.addChild(background);

		#if debug
		debugShape = new Shape();
		camera.addChild(debugShape);
		#end
		addEventListener(Event.ADDED_TO_STAGE, _init);

		drawDebugRectangles();
	}

	private function _init(e:Event):Void {
		removeEventListener(Event.ADDED_TO_STAGE, _init);
		stage.addEventListener(MouseEvent.MOUSE_WHEEL, _onMouseWheel);
		stage.addEventListener(Event.ENTER_FRAME, _onEnterFrame);

		// Center the camera initially
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

	private function drawDebugRectangles():Void {
		var padding:Float = 146.0;
		var rectWidth:Float = background.width / 2;
		var rectHeight:Float = (background.height - 2 * padding) / 3;

		if (debugView) {
			debugShape.graphics.clear();
			debugShape.graphics.lineStyle(8, 0xFF0000, 1);
		}

		for (i in 0...2) {
			for (j in 0...3) {
				var tempRectWidth:Float = rectWidth - 500;

				var x:Float = i * tempRectWidth;
				if (i == 1) {
					x += 1000;
				}
				var y:Float = padding + j * rectHeight + 64;

				if (debugView) {
					debugShape.graphics.drawRect(x, y, tempRectWidth, rectHeight);
				}
				var rect:Rectangle = new Rectangle(x, y, tempRectWidth, rectHeight);
				if (i == 0 && j == 0) {
					fireRect = rect;
				} else if (i == 1 && j == 0) {
					pebbleRect = rect;
				} else if (i == 0 && j == 1) {
					iceRect = rect;
				} else if (i == 1 && j == 1) {
					leafRect = rect;
				} else if (i == 0 && j == 2) {
					turtleRect = rect;
				} else if (i == 1 && j == 2) {
					waterRect = rect;
				}
			}
		}
	}
}
