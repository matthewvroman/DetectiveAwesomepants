package com.ld48.screens 
{
	import com.ld48.GameScreen;
	import com.ld48.ScreenManager;
	import com.ld48.Suspect;
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	/**
	 * ...
	 * @author Matt
	 */
	public class LineupScreen extends GameScreen 
	{
		private var _suspects:Vector.<Suspect>;
		private var _suspectContainers:Vector.<MovieClip>;
		public var suspect1:MovieClip;
		public var suspect2:MovieClip;
		public var suspect3:MovieClip;
		
		public function LineupScreen(suspects:Vector.<Suspect>) 
		{
			super();
			_suspects = suspects;
			_suspectContainers = new Vector.<MovieClip>();
			_suspectContainers.push(suspect1,suspect2,suspect3);
		}
		
		override public function init():void
		{
			super.init();
			for(var i:int = 0; i<_suspects.length; i++)
			{
				_suspectContainers[i].character.gotoAndStop(_suspects[i].characterName);
				//_suspectContainers[i].textField.text = _suspects[i].characterName;
			}
			
			addButton(suspect1);
			addButton(suspect2);
			addButton(suspect3);
		}
		
		override public function onButtonClicked(buttonName:String):void
		{
			super.onButtonClicked(buttonName);
			
			var selected:int = -1;
			
			switch(buttonName)
			{
				case "suspect1":
					selected = 0;
					break;
				case "suspect2":
					selected = 1;
					break;
				case "suspect3":
					selected = 2;
					break;
			}
			
			if(selected!=-1)
			{
				if(_suspects[selected].guilty)
				{
					onSelectedCorrectSuspect(_suspects[selected].characterName);
				}
				else
				{
					onSelectedWrongSuspect();
				}
			}
		}
		
		private function onSelectedCorrectSuspect(culprit:String):void
		{
			trace("Correct!");
			ScreenManager.instance.gotoScreen(new CrimeSolvedScreen(culprit), true);
		}
		
		private function onSelectedWrongSuspect():void
		{
			trace("Wrong");
			ScreenManager.instance.gotoScreen(new CrimeFailedScreen(), true);
		}
		
		override public function destroy():void
		{
			super.destroy();
			
			
		}
		
	}

}