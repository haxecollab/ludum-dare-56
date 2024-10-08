package game.level;

import game.hud.DialogueView;
import openfl.display.BitmapData;
import game.enums.Clan;
import game.state.StateManager;
import game.object.NPC;
import game.event.GameEvent;
import game.object.Game;
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

	var fireContainer:Sprite;
	var pebbleContainer:Sprite;
	var iceContainer:Sprite;
	var leafContainer:Sprite;
	var turtleContainer:Sprite;
	var waterContainer:Sprite;

	public var debugView:Bool = #if debug true #else false #end;

	var game:Game;

	public static function addDialogue(headerText:String, bodyText:String):Void{
		var dialogueView:DialogueView = new DialogueView();
		dialogueView.setHeaderText(headerText);
		dialogueView.setBodyText(bodyText);
		dialogueView.validateNow();
		dialogueView.x = (Lib.current.stage.stageWidth/ 2) - (dialogueView.width/2);
		dialogueView.y = (Lib.current.stage.stageHeight/ 2) - (dialogueView.height/2);
		mapView.addChild(dialogueView);

	}

	public static var mapView:GameMap;

	public function new(game:Game) {
		super();
		mapView = this;
		this.game = game;
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
		_setupNPCs();

	}

	private function _setupNPCs():Void {
		fireContainer = new Sprite();
		fireContainer.x = fireRect.x;
		fireContainer.y = fireRect.y;
		camera.addChild(fireContainer);

		iceContainer = new Sprite();
		iceContainer.x = iceRect.x;
		iceContainer.y = iceRect.y;
		camera.addChild(iceContainer);

		leafContainer = new Sprite();
		leafContainer.x = leafRect.x;
		leafContainer.y = leafRect.y;
		camera.addChild(leafContainer);

		waterContainer = new Sprite();
		waterContainer.x = waterRect.x;
		waterContainer.y = waterRect.y;
		camera.addChild(waterContainer);

		pebbleContainer = new Sprite();
		pebbleContainer.x = pebbleRect.x;
		pebbleContainer.y = pebbleRect.y;
		camera.addChild(pebbleContainer);

		turtleContainer = new Sprite();
		turtleContainer.x = turtleRect.x;
		turtleContainer.y = turtleRect.y;
		camera.addChild(turtleContainer);

		game.eventDispatcher.addEventListener(GameEvent.POPULATION_CHANGE, _onPopulationChange);
	}

	private function _onPopulationChange(e:GameEvent):Void {
		var npcArray:Array<NPC> = cast switch ((e.data : Clan)) {
			case FIRE:
				StateManager.current.getArray(Game.FIRE_NPCS_STATE);
			case ICE:
				StateManager.current.getArray(Game.ICE_NPCS_STATE);
			case LEAF:
				StateManager.current.getArray(Game.LEAF_NPCS_STATE);
			case WATER:
				StateManager.current.getArray(Game.WATER_NPCS_STATE);
			case TURTLE:
				StateManager.current.getArray(Game.TURTLE_NPCS_STATE);
			case PEBBLE:
				StateManager.current.getArray(Game.PEBBLE_NPCS_STATE);
		}
		validateNPCS(npcArray);
	}

	private function validateNPCS(npcs:Array<NPC>):Void {
		for (npc in npcs) {
			npc.sprite = drawNPC(npc.clan);
			npc.listenForButton();
			npc.validateLocation();
		}
	}

	private function drawNPC(clan:Clan):NPCSprite {		

		var bitmapData:BitmapData;
		var sprite:NPCSprite;

		switch (clan) {
			case FIRE:
				bitmapData = AssetManager.getImage(ImageData.FIRE_SPRITE_0);
				sprite = new NPCSprite(bitmapData);
				this.fireContainer.addChild(sprite);
			case ICE:
				bitmapData = AssetManager.getImage(ImageData.ICE_SPRITE_0);
				sprite = new NPCSprite(bitmapData);
				this.iceContainer.addChild(sprite);
			case LEAF:
				bitmapData = AssetManager.getImage(ImageData.LEAF_SPRITE_0);
				sprite = new NPCSprite(bitmapData);
				this.leafContainer.addChild(sprite);
			case WATER:
				bitmapData = AssetManager.getImage(ImageData.WATER_SPRITE_0);
				sprite = new NPCSprite(bitmapData);
				this.waterContainer.addChild(sprite);
			case TURTLE:
				bitmapData = AssetManager.getImage(ImageData.TURTLE_SPRITE_0);
				sprite = new NPCSprite(bitmapData);
				this.turtleContainer.addChild(sprite);
			case PEBBLE:
				bitmapData = AssetManager.getImage(ImageData.PEBBLE_SPRITE_0);
				sprite = new NPCSprite(bitmapData);
				this.pebbleContainer.addChild(sprite);
		}

		return sprite;
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
