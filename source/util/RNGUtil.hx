package util;

import game.enums.NPCBehavior;
import game.object.NPC;
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

	public static function generateBehavior(morale:Float, resources:Int, illness:Float, productivity:Float):NPCBehavior {
		var weights:Array<Float> = [
		/*NPCBehavior.MOVE => */        70 + (0.5 * morale) + (0.1 * productivity),
		/*NPCBehavior.EVENT_ACTION => */40 + (0.3 * resources) + (0.2 * productivity) + (0.1 * morale),
		/*NPCBehavior.DEATH => */       Math.max(0, 5 + (0.8 * illness) - (0.2 * morale)),
		/*NPCBehavior.PROCREATE => */   5 + (0.5 * morale) + (0.4 * resources),
		/*NPCBehavior.IDLE => */        Math.max(0, 50 + (0.3 * illness) + (0.3 * productivity) - (0.2 * morale))
		];

		var totalWeight:Float = 0.0;
		for (weight in weights) {
			totalWeight += weight;
		}

		var rng:Float = Math.random() * totalWeight;

		var cumulativeWeight:Float = 0.0;
		for (i in 0...weights.length) {
			cumulativeWeight += weights[i];
			if (rng <= cumulativeWeight) {
				return i;
			}
		}

		// Fallback (though logically should never happen if weights are calculated properly)
		return IDLE;
	}
}

