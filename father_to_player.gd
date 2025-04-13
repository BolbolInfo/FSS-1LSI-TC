extends Label

var content_text=[
	{"text":"Félicitations, mon fils ! C’est une belle opportunité. Ne t’inquiète pas, avec une bonne préparation, tout se passera bien. As-tu déjà fait des recherches sur l’entreprise ?","time":1},
	{"text":"C’est un bon début. En général, dans un entretien, il y a trois types de questions :","time":1},
	{"text":"1)Les questions personnelles : Parle-moi de toi, quelles sont tes forces et faiblesses ?","time":1},
	{"text":"2)Les questions techniques : Elles testeront tes compétences en informatique.","time":1},
	{"text":"3)Les questions comportementales : Par exemple, 'Comment gères-tu le stress ?' ou 'As-tu déjà travaillé en équipe sur un projet difficile ?'.","time":1},
	{"text":"Pour les questions personnelles, sois clair et structuré. Mets en avant tes compétences et tes expériences, même académiques.","time":1},
	{"text":"Pour les questions techniques, révise bien tes bases et entraîne-toi à résoudre des problèmes. Google aime les candidats qui réfléchissent à voix haute et expliquent leur raisonnement.","time":1},
	{"text":"Pour les questions comportementales, utilise la méthode STAR :","time":1},
	{"text":"Situation : Décris le contexte.","time":1},
	{"text":"Tâche : Explique ton rôle.","time":1},
	{"text":"Action : Dis ce que tu as fait.","time":1},
	{"text":"Résultat : Parle des résultats obtenus.","time":1},
	{"text":"Sois poli, souriant et confiant. Regarde ton interlocuteur dans les yeux et parle avec assurance. Surtout, écoute bien les questions avant de répondre","time":1},
	{"text":"Dis que tu es passionné par la technologie et que tu admires leur innovation. Montre que tu as bien compris leur culture et que tu aimerais contribuer à leurs projets.","time":1},
	{"text":"C’est bien, mon fils. Je suis sûr que tu vas réussir. Bonne chance !","time":1}
]


func father_to_player():
	for i in range(len(content_text)):
		text = content_text[i]["text"]
		await get_tree().create_timer(content_text[i]["time"]).timeout
func _process(delta: float) -> void:
	if text=="":
		visible = false
	else:
		visible=true
