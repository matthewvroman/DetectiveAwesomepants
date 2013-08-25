package com.ld48 
{
	import com.ld48.cases.crimescenes.*;
	import com.ld48.screens.LineupScreen;
	/**
	 * ...
	 * @author Matt
	 */
	public class GameManager 
	{
		private static var _instance:GameManager;
		public static function get instance():GameManager { return _instance; }
		
		private var unsolvedCrimes:Vector.<Class>;
		
		private var _currentCrime:CrimeScene;
		public function get currentCrime():CrimeScene { return _currentCrime; }
		
		private var _numCrimesSolved:int = 0;
		private var _totalNumCrimes:int = 0;
		
		public function GameManager() 
		{
			if (_instance != null)
			{
				trace("WARNING! An instance of Game Manager already exists");
			}
			else
			{
				_instance = this;
			}
			
			init();
		}
		
		private function init():void
		{
			setupCrimes();
			
			GameEventDispatcher.addEventListener(GameEvent.CRIME_SCENE_START, onCrimeSceneStart);
			GameEventDispatcher.addEventListener(GameEvent.CRIME_SCENE_END, onCrimeSceneEnd);
			
			GameEventDispatcher.addEventListener(GameEvent.CASE_FAILED, onCaseFailed);
		}
		
		private function setupCrimes():void
		{
			if(unsolvedCrimes!=null)
			{
				unsolvedCrimes = null;
			}
			
			unsolvedCrimes = new Vector.<Class>();
			unsolvedCrimes.push(MoonCrimeScene/*ForestCrimeScene,BeachCrimeScene,MoonCrimeScene*/);
			
			_numCrimesSolved = 0;
			_totalNumCrimes = unsolvedCrimes.length;
		}
		
		public function startRandomInvestigation():void
		{
			
			if(numCrimesLeft==0)
			{
				setupCrimes();
			}
			
			var index:int = MathHelper.RandomInt(0, unsolvedCrimes.length - 1);
			
			var crimeClass:Class = unsolvedCrimes[index];
			_currentCrime = new crimeClass();
			
			unsolvedCrimes.splice(index, 1);
			
			ScreenManager.instance.gotoScreen(_currentCrime, true);
		}
		
		private function onCrimeSceneStart(e:GameEvent):void
		{
			
		}
		
		private function onCrimeSceneEnd(e:GameEvent):void
		{
			ScreenManager.instance.gotoScreen(new LineupScreen(_currentCrime.suspects), true);
		}
		
		public function onCrimeSolved():void
		{
			_numCrimesSolved++;
		}
		
		private function onCaseFailed():void
		{
			
		}
		
		public function get numCrimesLeft():int
		{
			return unsolvedCrimes.length;
		}
		
		public function get totalNumCrimes():int
		{
			return _totalNumCrimes;
		}
		
		public function get numCrimesSolved():int
		{
			return _numCrimesSolved;
		}
		
		public function get numCrimesFailed():int
		{
			return _totalNumCrimes-numCrimesLeft - _numCrimesSolved;
		}
	}

}