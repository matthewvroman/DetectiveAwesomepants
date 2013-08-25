package com.ld48 
{
	import fl.transitions.Tween;
	import fl.transitions.easing.*;
	
	import flash.display.MovieClip;
	import flash.text.TextField;
	
	/**
	 * ...
	 * @author Matt
	 */
	public class CluePopover extends MovieClip 
	{
		private static var ALPHA_TWEEN_DURATION:Number = 0.15;
		
		public var textField:TextField;
		public var extendedBG:MovieClip;
		
		public function CluePopover() 
		{
			super();
			
		}
		
		public function setText(value:String):void
		{
			textField.text = value;
			
			extendedBG.visible = textField.numLines>1;
		}
		
		public function show():void
		{
			var tween:Tween = new Tween(this, "alpha", None.easeNone, this.alpha, 1.0, ALPHA_TWEEN_DURATION,true);
		}
		
		public function hide():void
		{
			var tween:Tween = new Tween(this, "alpha", None.easeNone, this.alpha, 0.0,ALPHA_TWEEN_DURATION,true);
		}
		
	}

}