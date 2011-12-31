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
	.     |     |
 	. o   |  x  |  o
 	.     |     |
	. ----------------
 	.     |     |
 	. o   |  x  |  o
 	.     |     |
	. ----------------
 	.     |     |
 	. o   |  x  |  o
 	.     |     |
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
	Gui, 1: Add, Text,, %table%
	Gui, 1: Show, w400 h300
	}
;}