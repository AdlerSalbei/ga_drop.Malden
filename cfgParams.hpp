class Params
{
    class WeatherSetting
    {
        title = "Weather";
        values[] = {-1,0,25,50,75,100};
        texts[] = {"Random","Clear","Cloudy","Overcast","Rainy","Stormy"};
        default = -1;
    };

    class TimeOfDay
    {
        title = "Time of Day";
        values[] = {-1,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23};
        texts[] = {"Random","00:00","01:00","02:00","03:00","04:00","05:00","06:00","07:00 (Sunrise)","08:00","09:00","10:00","11:00","12:00","13:00","14:00","15:00","16:00","17:00","18:00 (Sunset)","19:00","20:00","21:00","22:00","23:00"};
        default = -1;
    };

	class BluforFaction
	{
		title = "Blufor Faction";
		values[] = {0};
		texts[] = {"USA"};
		default = 0;
	};
	
	class OpforFaction
	{
		title = "Opfor Faction";
		values[] = {0};
		texts[] = {"TERRORISTS"};
		default = 0;
	};
	
	class Preset
    {
        title = "Preset";
        values[] = {0,1};
        texts[] = {
            "Custom",
            "Debug Mode (all parameters below will be ignored)"
        };
        default = 1;
    };
	
	 class DefenseTime
    {
        title = "Time to Defend the City (Minutes)";
        values[] = {120,900,1200,1500,1800,2100,2400,2700,3000,3300,3600,3900,4200,4500,4800};
        texts[] = {"2","15","20","25","30","35","40","45","50","55","60","65","70","75","80"};
        default = 3600;
    };

    class CaptureTime
    {
        title = "Time in Control to Capture City (Minutes)";
        values[] = {150,300,450,600,750,900};
        texts[] = {"2:30", "05:00", "07:30", "10:00", "12:30", "15:00"};
        default = 600;
    };
	
	class ControlRatio
    {
        title = "Ratio to Control the City - Blufor:Opfor";
        values[] = {1,1.5,1.75,2,2.5,3,3.5,4,4.5,5};
        texts[] = {"1:1","1.5:1","1.75:1","2:1","2.5:1","3:1","3.5:1","4:1","4.5:1","5:1"};
        default = 2;
    };
};