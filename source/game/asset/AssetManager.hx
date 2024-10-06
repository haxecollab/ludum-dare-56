package game.asset;
import haxe.Json;
import haxe.ds.StringMap;
import openfl.Assets;

class AssetManager {
    private static var _assetManifest:AssetManifest;

	public function new() {}

	public static function init() {
		var rawAssetManfiest:String = Assets.getText("manifest.json");
		//_spritesheetMap = new StringMap();
		_assetManifest = Json.parse(rawAssetManfiest);

		for (data in _assetManifest.gameData) {
			var dat:String = Assets.getText(data.data);
			
            trace(dat);
		}
	}

	/* public static function getSpritesheet(sheet:Spritesheets):TextureAtlas {
		return _spritesheetMap.get(sheet);
	} */

}

@:noCompletion private interface AssetManifest {
	public var gameData:Array<IGameData>;
}

@:noCompletion private interface IGameData {
	public var data:String;
	public var id:String;
}
    
