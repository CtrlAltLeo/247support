extends Spatial

enum GAME_STATE {alive, cutscene, gameover}

var gamestate = GAME_STATE.alive

var night = 0

export (Array, PackedScene) var days
