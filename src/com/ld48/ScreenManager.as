package com.ld48 
{
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import flash.display.Stage;
	import flash.events.Event;
	/**
	 * ...
	 * @author Matt
	 */
	public class ScreenManager 
	{
		private static var _instance:ScreenManager = null;
		public static function get instance():ScreenManager { return _instance; }
		private var _stage:Stage;
		private var _currentScreen:GameScreen;
		private var _currentTransition:MovieClip;
		private var _screenToBeAdded:GameScreen;
		
		public function ScreenManager(stage:Stage) 
		{
			if (_instance != null)
			{
				trace("WARNING: More than one Screen Manager exists!");
			}
			else
			{
				_instance = this;
			}
			
			_stage = stage;
		}
		
		public function gotoScreen(screen:GameScreen, withTransition:Boolean=false):void
		{
			
			if (withTransition)
			{
				removeCurrentTransition();
				
				_currentTransition = new ScreenTransition();
				_stage.addChild(_currentTransition);
				_currentTransition.addEventListener(Event.ENTER_FRAME, onTransitionAdvance);
				
				_screenToBeAdded = screen;
			}
			else
			{
				removeCurrentTransition();
				
				removeCurrentScreen();
				addScreenAsCurrent(screen);
			}
		}
		
		private function onTransitionAdvance(e:Event):void
		{
			if (_currentTransition.currentFrameLabel == "Midpoint")
			{
				removeCurrentScreen();
				addScreenAsCurrent(_screenToBeAdded);
				
				_screenToBeAdded = null;
			}
			
			if (_currentTransition.currentFrame == _currentTransition.totalFrames)
			{
				removeCurrentTransition();
			}
		}
		
		private function removeCurrentTransition():void
		{
			if (_currentTransition != null)
			{
				_currentTransition.removeEventListener(Event.ENTER_FRAME, onTransitionAdvance);
				_currentTransition.parent.removeChild(_currentTransition);
				_currentTransition = null;
			}
		}
		
		private function removeCurrentScreen():void
		{
			if (_currentScreen != null)
			{
				_currentScreen.destroy();
				_currentScreen = null;
			}
		}
		
		private function addScreenAsCurrent(screen:GameScreen):void
		{
			_currentScreen = screen;
			if (_currentTransition != null)
			{
				_stage.addChildAt(screen, _stage.getChildIndex(_currentTransition) - 1);
			}
			else
			{
				_stage.addChild(_currentScreen);
			}
		}
		
	}

}