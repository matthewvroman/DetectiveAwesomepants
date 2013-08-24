package com.ld48 
{
	import flash.display.MovieClip;
	
	/**
	 * ...
	 * @author Matt
	 */
	public class CrimeScene extends GameScreen
	{
		private var _items:Vector.<InteractiveItem>;
		private var _suspects:Vector.<Suspect>;
		public function get suspects():Vector.<Suspect> { return _suspects; }
		
		private static var CRIME_SCENE_LENGTH:Number = 10;
		private var _timeLeft:Number = 0;
		
		private var _investigating:Boolean;
		
		public function CrimeScene() 
		{
			super();
			
		}
		
		override public function init():void
		{
			super.init();
			
			startInvestigation();
		}
		
		public function startInvestigation():void
		{
			if (_investigating) return;
			
			setupInteractiveItems();
			addSuspects();
			
			_investigating = true;
			
			_timeLeft = CRIME_SCENE_LENGTH;
			
			GameEventDispatcher.dispatchEvent(new GameEvent(GameEvent.CRIME_SCENE_START));
		}
		
		public function stopInvestigation():void
		{
			if (!_investigating) return;
			
			_investigating = false;
			
			GameEventDispatcher.dispatchEvent(new GameEvent(GameEvent.CRIME_SCENE_END));
		}
		
		override public function update():void
		{
			super.update();
			
			_timeLeft -= Main.deltaTime;
			//trace(_timeLeft);
			if (_timeLeft <= 0)
			{
				stopInvestigation();
			}
		}
		
		public function setupInteractiveItems():void
		{
			//override me
		}
		
		public function addSuspects():void
		{
			//override me
		}
		
		public function createInteractiveItem(item:MovieClip, clue:String):void
		{
			if (_items == null)
			{
				_items = new Vector.<InteractiveItem>();
			}
			
			_items.push(new InteractiveItem(item,clue));
		}
		
		public function addSuspect(name:String, guilty:Boolean=false):void
		{
			if(_suspects == null)
			{
				_suspects = new Vector.<Suspect>();
			}
			
			_suspects.push(new Suspect(name,guilty));
		}
		
		override public function destroy():void
		{
			super.destroy();
			
			_items = null;
			_suspects = null;
		}
	}

}