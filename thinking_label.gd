extends Label
var content_text = [
	{"text":"J'ai été diplômé et j'ai besoin de trouver un travail, mais je ne sais pas quoi faire.","time":5},
	{"text":"J'ai une bonne idée !","time":3},
	{"text":"je devrais peut-être demander de l'aide à ma professeure, Madame Souhir.","time":3}
	]

func transform():
	for i in range(3):
		text = content_text[i]["text"]
		await get_tree().create_timer(content_text[i]["time"]).timeout
