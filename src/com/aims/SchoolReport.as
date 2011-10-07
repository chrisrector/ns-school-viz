package com.aims
{
public class SchoolReport
{
  public var name:String;
  private var secretValue:Number;
  
  public function SchoolReport(initialName:String="Agus")
  {
    name = initialName;
  }
  
  public function sayHello():String
  {
    var result:String;
    if(name!=null && name.length>0){
      result = "Hello there, "+name+".";
    }
    else{
      result="Hello there, anonymous.";
    }
    return result;
  }
}
}