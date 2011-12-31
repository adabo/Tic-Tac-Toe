;###
;# Tic Tac Toe
;# Version: 0.0.1
;# Author: adabo
;# Date: 12-30-11
;###

;Directives {
	#SingleInstance Force
	#Persistent
;}

;Initialize {
	table := ""
	. "     |     |`n"
 	. " o   |  x  |  o`n"
 	. "     |     |`n"
	. " ----------------`n"
 	. "     |     |`n"
 	. " o   |  x  |  o`n"
 	. "     |     |`n"
	. " ----------------`n"
 	. "     |     |`n"
 	. " o   |  x  |  o`n"
 	. "     |     |`n"
;}

;Main GUI {
	mGui()
;}

;Main Code {
	
;}

;Functions {
	mGui(){
	Global table
	Gui, 1: Font, s10, Lucida Console
	Gui, 1: Add, Text, w350 h250, %table%
	Gui, 1: Show, w170 h170
	}
;}