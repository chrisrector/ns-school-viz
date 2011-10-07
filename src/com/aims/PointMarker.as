package com.aims
{
	import mx.core.UIComponent;
	import flash.display.Sprite;
	 	
	public class PointMarker extends Sprite
	{
		private var _nName:String;
		private var _nMarker:String;
		private var _nDescription:String;
		private var _nLogo:String;
		private var _nMath:Number;
		private var _nScience:Number;
		
			
		public function set schoolName(name:String):void
		{
			_nName = name;
		}
		public function get schoolName():String
		{
			return _nName;
		}			
		public function set schoolDesc(description:String):void
		{
			_nDescription = description;
		}
		public function get schoolDesc():String
		{
			return _nDescription;
		}			
				
		public function set schoolLogo(logo:String):void
		{
			_nLogo = logo;
		}
		public function get schoolLogo():String
		{
			return _nLogo;
		}		
		
		public function set math(score:Number):void
    {
      _nMath = score;
    }
		public function get math():Number
    {
      return _nMath;
    }
    
    public function set science(score:Number):void
    {
      _nScience = score;
    } 
    public function get science():Number
    {
      return _nScience;
    } 

    
				
	}
}