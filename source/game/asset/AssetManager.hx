package game.asset;

import openfl.utils.Object;
import haxe.Json;
import haxe.ds.StringMap;
import openfl.Assets;

class AssetManager {
	private static var _assetManifest:AssetManifest;
	private static var _dataMap:StringMap<Object>;

	public function new() {}

	public static function init() {
		_dataMap = new StringMap();

		var rawAssetManfiest:String = Assets.getText("manifest.json");
		_assetManifest = Json.parse(rawAssetManfiest);

		for (data in _assetManifest.gameData) {
			var dat:Object = Json.parse(Assets.getText(data.data));

			_dataMap.set(data.id, dat);
		}
	}

	public static  function getData(data:GameData):Object {
		return _dataMap.get(data);
	}
}

@:noCompletion private interface AssetManifest {
	public var gameData:Array<IGameData>;
}

@:noCompletion private interface IGameData {
	public var data:String;
	public var id:String;
}
