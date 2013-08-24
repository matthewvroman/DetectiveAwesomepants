package com.ld48.screens
{
	import com.ld48.GameScreen;
	import com.ld48.GameManager;
	import com.ld48.ScreenManager;
	
	import flash.display.MovieClip;
	
	public class CrimeFailedScreen extends GameScreen
	{
		public var nextButton:MovieClip;
		
		public function CrimeFailedScreen()
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
					ScreenManager.instance.gotoScreen(new TitleScreen(),true);
					break;
			}
		}
	}
}