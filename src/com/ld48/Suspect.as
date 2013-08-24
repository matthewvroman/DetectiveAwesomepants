package com.ld48
{
	import flash.display.MovieClip;
	
	public class Suspect
	{
		private var _characterName:String;
		private var _guilty:Boolean;
		
		public function Suspect(name:String, guilty:Boolean=false)
		{
			_characterName = name;
			_guilty=guilty;
		}

		public function get characterName():String
		{
			return _characterName;
		}
		
		public function get guilty():Boolean 
		{
			return _guilty;
		}
	}
}