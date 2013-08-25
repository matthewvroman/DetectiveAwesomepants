package com.ld48.screens 
{
	import com.ld48.GameManager;
	import com.ld48.GameScreen;
	import com.ld48.ScreenManager;
	
	import flash.display.MovieClip;
	import flash.text.TextField;
	
	/**
	 * ...
	 * @author Matt
	 */
	public class GameCompleteScreen extends GameScreen 
	{
		private static var NUM_STORY_LINES:int = 3;
		private var currentStoryString:String = "";
		private var currentStoryLine:int = 0;
		private var currentStoryLineChar:int = 0;
		public var nextButton:MovieClip;
		
		public var textField:TextField;
		
		private var TIME_BETWEEN_CHARACTERS:Number = 0.025;
		private var _timeUntilNextChar:Number;
		
		private var TIME_BETWEEN_AUTO_ADVANCE:Number = 5;
		private var _timeUntilAutoAdvance:Number=0;
		private var _autoAdvanceCountdownTriggered:Boolean=false;
		
		public function GameCompleteScreen() 
		{
			super();
		}
		
		override public function init():void
		{
			super.init();
			
			addButton(nextButton);
			
			updateStory();
		}
		
		private function updateStory():void
		{
			currentStoryLine++;
			
			if(currentStoryLine>NUM_STORY_LINES)
			{
				onStoryFinished();
				return;
			}
			
			currentStoryLineChar = 0;
			currentStoryString = Main.strings["GAME_COMPLETE_"+currentStoryLine][0];
			
			nextButton.textField.text = "..";
			
			_autoAdvanceCountdownTriggered=false;
			
			_timeUntilNextChar=TIME_BETWEEN_CHARACTERS;
		}
		
		override public function update():void
		{
			super.update();
			
			if(currentStoryLineChar < currentStoryString.length)
			{
				_timeUntilNextChar-=Main.deltaTime;
				if(_timeUntilNextChar<=0)
				{
					_timeUntilNextChar = TIME_BETWEEN_CHARACTERS;
					currentStoryLineChar++;
					textField.text = currentStoryString.substr(0,currentStoryLineChar);
				}
			}
			else if(currentStoryLine<=NUM_STORY_LINES)
			{
				nextButton.textField.text = Main.strings["GAME_COMPLETE_ANSWER_"+currentStoryLine][0];
				if(_autoAdvanceCountdownTriggered==false)
				{
					_timeUntilAutoAdvance=TIME_BETWEEN_AUTO_ADVANCE;
					_autoAdvanceCountdownTriggered=true;
				}
				
				if(_autoAdvanceCountdownTriggered)
				{
					_timeUntilAutoAdvance-=Main.deltaTime;
					if(_timeUntilAutoAdvance<=0)
					{
						updateStory();
						_autoAdvanceCountdownTriggered=false;
					}
				}
				
			}
			
		}
		
		override public function onButtonClicked(buttonName:String):void
		{
			super.onButtonClicked(buttonName);
			
			switch(buttonName)
			{
				case "nextButton":
				{
					if(currentStoryLineChar < currentStoryString.length)
					{
						currentStoryLineChar = currentStoryString.length-1;
					}
					else
					{
						updateStory();
					}
					break;
				}
			}
		}
		
		public function onStoryFinished():void
		{
			ScreenManager.instance.gotoScreen(new PayoffScreen(),true);
		}
		
	}

}