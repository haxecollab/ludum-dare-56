package game.asset;

import sound.SoundManager;
import sound.SoundAsset;
import sound.SoundCollection;
import sound.SoundObject;
import openfl.media.Sound;
import openfl.display.BitmapData;
import openfl.utils.Object;
import haxe.Json;
import haxe.ds.StringMap;
import openfl.Assets;

class AssetManager {
	private static var _assetManifest:AssetManifest;
	private static var _dataMap:StringMap<Object>;
	private static var _imageDataMap:StringMap<BitmapData>;
	private static var _audioDataMap:StringMap<Sound>;

	public function new() {}

	public static function init() {
		SoundManager.init();
		_dataMap = new StringMap();
		_imageDataMap = new StringMap();
		_audioDataMap = new StringMap();

		var rawAssetManfiest:String = Assets.getText("manifest.json");
		_assetManifest = Json.parse(rawAssetManfiest);

		for (data in _assetManifest.gameData) {
			var dat:Object = Json.parse(Assets.getText(data.data));

			_dataMap.set(data.id, dat);
		}

		for (data in _assetManifest.imageData){
			var img:BitmapData = Assets.getBitmapData(data.data);
			_imageDataMap.set(data.id, img);
		}
		
		var soundCollection:SoundCollection = new SoundCollection();
		for (data in _assetManifest.audioData){
			soundCollection.add(new SoundAsset(data.id, data.data));
		}
		SoundManager.soundCollection = soundCollection;
	}

	public static  function getData(data:GameData):Object {
		return _dataMap.get(data);
	}

	public static function getImage(data:ImageData):BitmapData{
		return _imageDataMap.get(data);
	}

	public static function getAudio(data:AudioData):Sound{
		return _audioDataMap.get(data);
	}
}

@:noCompletion private interface AssetManifest {
	public var gameData:Array<IAssetData>;
	public var imageData:Array<IAssetData>;
	public var audioData:Array<IAssetData>;
}

@:noCompletion private interface IAssetData {
	public var data:String;
	public var id:String;
}
