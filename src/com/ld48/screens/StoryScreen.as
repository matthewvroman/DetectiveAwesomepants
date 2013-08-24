package com.ld48.screens 
{
	import com.ld48.GameplayScreen;
	import com.ld48.GameScreen;
	import com.ld48.ScreenManager;
	import com.ld48.GameManager;
	import flash.display.MovieClip;
	
	/**
	 * ...
	 * @author Matt
	 */
	public class StoryScreen extends GameScreen 
	{
		public var nextButton:MovieClip;
		
		public function StoryScreen() 
		{
			super();
		}
		
		override public function init():void
		{
			super.init();
			
			addButton(nextButton);
		}
		
		override public function onButtonClicked(buttonName:String):void
		{
			super.onButtonClicked(buttonName);
			
			switch(buttonName)
			{
				case "nextButton":
				{
					onStoryFinished();
					break;
				}
			}
		}
		
		public function onStoryFinished():void
		{
			GameManager.instance.startRandomInvestigation();
		}
		
	}

}