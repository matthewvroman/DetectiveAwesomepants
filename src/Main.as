package 
{
	import com.ld48.GameManager;
	import com.ld48.ScreenManager;
	import com.ld48.SoundManager;
	import com.ld48.screens.TitleScreen;
	
	import flash.display.Loader;
	import flash.display.LoaderInfo;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.system.ApplicationDomain;
	import flash.system.LoaderContext;
	import flash.utils.getTimer;
	import flash.utils.setTimeout;
	
	/**
	 * ...
	 * @author Matt
	 */
	[SWF(width="960", height="640", backgroundColor="#ffffff", frameRate="24")]
	
	public class Main extends Sprite 
	{
		private var _tickPosition:Number;
		private var _tickLastPosition:Number;
		private var _t:int;
		public static var deltaTime:Number = 0;
		private var _framePeriod:Number = 1;
		
		private var _screenManager:ScreenManager;
		private var _gameManager:GameManager;
		private var _soundManager:SoundManager;
		
		public static var HEIGHT:Number = 640;
		public static var WIDTH:Number = 960;
		
		public static var strings:XML;
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
	
			loadStrings();
			
			_t = getTimer();
			
			this.addEventListener(Event.ENTER_FRAME, onEnterFrame);
		}
		
		private function onEnterFrame(e:Event):void
		{
			_tickPosition = int((getTimer() % 1000) / _framePeriod);
			var t:int = getTimer();
			deltaTime = (t- _t) * 0.001;
			_t = t;

		   if (_tickLastPosition != _tickPosition)
		   {
				_tickLastPosition = _tickPosition;
		   }
		}
		
		private function loadStrings():void
		{
			var loader:URLLoader = new URLLoader();
			var loaderContext:LoaderContext = new LoaderContext(false,ApplicationDomain.currentDomain);
			var urlRequest:URLRequest = new URLRequest("assets/strings.xml");
			loader.addEventListener(Event.COMPLETE, onStringsLoadComplete);
			loader.load(urlRequest);
		}
		
		private function onStringsLoadComplete(e:Event):void
		{
			strings = new XML(e.target.data);
			
			loadAssets();
		}
		
		private function loadAssets():void
		{
			var loader:Loader = new Loader();
			var loaderContext:LoaderContext = new LoaderContext(false,ApplicationDomain.currentDomain);
			var urlRequest:URLRequest = new URLRequest("assets/assets.swf");
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE, onLoadComplete);
			loader.load(urlRequest,loaderContext);
		}
		
		private function onLoadComplete(e:Event):void
		{
			initManagers();
		}
		
		private function initManagers():void
		{
			_screenManager = new ScreenManager(stage);
			_gameManager = new GameManager();
			_soundManager = new SoundManager();
			
			//_soundManager.playMusic("BackgroundMusic");
			
			_screenManager.gotoScreen(new TitleScreen());
		}
		
	}
	
}