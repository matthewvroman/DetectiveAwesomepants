package com.ld48 
{
	import fl.transitions.Tween;
	import fl.transitions.TweenEvent;
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
		
		private var tween:Tween;
		
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
			cleanupOldTween();
			
			tween = new Tween(this, "alpha", None.easeNone, this.alpha, 1.0, ALPHA_TWEEN_DURATION,true);
			tween.addEventListener(TweenEvent.MOTION_FINISH,onMotionFinish);
		}
		
		public function hide():void
		{
			cleanupOldTween();
			
			tween = new Tween(this, "alpha", None.easeNone, this.alpha, 0.0,ALPHA_TWEEN_DURATION,true);
		}
		
		private function cleanupOldTween():void
		{
			if(!tween) return;
			
			if(tween.hasEventListener(TweenEvent.MOTION_FINISH))
			{
				tween.removeEventListener(TweenEvent.MOTION_FINISH,onMotionFinish);
			}
			
			tween = null;
		}
		
		private function onMotionFinish(e:TweenEvent):void
		{
			SoundManager.instance.playSFX("sfx_hover");
		}
	}

}