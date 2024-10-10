package ui;

import game.settings.Global;
import haxe.ui.events.MouseEvent;
import flixel.util.FlxSave;

@:xml('
<hbox horizontalAlign="center">
    <button id="slot" text="Slot"/>
    <button id="delete" icon="assets/images/delete-bin.png"/>

	<style>
		#delete {
            width: 32px;
			height: 24px;
			color: #f4f4f4;
			border: $normal-border-size solid #27070d;
			background: #d24b64 #b13e53 vertical;
		}

		#delete:hover {
			border: $normal-border-size solid #3c0f18;
			background: #bf435a #953345 vertical;
		}

		#delete:down {
			border: $normal-border-size solid #3c0f18;
			background: #ab3b50 #862d3d;
		}
	</style>
</hbox>
')
class SaveButton extends haxe.ui.containers.HBox {
    public var saveId(default, set):Int;
    public var save:FlxSave;
    
    function set_saveId(v:Int):Int {
        save = new FlxSave();
        save.bind("game" + v);

        if (save.status.match(BOUND(_, _))) {
            // i have fear of dynamic typing lol
            if (Reflect.hasField(save.data, "started")) {
                slot.text = "Continue Game " + v;
            }
            else {
                slot.text = "Start Game " + v;
                delete.disabled = true;
            }
        }
        else {
            // shouldn't happen but just in case
            slot.text = "ERROR";
            slot.disabled = true;
            delete.disabled = true;
        }

        return saveId = v;
    }

    @:bind(slot, MouseEvent.MOUSE_DOWN)
    function onSlot(_) {
        save.data.started = true;
        save.flush();
        
        Global.currentSave = this.save;
        FlxG.switchState(() -> new PlayState());
    }

    @:bind(delete, MouseEvent.MOUSE_DOWN)
    function onDelete(_) {
        // TODO: open DeletionScreen instead of directly deleting the save file
        // TODO: make sure file gets re-created if an erased slot is selected
        slot.text = "Start Game " + saveId;
        delete.disabled = true;
        save.erase();
        save.flush();
    }
}
