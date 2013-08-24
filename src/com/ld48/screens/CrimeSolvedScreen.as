package com.ld48.screens
{
	import com.ld48.GameScreen;
	import com.ld48.GameManager;
	import com.ld48.ScreenManager;
	
	import flash.display.MovieClip;
	
	public class CrimeSolvedScreen extends GameScreen
	{
		public var nextButton:MovieClip;
		
		public function CrimeSolvedScreen()
		{
			super();
			
			addButton(nextButton);
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