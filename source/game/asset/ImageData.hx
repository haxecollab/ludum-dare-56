package game.asset;

@:build(game._internal.macros.AssetMacro.build("ImageData"))
enum abstract ImageData(String) from String to String {}