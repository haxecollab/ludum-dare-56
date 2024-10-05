package objects;

import flixel.FlxObject;

class Camera extends FlxCamera {
    /**
     * Zoom this camera should lerp to.
     */
    public var exceptedZoom(default, set):Float = 1;

    /**
     * Controls the intensity of the mouse drift effect.
     */
    public var driftSensitivity:Float = 1;

    /**
     * Determines whether the player can control the camera.
     */
    public var inputsEnabled:Bool = true;

    /**
     * Stores the last tween executed by `zoomTo`.
     */
    var _zoomTween:FlxTween;

    /**
     * Sets the bounding limits of the camera scroll.
     * @param x Horizontal limit start in world-space.
     * @param y Vertical limit start in world-space.
     * @param width Width of the bounding rectangle.
     * @param height Height of the bounding rectangle.
     */
    public function setBoundary(x:Float, y:Float, width:Float, height:Float):Void {
        minScrollX = x;
        minScrollY = y;
        maxScrollX = x + width;
        maxScrollY = y + height;
    }

    public function zoomInTo(id:String, value:Float):Void {} // TODO: zoom to event

    /**
     * Zooms to a specific point in world-space.
     * @param x `X`-axis position in world-space.
     * @param y `Y`-axis position in world-space.
     * @param zoom New zoom.
     */
    public function zoomTo(x:Float, y:Float, zoom:Float):Void {
        var ox:Float = scroll.x;
        var oy:Float = scroll.y;
        var oz:Float = this.zoom;

        this.target = null;
        inputsEnabled = false;

        if (_zoomTween != null)
            _zoomTween.cancel();

        _zoomTween = FlxTween.num(0, 1, 0.5, {ease: FlxEase.sineOut, onComplete: (_) -> _zoomTween = null}, (v:Float) -> {
            this.zoom = exceptedZoom = FlxMath.lerp(oz, zoom, v);
            this.scroll.x = FlxMath.lerp(ox, x - width * 0.5, v);
            this.scroll.y = FlxMath.lerp(oy, y - height * 0.5, v);
        });
    }

    /**
     * Follows an object's position.
     * @param object Object to follow.
     * @param inputsEnabled Whether the player can control the camera.
     */
    public function followEntity(object:FlxObject, inputsEnabled:Bool = true):Void {
        this.inputsEnabled = inputsEnabled;
        follow(object, LOCKON);
    }

    /**
     * Displays the macro view.
     */
    public function showAll():Void {
        FlxG.state.openSubState(new MacroView());
        inputsEnabled = false;
    }

    /**
     * Update behaviour.
     * @param elapsed Delta time.
     */
    override function update(elapsed:Float) {
        if (inputsEnabled) {
            handleInputs(elapsed);
            handleDrift();
        }

        if (zoom != exceptedZoom) {
            // smooth out zoom velocity
            zoom = FlxMath.lerp(exceptedZoom, zoom, Math.exp(-elapsed * 9));
        }

        super.update(elapsed);   
    }

    /**
     * Smaller modified version of the original `updateFollow` which introduces a framerate-independant behaviour.
     */
    override function updateFollow():Void {
        var panSpeed:Float = 0.15 / Math.pow(zoom, 2);

        target.getMidpoint(_point);
        _point.addPoint(targetOffset);
        _scrollTarget.set(_point.x - width * 0.5, _point.y - height * 0.5);

        if (panSpeed >= 1)
            scroll.copyFrom(_scrollTarget);
        else {
            var lerpFactor:Float = Math.exp(-FlxG.elapsed * 60 * panSpeed);
            scroll.x = FlxMath.lerp(_scrollTarget.x, scroll.x, lerpFactor);
            scroll.y = FlxMath.lerp(_scrollTarget.y, scroll.y, lerpFactor);
        }
    }

    /**
     * Controls player inputs.
     * @param elapsed Delta time.
     */
    function handleInputs(elapsed:Float):Void {
        var zoomVelocity:Float = elapsed * exceptedZoom * 0.5;

        if (FlxG.keys.pressed.SHIFT)
            zoomVelocity *= 2;

        if (FlxG.mouse.wheel != 0)
            exceptedZoom += zoomVelocity #if html5 / 10 #else * 10 #end * FlxG.mouse.wheel;

        // multiply by zoom to make the effect consistent
        if (FlxG.keys.justPressed.Z)
            exceptedZoom += (.25 * exceptedZoom);
        if (FlxG.keys.justPressed.E)
            exceptedZoom -= (.25 * exceptedZoom);

        if (FlxG.keys.justPressed.ESCAPE)
            showAll();
    }

    /**
     * Handles panning drift.
     */
    function handleDrift():Void {
        var offsetX:Float = 0;
        var offsetY:Float = 0;
        var driftRegion:Float = 75 * driftSensitivity;
        var mouseX:Float = FlxMath.bound(FlxG.game.mouseX, 0, FlxG.width);
        var mouseY:Float = FlxMath.bound(FlxG.game.mouseY, 0, FlxG.height);

        if (!FlxMath.inBounds(mouseX, driftRegion, width - driftRegion))
            offsetX = FlxMath.signOf(mouseX - driftRegion - 1);

        if (!FlxMath.inBounds(mouseY, driftRegion, height - driftRegion))
            offsetY = FlxMath.signOf(mouseY - driftRegion - 1);

        targetOffset.x = 10 * zoom * offsetX;
        targetOffset.y = 10 * zoom * offsetY;
    }

    function set_exceptedZoom(v:Float):Float {
        return exceptedZoom = FlxMath.bound(v, 0.3, 2);
    }
}
