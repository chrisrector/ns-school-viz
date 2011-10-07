package com.aims
{
  import com.aims.School;
  
  import flash.events.Event;
  
  public class AddSchoolEvent extends Event
  {
    public var school:School;
    
    public function AddSchoolEvent(type:String, schoolToAdd:School,
                                   bubbles:Boolean=false, cancelable:Boolean=false)
    {
      super(type, bubbles, cancelable);
      school = schoolToAdd;
    }
  }
}