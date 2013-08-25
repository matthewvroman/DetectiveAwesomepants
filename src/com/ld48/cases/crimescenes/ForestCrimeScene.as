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
		public var hipster:MovieClip;
		public var canadian:MovieClip;
		public var deadGuy:MovieClip;
		public var owl:MovieClip;
		public var dagger:MovieClip;
		public var blood:MovieClip;
		
		public function ForestCrimeScene() 
		{
			super();
			
			tagline = "and the case of the forest fiend";
		}
		
		override public function setupInteractiveItems():void
		{
			super.setupInteractiveItems();
			createInteractiveItem(mountainClimber, "These are for climbing");
			createInteractiveItem(hipster, "Ugh, where's Starbucks?");
			createInteractiveItem(dagger, "Vintage Dagger");
			createInteractiveItem(canadian, "Shh.. I'm hiding");
			createInteractiveItem(deadGuy, "Stabbed postmortem");
			createInteractiveItem(blood, "That's a lot of blood");
			createInteractiveItem(owl, "Spooky");
		}
		
		override public function addSuspects():void
		{
			super.addSuspects();
			addSuspect("Canadian", false);
			addSuspect("Hipster", true);
			addSuspect("Climber", false);
			
		}
		
	}

}