package com.ld48
{
	import flash.events.Event;
	
	public class GameEvent extends Event
	{
		public static const DEFAULT_GAME_EVENT:String = "DefaultGameEvent";
		public static const CASE_COMPLETE:String = "CaseCompleted";
		public static const CASE_FAILED:String = "CaseFailed";
		
		public static const CASE_START:String = "CaseStart";
		public static const CASE_END:String = "CaseEnd";
		
		public static const CRIME_SCENE_START:String = "CrimeSceneStart";
		public static const CRIME_SCENE_END:String = "CrimeSceneEnd";
		
		public static const LINEUP_START:String = "LineupStart";
		public static const LINEUP_END:String = "LineupEnd";
		
		public static const SUSPECT_PICKED:String = "SuspectPicked";
		
		public var data:*;
		
		public function GameEvent(type:String=GameEvent.DEFAULT_GAME_EVENT, eventData:*=null, bubbles:Boolean=false, cancelable:Boolean=false):void
		{
			super(type, bubbles, cancelable);
			data = eventData;
		}
		
		override public function clone():Event {
			// Return a new instance of this event with the same parameters.
			return new GameEvent(type, data, bubbles, cancelable);
		}
	}
}