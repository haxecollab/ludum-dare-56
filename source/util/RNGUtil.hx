package util;

import game.asset.INames;
import game.asset.AssetManager;
import openfl.utils.Object;

class RNGUtil {
	public static function generateRandomName(clanId:String):String {
		var names:Object = AssetManager.getData(NAMES).names;
		var clanAffixes:Array<String> = names.clan_affixes[clanId];

		var prefixes:Array<String> = names["prefixes"];
		var suffixes:Array<String> = names["suffixes"];

		var prefix = prefixes[Std.random(prefixes.length)];
		var suffix = suffixes[Std.random(suffixes.length)];
		var clanAffix = clanAffixes[Std.random(clanAffixes.length)];

		return prefix + suffix + " " + clanAffix;
	}

	// public static function generateBehavior(npc:NPC):NPCBehavior {
	// 	var weights:Array<Float> = [
	// 	/*NPCBehavior.MOVE => */        20 + (0.5 * morale),
	// 	/*NPCBehavior.EVENT_ACTION => */10 + (0.3 * resources),
	// 	/*NPCBehavior.DEATH => */       25 + (0.4 * illness),
	// 	/*NPCBehavior.PROCREATE => */   15 + (0.5 * morale) + (0.4 * resources),
	// 	/*NPCBehavior.IDLE => */        25 + (0.3 * illness) + (0.3 * productivity)
	// 	];

	// 	var totalWeight:Float = 0;
	// 	for (weight in weights) {
	// 		totalWeight += weight;
	// 	}

	// 	// Generate a random number between 0 and totalWeight.
	// 	var randomValue:Float = Math.random() * totalWeight;

	// 	// Use the random number to determine the selected behavior.
	// 	var cumulativeWeight:Float = 0;
	// 	for (behavior in weights.keys()) {
	// 		cumulativeWeight += weights[behavior];
	// 		if (randomValue <= cumulativeWeight) {
	// 			return behavior;
	// 		}
	// 	}

	// 	// Fallback (though logically should never happen if weights are calculated properly)
	// 	return NPCBehavior.IDLE;
	// }
}

