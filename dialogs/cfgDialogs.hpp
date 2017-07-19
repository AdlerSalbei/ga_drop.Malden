#include "ui_toolkit.hpp"
#include "baseDefines.hpp"
#include "baseRsc.hpp"

#include "confirmHint\dialog.hpp"

class RscTitles {
    #include "twoLineHint\title.hpp"
    #include "animatedHint\title.hpp"
    #include "RscPIP\title.hpp"
    #include "showTimeLeft\title.hpp"
    #include "..\node_modules\grad-fortifications\dialog\hint\title.hpp"

    class Default {
        idd = -1;
        fadein = 0;
        fadeout = 0;
        duration = 0;
    };
};
