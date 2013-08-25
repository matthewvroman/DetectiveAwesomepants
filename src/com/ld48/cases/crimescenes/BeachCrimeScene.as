package com.ld48.cases.crimescenes
{
	import com.ld48.CrimeScene;
	
	import flash.display.MovieClip;
	
	public class BeachCrimeScene extends CrimeScene
	{
		public var surfer:MovieClip;
		public var beachGuy:MovieClip;
		public var nudist:MovieClip;
		
		public var sun:MovieClip;
		public var boat:MovieClip;
		
		public var body:MovieClip;
		public var boot:MovieClip;
		
		public function BeachCrimeScene()
		{
			super();
			
			tagline = "and the case of the beach butcher";
		}
		
		override public function setupInteractiveItems():void
		{
			super.setupInteractiveItems();
			createInteractiveItem(surfer, "Surf's up bro");
			createInteractiveItem(beachGuy, "I'm on vacation");
			createInteractiveItem(nudist, "Very.. european");
			
			createInteractiveItem(boat, "Just a sailboat");
			createInteractiveItem(sun, "It's so hot out");
			
			createInteractiveItem(body, "A cut up body");
			createInteractiveItem(boot, "A bloody boot..");
		}
		
		override public function addSuspects():void
		{
			super.addSuspects();
			addSuspect("Surfer", false);
			addSuspect("BeachGuy", true);
			addSuspect("Nudist", false);
		}
	}
}