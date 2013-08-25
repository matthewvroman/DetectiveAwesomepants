package com.ld48.screens
{
	import com.ld48.GameScreen;
	import com.ld48.ScreenManager;
	
	import flash.display.MovieClip;
	
	public class PayoffScreen extends GameScreen
	{
		public var nextButton:MovieClip;
		
		public function PayoffScreen()
		{
			super();
			
			addButton(nextButton);
		}
	
		override public function initTextFields(_strings:XML):void
		{
			super.initTextFields(_strings);
			
			nextButton.textField.text = "Relive the epic experience!";
		}
		
		override public function onButtonClicked(buttonName:String):void
		{
			super.onButtonClicked(buttonName);
			
			switch(buttonName)
			{
				case "nextButton":
				{
					ScreenManager.instance.gotoScreen(new TitleScreen(),true);
					break;
				}
			}
		}
	}
}