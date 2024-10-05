package objects;

class Player extends FlxSprite {
    static inline final SPEED = 100;
    public var canMove:Bool = true;

    public function new() {
        super();
        makeGraphic(50, 50);
    }

    override function update(elapsed:Float) {
        var velX:Float = 0;
        var velY:Float = 0;

        if (canMove) {
            if (FlxG.keys.pressed.LEFT)
                velX -= SPEED;
            if (FlxG.keys.pressed.RIGHT)
                velX += SPEED;
    
            if (FlxG.keys.pressed.UP)
                velY -= SPEED;
            if (FlxG.keys.pressed.DOWN)
                velY += SPEED;
        }

        velocity.set(velX, velY);
        super.update(elapsed);
    }
}