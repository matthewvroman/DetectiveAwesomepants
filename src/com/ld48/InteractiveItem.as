package com.ld48 
{
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.filters.ConvolutionFilter;
	
	/**
	 * ...
	 * @author Matt
	 */
	public class InteractiveItem
	{
		private static var CLUE_POPOVER_POSITION_BUFFER:Number = 50;
		
		private var _clip:MovieClip;
		private var _text:String;
		private var _cluePopover:CluePopover;
		
		public function InteractiveItem(clip:MovieClip, text:String) 
		{
			super();
			
			_clip = clip;
			_text = text;
			
			_cluePopover = new CluePopover();
			_cluePopover.setText(_text);
			_cluePopover.y = -_clip.getBounds(_clip.parent).height - CLUE_POPOVER_POSITION_BUFFER;
			_cluePopover.alpha = 0;
			_clip.addChild(_cluePopover);
			
			_clip.addEventListener(MouseEvent.MOUSE_OVER, onMouseOver);
			_clip.addEventListener(MouseEvent.MOUSE_OUT, onMouseOut);
			
		}
		
		public function onMouseOver(e:MouseEvent):void
		{
			_cluePopover.show();
		}
		
		public function onMouseOut(e:MouseEvent):void
		{
			_cluePopover.hide();
		}
		
		public function destroy():void
		{
			_clip.removeEventListener(MouseEvent.MOUSE_OVER, onMouseOver);
			_clip.removeEventListener(MouseEvent.MOUSE_OUT, onMouseOut);
		}
		
	}

}