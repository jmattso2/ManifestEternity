class_name Card
extends Resource

enum Type {MOVEMENT, ATTACK, UTILITY}
enum Target {SHIP, DEPLOY_SPACE, PLANET, ENEMY, ANY, NONE}

@export_group("Card Attributes")
@export var id: String
@export var type: Type
@export var target: Target
@export var cost: int
@export var quantity: int
@export var image: CompressedTexture2D
