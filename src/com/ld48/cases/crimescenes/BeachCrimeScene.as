package com.ld48.cases.crimescenes
{
	import com.ld48.CrimeScene;
	
	import flash.display.MovieClip;
	
	public class BeachCrimeScene extends CrimeScene
	{
		public var surfer:MovieClip;
		public var beachGuy:MovieClip;
		public var nudist:MovieClip;
		
		public function BeachCrimeScene()
		{
			super();
		}
		
		override public function setupInteractiveItems():void
		{
			super.setupInteractiveItems();
			createInteractiveItem(surfer, "So chill");
			createInteractiveItem(beachGuy, "Gross..");
			createInteractiveItem(nudist, "Very.. european");
		}
		
		override public function addSuspects():void
		{
			super.addSuspects();
			addSuspect("Surfer", true);
			addSuspect("Beach Guy", false);
			addSuspect("Nudist", false);
		}
	}
}