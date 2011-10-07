package com.aims
 
  
{
  import mx.collections.ArrayCollection;
  
  public dynamic class School
  {
    public static var attrs:ArrayCollection= new ArrayCollection([
      "id","board_num","code","school_name","addr1","addr2","tel",
    "fax","email","start_grade","end_grade","created_at","updated_at","lat","long",
    "postal_code","ab_achievement","ic_achievement","ab_math","ic_math",
    "ab_language","ic_language","ab_science","ic_science","ab_engagement",
    "ic_engagement","ab_grade12mo","ic_grade12mo","ab_attendance","ic_attendance",
    "ab_overall_perf","ic_overall_perf","enrolment","PTR","SES","feeder_ach"
    ] );

    //csv string = "id","board_num","code","school_name","addr1","addr2","tel",
    //"fax","email","start_grade","end_grade","created_at","updated_at","lat","
    //long","postal_code","ab_achievement","ic_achievement","ab_math","ic_math",
    //"ab_language","ic_language","ab_science","ic_science","ab_engagement",
    //"ic_engagement","ab_grade12mo","ic_grade12mo","ab_attendance","ic_attendance",
    //"overall_performance","enrolment","PTR","SES","feeder_ach"
    
    public static var maxGradeNum:int = 13;
    public static var midGradeNum:int = 7;
    public static var lowColour = 0xD40404; //red
    //public var midColour = 0xb0b0b0; //gray
    public static var midColour = 0xEDEA2B; //yellow
    public static var highColour = 0x077015; //green
    
    public function School()
    {
 
    }
    
    public function getColourForCat(cat:String):uint {
      var numGrade:int = int(this[cat]);
      return getColourForNum(numGrade);
    }
    
    
    /* get an ArrayCollection for a given attribute. The AC has two elements:
     * the absolute value and the in context value
     */
    public function getAcForAttr(attrName:String):ArrayCollection {
      
      return new ArrayCollection([
        {attr:attrName, Absolute:this["ab_"+attrName], InContext:this["ic_"+attrName]}
      ]);
    }
    
    public static function getColourForNum(numGrade:int):uint {
      
      var ratio:Number = Math.abs(numGrade - midGradeNum) / (maxGradeNum - midGradeNum);;
      trace("numGrade = " + numGrade + " and ratio = " + ratio);
      
      if ( numGrade > midGradeNum ) {
        // gray to green
        return School.interpolateColor(midColour, highColour, ratio);
      }
      else if ( numGrade < midGradeNum ) {
        // gray to green
        return School.interpolateColor(lowColour, midColour, ratio);
      }
      else if (numGrade == midGradeNum) { return midColour; }
      
      
      trace("unable to find colour for grade " + numGrade);
      return midColour;  
    }
    
    
    public static function interpolateColor(fromColor:uint, toColor:uint, progress:Number):uint     {
      var q:Number = 1-progress;         
      var fromA:uint = (fromColor >> 24) & 0xFF;         
      var fromR:uint = (fromColor >> 16) & 0xFF;         
      var fromG:uint = (fromColor >>  8) & 0xFF;         
      var fromB:uint =  fromColor        & 0xFF;         
      var toA:uint = (toColor >> 24) & 0xFF;         
      var toR:uint = (toColor >> 16) & 0xFF;         
      var toG:uint = (toColor >>  8) & 0xFF;         
      var toB:uint =  toColor        & 0xFF;                 
      var resultA:uint = fromA*q + toA*progress;         
      var resultR:uint = fromR*q + toR*progress;         
      var resultG:uint = fromG*q + toG*progress;         
      var resultB:uint = fromB*q + toB*progress;         
      var resultColor:uint = resultA << 24 | resultR << 16 | resultG << 8 | resultB;         
      return resultColor;       }

 
    public static var numToLetterMappings:Array = new Array(
      new Array("", 0),
      new Array("F", 1),
      new Array("D-", 2),
      new Array("D", 3),
      new Array("D+", 4),
      new Array("C-", 5),
      new Array("C", 6),
      new Array("C+", 7),
      new Array("B-", 8),
      new Array("B", 9),
      new Array("B+", 10),
      new Array("A-", 11),
      new Array("A", 12),
      new Array("A+", 13),
      new Array("", 14)
    );
  
    
    public static function numToLetter(numGrade:int):String {
      var outerArraylength = numToLetterMappings.length;
      var i:Number;
      for(i=0; i < outerArraylength; i++) {
        if (numGrade == numToLetterMappings[i][1]) {
          return numToLetterMappings[i][0];
        }
      }
      trace("no letter grade found for num " + numGrade);
      return "--";
    }
    
    public static function numToColour(numGrade:int):uint {
      var result:uint;
      
      //result = 0xFF0000;
      var ratio:Number = numGrade/13;
      result = School.interpolateColor(0xD40404, 0x077015, ratio);
      
      return result;
    }
    
  }
}