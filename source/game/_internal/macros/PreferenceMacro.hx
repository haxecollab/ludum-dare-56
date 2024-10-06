package game._internal.macros;

#if macro
import haxe.macro.Context;
import haxe.macro.Expr;

class PreferenceMacro {
    public static function build():Array<Field> {
        var fields:Array<Field> = Context.getBuildFields();
        var saveExpr:Array<Expr> = [];
        var loadExpr:Array<Expr> = [];

        for (field in fields) {
            if (excludeField(field))
                continue;

            var fieldName:String = field.name;
            saveExpr.push(macro FlxG.save.data.$fieldName = $i{fieldName});
            loadExpr.push(macro {
                if (FlxG.save.data.$fieldName != null)
                    $i{fieldName} = FlxG.save.data.$fieldName;
            });
        }

        if (saveExpr.length > 0) {
            saveExpr.push(macro FlxG.save.flush());
            fields.push({
                name: "save",
                pos: Context.currentPos(),
                doc: "Saves each preferences to the save file.",
                access: [APublic, AStatic],
                kind: FFun({
                    expr: macro $b{saveExpr},
                    args: []
                })
            });
        }
        if (loadExpr.length > 0) {
            fields.push({
                name: "load",
                pos: Context.currentPos(),
                doc: "Loads preferences from the save file.",
                access: [APublic, AStatic],
                kind: FFun({
                    expr: macro $b{loadExpr},
                    args: []
                })
            });
        }

        return fields;
    }

    static function excludeField(field:Field):Bool {
        for (meta in field.meta)
            if (meta.name == ":ignore")
                return true;

        return false;
    }
}
#end
