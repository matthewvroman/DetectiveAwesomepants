package com.ld48
{
	import flash.display.MovieClip;
	import flash.utils.getDefinitionByName;

	public class Helper
	{
		public function Helper()
		{
		}
		
		public static function cloneMovieClip(movieClip:MovieClip):MovieClip
		{
			var mcClass:Class = movieClip.constructor;
			return new mcClass();
		}
		
		public static function getMovieClipFromLibrary(className:String):MovieClip
		{
			var classObj:Class = getDefinitionByName(className) as Class;
			return new classObj() as MovieClip;
		}

	}
}