package com.aims
{
  import com.aims.School;
  
  import flash.display.Sprite;
  
  import mx.core.UIComponent;
  
  public class SchoolMarker extends Sprite
  {
    public var school:School;
    private var borderFill:uint = 0xffffff;
    private var _alpha:Number = 1;
    public var previewCat = "ab_achievement";
    
    public function drawMarker():void {
      
      var fillColour:uint = school.getColourForCat(previewCat);
      
      graphics.beginFill(
        borderFill,
        _alpha);
      graphics.lineStyle(0, borderFill, _alpha);
      graphics.drawCircle(0, 0, 6);
      
      graphics.beginFill(
        fillColour,
        _alpha);
      graphics.lineStyle(0, fillColour, _alpha);
      graphics.drawCircle(0, 0, 5);
      
    }
    
  }
}