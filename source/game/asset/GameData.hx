package game.asset;

@:build(game._internal.macros.AssetMacro.build("GameData"))
enum abstract GameData(String) from String to String {}