extends Label
var content_text = [
	{"text":"J'ai été diplômé et j'ai besoin de trouver un travail, mais je ne sais pas quoi faire.","time":4.5,"audio":"res://voice/thinking/thi_0.mp3"},
	{"text":"J'ai une bonne idée !","time":1.5,"audio":"res://voice/thinking/thi_1.mp3"},
	{"text":"je devrais peut-être demander de l'aide à ma professeure, Madame Souhir.","time":3,"audio":null}
	]
@onready var audio: AudioStreamPlayer = %audio

func transform():
	for i in range(3):
		text = content_text[i]["text"]
		if content_text[i]["audio"]!=null:
			
			audio.stream = load(content_text[i]["audio"])
			audio.play()
		await get_tree().create_timer(content_text[i]["time"]).timeout
