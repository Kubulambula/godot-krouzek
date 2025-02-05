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
var bubak = [a, 1, "ahoj", Vector2(1,2)]

func _ready():
	print([null, null, null].is_empty())
	
	
	print(bubak[0])
	
	
	#var jakej_je_obsah = obdelnik_obsah(-6, 5)
	#print("Obsah je: ", jakej_je_obsah)
	
	#var b = 6
	#if a == b:
		#print(a)
	#elif a == 1:
		#print("ahoj")
	#elif a == 2:
		#print("cau")
	#if a == 2:
		#print("baf")
	#else:
		#print(a)
