package game.asset;

@:build(game._internal.macros.AssetMacro.build("AudioData"))
enum abstract AudioData(String) from String to String {}