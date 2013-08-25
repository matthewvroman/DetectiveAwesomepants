package com.ld48.screens
{
	import com.ld48.GameManager;
	import com.ld48.GameScreen;
	import com.ld48.ScreenManager;
	
	import flash.display.MovieClip;
	import flash.text.TextField;
	
	public class CrimeSolvedScreen extends GameScreen
	{
		public var textField:TextField;
		public var character:MovieClip;
		public var nextButton:MovieClip;
		
		private var _culprit:String;
		
		private var currentStoryString:String = "";
		private var currentStoryLineChar:int = 0;
		
		
		private var TIME_BETWEEN_CHARACTERS:Number = 0.025;
		private var _timeUntilNextChar:Number=0;
		
		private var TIME_BETWEEN_AUTO_ADVANCE:Number = 5;
		private var _timeUntilAutoAdvance:Number=0;
		private var _autoAdvanceCountdownTriggered:Boolean=false;
		
		public function CrimeSolvedScreen(culprit:String)
		{
			_culprit = culprit;
			
			super();
			
			character.gotoAndStop(_culprit);
			
			addButton(nextButton);
		}
		
		override public function initTextFields(_strings:XML):void
		{
			super.initTextFields(_strings);
			
			currentStoryString = _strings["CONFESSION_"+_culprit.toUpperCase()][0];
			
			nextButton.textField.text = "..";
			
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
			else
			{
				nextButton.textField.text = Main.strings["CONFESSION_REPLY_"+_culprit.toUpperCase()][0];
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
						onButtonClicked("nextButton");
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
					if(currentStoryLineChar < currentStoryString.length)
					{
						currentStoryLineChar = currentStoryString.length-1;
					}
					else
					{
						if(GameManager.instance.numCrimesLeft>0)
							GameManager.instance.startRandomInvestigation();
						else
							ScreenManager.instance.gotoScreen(new GameCompleteScreen(),true);
					}
					break;
			}
		}
	}
}