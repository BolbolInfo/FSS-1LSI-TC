extends Node

@onready var player: CharacterBody2D = %player
@onready var enter: AnimationPlayer = $"../enter"
@onready var go_to_chair: AnimationPlayer = $"../go_to_chair"
@onready var player_sit_back_cos: Sprite2D = $"../PlayerSitBackCos"
@onready var player_enter = %player_enter
@onready var player_enter_teacher = %player_enter_teacher
@onready var choice_1 = %choice_1
@onready var choice_2 = %choice_2

var index = 0
var choice_made = 0  # Tracks which choice the player made

# Dialogue structure [player_choice_1, player_choice_2, hr_response_1, hr_response_2]
var dialog_list = [
	["Merci à vous de me recevoir. Je suis ravi d’être ici.", "eee eeee eee merci beaucoup", 
	 "Installez-vous, mettez-vous à l’aise. Avez-vous trouvé facilement nos locaux ?", 
	 "Installez-vous, mettez-vous à l’aise. Avez-vous trouvé facilement nos locaux ?"],
	
	["Oui, tout s’est bien passé, l’accueil a été très agréable.", "Oui, pas de problème pour trouver, tout était bien indiqué.", 
	 "Parfait ! Nous allons commencer par une présentation rapide. Pouvez-vous me parler de vous et de votre parcours ?", 
	 "Parfait ! Nous allons commencer par une présentation rapide. Pouvez-vous me parler de vous et de votre parcours ?"],

	["Je suis diplômé en informatique, passionné par l’IA et le développement.", 
	 "J’ai fait quelques projets, mais je manque d’expérience professionnelle.", 
	 "Très bien. Pourquoi avez-vous choisi de postuler chez Google ?", 
	 "Je vois… et pourquoi avez-vous choisi de postuler chez Google ?"],

	["J’admire votre culture d’entreprise et vos projets innovants.", 
	 "Je veux un bon salaire et des avantages.", 
	 "Excellente réponse ! Pouvez-vous me donner un exemple d’un problème difficile que vous avez résolu ?", 
	 "Très bien. Pouvez-vous me donner un exemple d’un problème difficile que vous avez résolu ?"],

	["J’ai optimisé des requêtes SQL dans un projet pour réduire le temps de réponse.", 
	 "Je demandais à mes amis de m’aider si j’avais un problème.", 
	 "Très intéressant ! Comment optimiser une recherche dans une base de données volumineuse ?", 
	 "D'accord, compréhensible. Comment optimiser une recherche dans une base de données volumineuse ?"],

	["Indexation, partition des données, caching, et solutions NoSQL.", 
	 "Faire une recherche Google ou utiliser MongoDB.", 
	 "Très bonne réponse ! Vous devez concevoir un algorithme pour détecter des doublons dans une liste d’un million d’éléments.", 
	 "Hmm, c’est une approche simpliste. Vous devez concevoir un algorithme pour détecter des doublons dans une liste d’un million d’éléments."],

	["J’utiliserais un set en Python ou une table de hachage.", 
	 "Je parcourrais toute la liste et comparerais chaque élément.", 
	 "Impressionnant ! Où vous voyez-vous dans cinq ans ?", 
	 "Ce n’est pas optimal. Où vous voyez-vous dans cinq ans ?"],

	["Je veux évoluer chez Google et approfondir mes compétences.", 
	 "Je veux un poste plus élevé et une vie stable.", 
	 "Très bien, Hsan. Avez-vous des questions pour moi ?", 
	 "D'accord, merci. Avez-vous des questions pour moi ?"],

	["Parlez-moi de la culture de travail et des opportunités de formation.", 
	 "Pas de questions, j’attends juste la réponse.", 
	 "Très bonne question ! Nous valorisons l’apprentissage continu.", 
	 "Nous reviendrons vers vous après examen des candidatures."],

	["C’est exactement l’environnement que je recherche.", 
	 "Merci, j’attends votre réponse.", 
	 "Très bien ! Nous vous contacterons sous peu.", 
	 "Merci pour votre temps."]
]

func dialog():
	choice_1.text = dialog_list[index][0]
	choice_2.text = dialog_list[index][1]
	choice_1.disabled = false
	choice_2.disabled = false
	choice_1.visible = true
	choice_2.visible = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	choice_1.visible = false
	choice_2.visible = false
	choice_1.disabled = true
	choice_2.disabled = true

	player.walk_cost()
	enter.play("move")
	await enter.animation_finished

	player.talk_cos()
	player_enter.text = "Bonjour, est ce que je peux entrer?"
	await get_tree().create_timer(2).timeout
	player_enter.text = ""

	player.stop_moving_cos()
	player_enter_teacher.text = "Bonjour, M. Ben Adi ! Bienvenue chez Google et merci d’être venu aujourd’hui."
	await get_tree().create_timer(2).timeout
	player_enter_teacher.text = ""

	player.walk_cost()
	go_to_chair.play("move")
	await go_to_chair.animation_finished

	player.visible = false
	player_sit_back_cos.visible = true

	dialog()

func _on_choice_1_pressed():
	choice_made = 1
	advance_dialog()

func _on_choice_2_pressed():
	choice_made = 2
	advance_dialog()


func advance_dialog():
	choice_1.disabled = true
	choice_2.disabled = true
	choice_1.visible = false
	choice_2.visible = false

	player_enter.text = dialog_list[index][choice_made - 1]
	await get_tree().create_timer(2).timeout
	player_enter.text = ""

	player_enter_teacher.text = dialog_list[index][choice_made + 1]
	await get_tree().create_timer(2).timeout
	player_enter_teacher.text = ""

	index += 1

	if index < dialog_list.size():
		dialog()
	else:
		end_conversation()

func end_conversation():
	player_enter.text = "Merci pour votre temps."
	choice_1.visible = false
	choice_2.visible = false
