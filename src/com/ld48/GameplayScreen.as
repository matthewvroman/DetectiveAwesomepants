package com.ld48 
{
	import com.ld48.cases.crimescenes.ForestCrimeScene;
	import flash.display.MovieClip;
	/**
	 * ...
	 * @author Matt
	 */
	public class GameplayScreen extends GameScreen 
	{
		private var cases:Vector.<DetectiveCase>;
		private var uncompletedCases:Vector.<DetectiveCase>;
		private var completedCases:Vector.<DetectiveCase>;
		
		private var _currentCase:DetectiveCase;
		
		
		
		public function GameplayScreen() 
		{
			super();
			
		}
		
		override public function init():void
		{
			super.init();
			
			cases = new Vector.<DetectiveCase>();
			cases.push(new DetectiveCase(this, new ForestCrimeScene()));
			uncompletedCases = cases;
			completedCases = new Vector.<DetectiveCase>();
			
			startRandomCase();
		}
		
		
		public function get currentCase():DetectiveCase
		{
			return _currentCase;
		}
		
		public function startRandomCase():void
		{
			_currentCase = uncompletedCases[MathHelper.RandomInt(0, uncompletedCases.length - 1)];
			_currentCase.start();
		}
		
		override public function update():void
		{
			super.update();
			
			if (_currentCase)
			{
				_currentCase.update();
			}
		}
		
		public function onCaseCompleted():void
		{
			if (_currentCase == null) return;
			
			completedCases.push(_currentCase);
			
			uncompletedCases.splice(uncompletedCases.indexOf(_currentCase), 1);
			
		}
	}

}