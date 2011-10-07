package com.aims
{
  import com.aims.School;
  
  import flash.events.Event;
  
  public class HideSchoolDetailsEvent extends Event
  {
    public var school:School;
    
    public function HideSchoolDetailsEvent(type:String, schoolToHide:School,
                                   bubbles:Boolean=false, cancelable:Boolean=false)
    {
      super(type, bubbles, cancelable);
      school = schoolToHide;
      trace("hide school event for " + school["school_name"]);

    }
  }
}