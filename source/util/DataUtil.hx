package util;

import openfl.utils.Object;

class DataUtil {
	public static function getObjectByID(id:String, collection:Array<Object>):Object {
		for (item in collection) {
			if (item.id == id) {
				return item;
			}						
		}
        return null;	
	}
}
