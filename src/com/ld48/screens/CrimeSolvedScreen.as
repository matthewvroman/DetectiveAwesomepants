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
		
		public function CrimeSolvedScreen(culprit:String)
		{
			super();
			
			_culprit = culprit;
			
			character.gotoAndStop(_culprit);
			
			addButton(nextButton);
		}
		
		override public function initTextFields(_strings:XML):void
		{
			super.initTextFields(_strings);
			
			nextButton.textField.text = "Justice is served!";
			
		}
		
		override public function onButtonClicked(buttonName:String):void
		{
			super.onButtonClicked(buttonName);
			
			switch(buttonName)
			{
				case "nextButton":
					if(GameManager.instance.numCrimesLeft>0)
						GameManager.instance.startRandomInvestigation();
					else
						ScreenManager.instance.gotoScreen(new GameCompleteScreen(),true);
					break;
			}
		}
	}
}