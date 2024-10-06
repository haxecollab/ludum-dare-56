package util;

import game.asset.INames;
import game.asset.AssetManager;
import openfl.utils.Object;

class RNGUtil{
    public static function generateRandomName(clanId:String):String{
        var names:Object = AssetManager.getData(NAMES).names;
        var clanAffixes:Array<String> = names.clan_affixes[clanId];
        
        var prefixes:Array<String> = names["prefixes"];
        var suffixes:Array<String> = names["suffixes"];

        var prefix = prefixes[Std.random(prefixes.length)];
        var suffix = suffixes[Std.random(suffixes.length)];
        var clanAffix = clanAffixes[Std.random(clanAffixes.length)];

        return prefix + suffix + " " + clanAffix;

    }
}