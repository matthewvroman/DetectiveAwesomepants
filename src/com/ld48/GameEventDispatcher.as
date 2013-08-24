package com.ld48 {
	
	import flash.events.EventDispatcher;
	import flash.events.Event;
	
	public class GameEventDispatcher {
		
		protected static var disp:EventDispatcher;
		
		public static function addEventListener(p_type:String, p_listener:Function, p_useCapture:Boolean = false, p_priority:int = 0, p_useWeakReference:Boolean = false):void 
		{
			if (disp == null) { disp = new EventDispatcher(); }
				disp.addEventListener(p_type, p_listener, p_useCapture, p_priority, p_useWeakReference);
		}
		
		public static function removeEventListener(p_type:String, p_listener:Function, p_useCapture:Boolean = false):void
		{
			if (disp == null) { return; }
			disp.removeEventListener(p_type, p_listener, p_useCapture);
		}
		
		public static function dispatchEvent(p_event:Event):void {
			if (disp == null) { return; }
			disp.dispatchEvent(p_event);
		}
	}
}