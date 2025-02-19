extends Node2D



func foo():
	return 1


func obdelnik_obsah(a, b):
	var obsah = a * b
	#if obsah < 0:
		#push_error("spatne argumenty")
		#return null
	return obsah


var a = "ja nejsem bubak"
var b = 1
var c = 1.1
var bubak = [a, 1, "ahoj", Vector2(1,2)]

func _ready():
	#print([null, null, null].is_empty())
	
	#print(bubak[0])
	
	
	var jakej_je_obsah = obdelnik_obsah(-6, 5)
	print("Obsah je: ", jakej_je_obsah)
	
	#var b = 6
	if a == "ja nejsem bubak":
		print(a)
	elif a == 1:
		print("ahoj")
	elif a == 2:
		print("cau")
	
	if a == 2:
		print("baf")
	else:
		print(a)
