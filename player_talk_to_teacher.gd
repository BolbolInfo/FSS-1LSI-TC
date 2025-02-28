extends Label
@onready var teacher_talk = $"../teacher_talk"

var content_text=[
	{"text":"Bonjour, Madame Souhir. Est-ce que je peux vous déranger un instant ?","time":3},
	{"text":"Je vais bien, merci. Je suis venu vous voir parce que je viens d’être diplômé, et honnêtement, je ne sais pas par où commencer pour trouver un emploi.","time":1},
	{"text":"Oui, idéalement, j’aimerais travailler dans le développement logiciel ou l’analyse des données, mais je ne sais pas comment chercher efficacement ni comment me présenter aux employeurs.","time":1},
	{"text":"Justement, non... Je n’ai pas encore de CV et je ne sais pas vraiment comment en faire un.","time":1},
	{"text":"D’accord… Mais que dois-je y inclure exactement ?","time":1},
	{"text":"Très bien ! Je vais essayer d’en faire un,merci infiniment, Madame Souhir ! Votre aide m’est précieuse.","time":1}
]
func transform():
	for i in range(len(content_text)):
		text = content_text[i]["text"]
		await get_tree().create_timer(content_text[i]["time"]).timeout
	await teacher_talk.techer_talk()
