package com.ld48 
{
	import flash.geom.Point;
	import Math;
	/**
	 * ...
	 * @author Matt
	 */
	public class MathHelper 
	{
		
		public function MathHelper() 
		{
			
		}
		
		public static function RandomInt(min:int, max:int):int
		{
			return Math.floor(Math.random()*(1+max-min))+min;
		}
	}

}