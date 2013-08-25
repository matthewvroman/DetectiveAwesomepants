package com.ld48.screens
{
	import com.ld48.GameManager;
	import com.ld48.GameScreen;
	import com.ld48.ScreenManager;
	import com.ld48.MathHelper;
	
	import flash.display.MovieClip;
	import flash.text.TextField;
	
	public class CrimeFailedScreen extends GameScreen
	{
		public var textField:TextField;
		public var nextButton:MovieClip;
		
		public function CrimeFailedScreen()
		{
			super();
			
			addButton(nextButton);
		}
		
		override public function initTextFields(_strings:XML):void
		{
			super.initTextFields(_strings);
			
			textField.text = _strings["CRIME_FAIL_"+MathHelper.RandomInt(1,4)][0];
			
			nextButton.textField.text = "Redeem Yourself";
			
		}
		
		override public function onButtonClicked(buttonName:String):void
		{
			super.onButtonClicked(buttonName);
			
			switch(buttonName)
			{
				case "nextButton":
					GameManager.instance.startCurrentCrime();
					break;
			}
		}
	}
}