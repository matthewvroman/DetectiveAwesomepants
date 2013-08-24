package com.ld48.screens 
{
	import com.ld48.GameScreen;
	import com.ld48.ScreenManager;
	import flash.display.MovieClip;
	import flash.text.TextField;
	
	/**
	 * ...
	 * @author Matt
	 */
	public class TitleScreen extends GameScreen
	{
		public var text:TextField;
		public var playButton:MovieClip;
		
		public function TitleScreen() 
		{
			super();	
			
			addButton(playButton);
		}
		
		override public function initTextFields():void
		{
			super.initTextFields();
			
			playButton.textField.text = "Play";
		}
		
		override public function onButtonClicked(buttonName:String):void
		{
			super.onButtonClicked(buttonName);
			
			switch(buttonName)
			{
				case "playButton":
				{
					ScreenManager.instance.gotoScreen(new StoryScreen(),true);
					break;
				}
			}
		}
		
		
	}

}