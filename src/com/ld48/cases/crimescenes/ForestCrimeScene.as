package com.ld48.cases.crimescenes 
{
	import com.ld48.CrimeScene;
	import flash.display.MovieClip;
	
	/**
	 * ...
	 * @author Matt
	 */
	public class ForestCrimeScene extends CrimeScene 
	{
		public var mountainClimber:MovieClip;
		
		public function ForestCrimeScene() 
		{
			super();
			
		}
		
		override public function setupInteractiveItems():void
		{
			super.setupInteractiveItems();
			createInteractiveItem(mountainClimber, "Manly Man");
		}
		
		override public function addSuspects():void
		{
			super.addSuspects();
			addSuspect("Mt. Climber", true);
		}
		
	}

}