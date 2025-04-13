extends Label
@onready var father_to_player = $"../father_to_player"

var content_text=[
	{"text":"Papa, j’ai reçu une invitation pour un entretien chez Google ! Je suis super content, mais aussi un peu stressé… Je ne sais pas vraiment comment me préparer.","time":1},
	{"text":"Oui, j’ai regardé leur site web, leurs produits et leur culture d’entreprise. Mais je ne sais pas quelles questions on va me poser.","time":1},
	{"text":"D’accord… Et comment dois-je répondre ?","time":1},
	{"text":"C’est intéressant ! Et pour l’attitude, comment dois-je me comporter ?","time":1},
	{"text":"D’accord ! Et si on me demande pourquoi je veux travailler chez Google ?","time":1},
	{"text":"Merci, papa ! Je vais bien me préparer.","time":1}
]

func player_to_father():
	for i in range(len(content_text)):
		text = content_text[i]["text"]
		await get_tree().create_timer(content_text[i]["time"]).timeout
	await father_to_player.father_to_player()
func _process(delta: float) -> void:
	if text=="":
		visible = false
	else:
		visible=true
