package com.ld48.cases.crimescenes
{
	import com.ld48.CrimeScene;
	
	import flash.display.MovieClip;
	
	public class MoonCrimeScene extends CrimeScene
	{
		public var alien:MovieClip;
		public var astronaut:MovieClip;
		public var nudist:MovieClip;
		public var flag:MovieClip;
		public var victim:MovieClip;
		public var bloodPuddle:MovieClip;
		public var bloodTrail:MovieClip;
		
		public function MoonCrimeScene()
		{
			super();
			
			tagline = "and the case of the moon murder";
		}
		
		override public function setupInteractiveItems():void
		{
			super.setupInteractiveItems();
			
			createInteractiveItem(alien, "Sure, blame the foreigner");
			createInteractiveItem(astronaut, "It uhh.. wasn't me?");
			createInteractiveItem(nudist, "Wooohoo!");
			createInteractiveItem(flag, "A patriotic death");
			createInteractiveItem(bloodTrail, "Where does this lead?");
			
		}
		
		override public function addSuspects():void
		{
			super.addSuspects();
			addSuspect("Astronaut", true);
			addSuspect("Alien", false);
			addSuspect("SpaceNudist", false);
			
		}
	}
}