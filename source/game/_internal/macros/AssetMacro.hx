package game._internal.macros;

#if macro
import haxe.Json;
import haxe.macro.Context;
import haxe.macro.Expr;

class AssetMacro {
	macro static public function build(type:String):Array<Field> {
		var json = sys.io.File.getContent("assets/manifest.json");
		var data = Json.parse(json);
		//var spritesheets:Array<Dynamic> = (data : Dynamic).gameData;

		var enumFields = [];
		switch (type) {
			case "GameData":
				buildGameDataEnum(enumFields);
			case "ImageData":
				buildImageDataEnum(enumFields);
		}

		return enumFields;
	}

	static function makeEnumField(name:String, kind:FieldType) {
		return {
			name: name,
			doc: null,
			meta: [],
			access: [],
			kind: kind,
			pos: Context.currentPos()
		}
	}

	static function buildGameDataEnum(fields:Array<Field>) {
		var json = sys.io.File.getContent("assets/manifest.json");
		var data = Json.parse(json);
		var gameData:Array<Dynamic> = (data : Dynamic).gameData;

		for (data in gameData) {
			var id = data.id;
			var fieldName = id.toUpperCase();
			fields.push(makeEnumField(fieldName, FVar(macro :String, macro $v{id})));
		}
	}

	static function buildImageDataEnum(fields:Array<Field>) {
		var json = sys.io.File.getContent("assets/manifest.json");
		var data = Json.parse(json);
		var imageData:Array<Dynamic> = (data : Dynamic).imageData;

		for (data in imageData) {
			var id = data.id;
			var fieldName = id.toUpperCase();
			fields.push(makeEnumField(fieldName, FVar(macro :String, macro $v{id})));
		}
	}
}
#end