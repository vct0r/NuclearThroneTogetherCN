#define init
trace('Scale-able Levels (type /scale [n] (default is 100))');
trace('type /preset to see preset commands')
global.scale = 100
#define chat_command

switch(argument0)
{ 
  case "scale":
    {
        global.scale = int64(string_upper(argument1))
        return true;
    }

    case "preset":
    {
        trace('/smol - the smallest levels')
        trace('/small - 50% smaller than regular levels')
        trace('/normal - normal sized levels')
        trace('/big - 50% bigger levels')
        trace('/bigger - 2X as large levels')
        trace('/biggest - the largest levels in the wasteland')
        return true;
    }

    case "smol":
    {
        global.scale = 10
        return true;
    }

    case "small":
    {
        global.scale = 50
        return true;
    }

    case "normal":
    {
        global.scale = 100
        return true;
    }
   
    case "big":
    {
        global.scale = 150
        return true;
    }

    case "bigger":
    {
        global.scale = 200
        return true;
    }

      case "biggest":
    {
        global.scale = 300
        return true;
    }
    
}
#define step

if global.scale >= 301{
global.scale = 300
}

if global.scale <= 9{
global.scale = 10
}

with(FloorMaker) if GameCont.area != 0
		{
		goal = global.scale+(GameCont.hard)
		}

