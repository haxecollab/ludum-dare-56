package objects;

inline final ENTITY_SIZE = 10;

class MacroView extends FlxSubState {
    var _camera:FlxCamera;
    
    override function create() {
        super.create();

        _camera = new FlxCamera();
        FlxG.cameras.add(_camera, false);
        this.cameras = [_camera];

        // TODO: keep track of locations, objectives...
        for (member in _parentState.members) {
            if (member is FlxSprite)
                add(new ObjectTracker(cast member));
        }
    }

    override function update(elapsed:Float) {
        super.update(elapsed);

        if (FlxG.keys.justPressed.ESCAPE)
            this.close();
    }

    override function close() {
        // make sure inputs doesn't interfer
        FlxG.signals.postUpdate.addOnce(() -> PlayState.self.gameCamera.inputsEnabled = true);
        FlxG.cameras.remove(_camera);
        super.close();
    }
}

private class ObjectTracker extends FlxSprite {
    var _parent:FlxSprite;

    public function new(parent:FlxSprite) {
        this._parent = parent;
        super();

        // TODO: maybe load an icon dedied to the entity instead
        loadGraphic(_parent.graphic);
        setGraphicSize(width / ENTITY_SIZE, height / ENTITY_SIZE);
        updateHitbox();
    }

    override function update(elapsed:Float) {
        this.x = _parent.x / ENTITY_SIZE;
        this.y = _parent.y / ENTITY_SIZE;
    }

    override function destroy():Void {
        _parent = null;
        super.destroy();
    }
}
