package com.ld48
{
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.media.SoundTransform;
	
	public class SoundManager
	{
		private static var _instance:SoundManager = null;
		public static function get instance():SoundManager { return _instance; }
		
		private var musicSoundChannel:SoundChannel = new SoundChannel();
		private var musicSoundTransform:SoundTransform = new SoundTransform(1.0,0);
		
		private var sfxSoundChannel:SoundChannel = new SoundChannel();
		private var sfxSoundTransform:SoundTransform = new SoundTransform(0.85,0);
		
		public function SoundManager()
		{
			if(_instance!=null)
			{
				trace("WARNING! A sound manager already exists");
			}
			else
			{
				_instance = this;
			}
		}
		
		public function playSFX(value:String):void
		{
			var sound:Sound = Helper.getSoundFromLibrary(value);
			
			sfxSoundChannel = sound.play(0);
		}
		
		public function playMusic(value:String):void
		{
			var sound:Sound = Helper.getSoundFromLibrary(value);
			
			musicSoundChannel.stop();
			musicSoundChannel = null;
			
			musicSoundChannel = sound.play(0,9999);
		}
		
		public function setMusicVolume(value:Number):void
		{
			musicSoundTransform.volume = value;
		}
	}
}