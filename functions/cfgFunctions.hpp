class choosePlayArea {
	class autoChooseCity {};
	class autoChooseSpawn {};
	class bluforWaitDialog {};
	class chooseCity {};
	class chooseSpawn {};
	class opforWaitDialog {};
	class showWeatherPreview {};
};
class common {
	class createSideMarker {};
	class deleteSideMarker {};
	class deleteSideMarkerRemote {};
	class diagReport {};
	class findRandomPos {};
	class getIslandCfgValue {};
	class handleJIP {};
	class intro {};
	class isCommander {};
	class serverLog {};
	class sideHint {};
	class sideNotification {};
	class teleport {};
	class temp3dMarker {};
	class wait3dFrames {};
};
class init {
	class loadoutFaction {};
	class pubVars {};
	class sequentialInit {};
	class systems {postInit = 1;};
};
class missionstart {
	class bluforBuyAction {};
	class createTrigger {};
	class enableBFT {};
	class opforBuyAction {};
	class tpSide {};
};
class setup {
	class briefingDone {postInit = 1;};
	class moveToMapStart {postInit = 1;};
	class setMissionParams {};
	class setOriginalSide {};
	class setTime {};
	class setWeather {};
};
class spawn {
	class prepBluforSpawn {};
	class prepOpforSpawn {};
	class spawnBluforPlayer {};
	class spawnOpforPlayer {};
}