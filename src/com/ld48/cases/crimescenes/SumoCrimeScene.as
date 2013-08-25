package com.ld48.cases.crimescenes
{
	import com.ld48.CrimeScene;
	
	import flash.display.MovieClip;
	
	public class SumoCrimeScene extends CrimeScene
	{
		public var victim:MovieClip;
		public var flag:MovieClip;
		public var purple:MovieClip;
		public var red:MovieClip;
		public var green:MovieClip;
		
		public function SumoCrimeScene()
		{
			super();
			
			tagline = "and the case of the cryptic combatants";
		}
		
		override public function setupInteractiveItems():void
		{
			super.setupInteractiveItems();
			createInteractiveItem(victim, "Crushed to death. Ouch.");
			createInteractiveItem(flag, "It's the Japanese Flag");
			createInteractiveItem(green, "The scarlett man did it.");
			createInteractiveItem(red, "The verdant man did it.");
			createInteractiveItem(purple, "The cardinal man did it.");
		}
		
		override public function addSuspects():void
		{
			super.addSuspects();
			addSuspect("SumoGreen", false);
			addSuspect("SumoPurple", false);
			addSuspect("SumoRed", true);
			
		}
	}
}