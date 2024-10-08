package game.enums;

enum abstract NPCBehavior(Int) from Int to Int {
	public var MOVE = 0;
	public var EVENT_ACTION = 1;
	public var DEATH = 2;
	public var PROCREATE = 3;
	public var IDLE = 4;

	@:to
	public inline function toString():String {
		var ret:String = switch (this) {
			case MOVE:
				"MOVE";
			case EVENT_ACTION:
				"EVENT_ACTION";
			case DEATH:
				"DEATH";
			case PROCREATE:
				"PROCREATE";
			case IDLE:
				"IDLE";
			default:
				"UNKNOWN";
		}

		return ret;
	}

    @:from
	public static function fromString(value:String):NPCBehavior {
		switch (value.toUpperCase()) {
			case "MOVE":
				return MOVE;
			case "EVENT_ACTION":
				return EVENT_ACTION;
			case "DEATH":
				return DEATH;
			case "PROCREATE":
				return PROCREATE;
			case "IDLE":
				return IDLE;
			default:
				throw "Invalid NPCBehavior string: " + value;
		}
	}
}
