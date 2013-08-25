package com.ld48
{
	import fl.transitions.Tween;
	import fl.transitions.TweenEvent;
	import fl.transitions.easing.*;
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	public class CrimeIntroSequence extends MovieClip
	{
		private var _crimeName:String;
		
		public var sequenceBox:MovieClip;
		
		public function CrimeIntroSequence(crimeName:String)
		{
			super();
			
			_crimeName = crimeName;
			
			sequenceBox.crimeTextField.text = _crimeName;
			
			this.mouseChildren = false;
			
			this.addEventListener(MouseEvent.MOUSE_DOWN, onMouseDown);
			this.addEventListener(Event.ENTER_FRAME, onEnterFrame);
		}
		
		private function onEnterFrame(e:Event):void
		{
			if(this.currentFrame == this.totalFrames)
			{
				this.stop();
				this.removeEventListener(Event.ENTER_FRAME, onEnterFrame);
			}
		}
		
		private function onMouseDown(e:MouseEvent):void
		{
			this.removeEventListener(MouseEvent.MOUSE_DOWN, onMouseDown);
			
			var tween:Tween = new Tween(this,"alpha",None.easeNone,this.alpha,0,0.15,true);
			tween.addEventListener(TweenEvent.MOTION_FINISH, onTweenComplete);
			
			SoundManager.instance.playSFX("sfx_click");
		}
		
		private function onTweenComplete(e:TweenEvent):void	
		{
			GameEventDispatcher.dispatchEvent(new GameEvent(GameEvent.CRIME_SCENE_INTRO_END));
		}
	}
}