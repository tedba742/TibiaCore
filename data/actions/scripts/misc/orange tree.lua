function onUse(player, item, fromPosition, target, toPosition)
	item:transform(3744, 1)
	item:decay()
	Game.createItem(3586, 5, fromPosition)
	return true
end
