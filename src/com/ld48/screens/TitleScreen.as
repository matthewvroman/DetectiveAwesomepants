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
		public var gameTitle:TextField;
		public var gameSubtitle:TextField;
		public var playButton:MovieClip;
		
		public var background:MovieClip;
		
		public function TitleScreen() 
		{
			super();	
			
			background.gotoAndPlay(10); //skip the first fade
			
			addButton(playButton);
		}
		
		override public function initTextFields(_strings:XML):void
		{
			super.initTextFields(_strings);
			
			gameTitle.text = _strings.TITLE_GAME_TITLE[0];
			gameSubtitle.text = _strings.TITLE_GAME_SUBTITLE[0];
			playButton.textField.text = _strings.TITLE_PLAY_BUTTON[0];
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