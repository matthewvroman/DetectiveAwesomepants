package com.ld48.cases.crimescenes
{
	import com.ld48.CrimeScene;
	
	import flash.display.MovieClip;
	
	public class EverestCrimeScene extends CrimeScene
	{
		public var victim:MovieClip;
		public var flag:MovieClip;
		public var orange:MovieClip;
		public var black:MovieClip;
		public var green:MovieClip;
		public var clouds:MovieClip;
		
		public function EverestCrimeScene()
		{
			super();
			
			tagline = "and the case of the strangled summit";
			
			clouds.mouseChildren=false;
			clouds.mouseEnabled=false;
		}
		
		
	
		override public function setupInteractiveItems():void
		{
			super.setupInteractiveItems();
			createInteractiveItem(victim, "Strangled by a rope.");
			createInteractiveItem(flag, "Mother Russia");
			createInteractiveItem(green, "Vladoff knows nothing.");
			createInteractiveItem(black, "Strangle? Is joke? Hah");
			createInteractiveItem(orange, "Puny man. Let Boris climb.");
		}
		
		override public function addSuspects():void
		{
			super.addSuspects();
			addSuspect("ClimberGreen", false);
			addSuspect("ClimberBlack", false);
			addSuspect("ClimberOrange", true);
			
		}
	}
}