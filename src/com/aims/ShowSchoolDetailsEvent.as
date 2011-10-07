package com.aims
{
  import com.aims.School;
  
  import flash.events.Event;
  
  public class ShowSchoolDetailsEvent extends Event
  {
    public var school:School;
    
    public function ShowSchoolDetailsEvent(type:String, schoolToShow:School,
                                   bubbles:Boolean=false, cancelable:Boolean=false)
    {
      super(type, bubbles, cancelable);
      school = schoolToShow;
      trace("show school event for " + school["school_name"]);

    }
  }
}