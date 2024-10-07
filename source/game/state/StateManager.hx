package game.state;

import openfl.events.EventDispatcher;
import openfl.utils.Object;
import haxe.ds.StringMap;

class StateManager {
	public static inline var SAVED:String = "saved";
	public static inline var LOADED:String = "loaded";
	public static inline var INIT:String = "init";
	public static inline var RESET:String = "reset";

	public static var current(get, never):StateManager;
	private static var _current:StateManager;

	public static inline function init():Void {
		if (_current == null) {
			new StateManager(); // Lazy instantiation
		}
	}

    public var eventDispatcher:EventDispatcher;

	// Private maps to store various types of state data
	private var textMap:StringMap<String>;
	private var valueMap:StringMap<Float>;
	private var numberMap:StringMap<Int>;
	private var objectMap:StringMap<Object>;
	private var arrayMap:StringMap<Array<Any>>;
	private var switchMap:StringMap<Null<Bool>>;

	// Constructor - private to enforce singleton pattern
	private function new() {
		reset();
		_current = this;
	}

	// Getter for the current instance
	private static function get_current():StateManager {
		if (_current == null) {
			new StateManager();
		}
		return _current;
	}

	// Methods to handle text data
	public function setText(key:String, value:String):String {
		textMap.set(key, value);
		return value;
	}

	public function getText(key:String):String {
		return textMap.exists(key) ? textMap.get(key) : null;
	}

	// Methods to handle float data
	public function setValue(key:String, value:Float):Float {
		valueMap.set(key, value);
		return value;
	}

	public function getValue(key:String):Float {
		return valueMap.exists(key) ? valueMap.get(key) : 0.0;
	}

	// Methods to handle integer data
	public function setNumber(key:String, value:Int):Int {
		numberMap.set(key, value);
		return value;
	}

	public function getNumber(key:String):Int {
		return numberMap.exists(key) ? numberMap.get(key) : 0;
	}

	// Methods to handle dynamic data
	public function setObject(key:String, value:Object):Object {
		objectMap.set(key, value);
		return value;
	}

	public function getObject(key:String):Object{
		return objectMap.exists(key) ? objectMap.get(key) : null;
	}

	// Methods to handle array data
	public function setArray(key:String, value:Array<Any>):Array<Any> {
		arrayMap.set(key, value);
		return value;
	}

	public function getArray(key:String):Array<Any> {
		return arrayMap.exists(key) ? arrayMap.get(key) : null;
	}

    // Methods to handle switches
    public function setSwitch(key:String, value:Bool):Void {
		switchMap.set(key, value);
	}

	public function getSwitch(key:String):Null<Bool> {
		return switchMap.exists(key) ? switchMap.get(key) : null;
	}

	// Method to reset all state data
	public function reset():Void {
		textMap = new StringMap();
		valueMap = new StringMap();
		numberMap = new StringMap();
		objectMap = new StringMap();
		arrayMap = new StringMap();
		switchMap = new StringMap();
        
        eventDispatcher = new EventDispatcher();
	}

	// Method to serialize the state to JSON (for saving to a file)
	public function serialize():String {
		var json:String = haxe.Json.stringify({
			textMap: textMap,
			valueMap: valueMap,
			numberMap: numberMap,
			objectMap: objectMap,
			arrayMap: arrayMap,
			switchMap: switchMap
		});
		return json;
	}

	// Method to deserialize the state from JSON (for loading from a file)
	public static function deserialize(json:String):Void {
		var data:Object = haxe.Json.parse(json);
		_current = new StateManager(); // Ensure a new state manager instance
		for (key in data.textMap) {
			current.textMap.set(key, data.textMap[key]);
		}
		for (key in data.valueMap) {
			current.valueMap.set(key, data.valueMap[key]);
		}
		for (key in data.numberMap) {
			current.numberMap.set(key, data.numberMap[key]);
		}
		for (key in data.objectMap) {
			current.objectMap.set(key, data.objectMap[key]);
		}
		for (key in data.objectMap) {
			current.arrayMap.set(key, data.arrayMap[key]);
		}
		for (key in data.switchMap) {
			current.switchMap.set(key, data.switchMap[key]);
		}
	}

	// Utility methods for checking existence
	public function hasText(key:String):Bool {
		return textMap.exists(key);
	}

	public function hasValue(key:String):Bool {
		return valueMap.exists(key);
	}

	public function hasNumber(key:String):Bool {
		return numberMap.exists(key);
	}

	public function hasObject(key:String):Bool {
		return objectMap.exists(key);
	}

	public function hasArray(key:String):Bool {
		return arrayMap.exists(key);
	}

	public function hasSwitch(key:String):Bool {
		return switchMap.exists(key);
	}

	public function keyExists(key:String):Bool {
		if (hasText(key)) {
			return true;
		}
		if (hasValue(key)) {
			return true;
		}
		if (hasNumber(key)) {
			return true;
		}
		if (hasObject(key)) {
			return true;
		}
		if (hasArray(key)) {
			return true;
		}
		if (hasSwitch(key)) {
			return true;
		}
		return false;
	}
}
