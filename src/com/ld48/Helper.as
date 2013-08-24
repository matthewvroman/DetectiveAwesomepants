package com.ld48
{
	import flash.display.MovieClip;

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

	}
}