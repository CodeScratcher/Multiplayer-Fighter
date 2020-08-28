extends Control
func _on_Host_pressed():
	var peer = NetworkedMultiplayerENet.new()
	peer.create_server(3000, 10)

func _on_Join_pressed():
	var peer = NetworkedMultiplayerENet.new()
	peer.create_client($IP.text, 3000)
	print_debug($IP.text)
	get_tree().set_network_peer(peer)

sync func receiveMessage(id, text):
	$Label.text = text
func _on_Send_pressed():
	rpc("recieveMessage", get_tree().get_network_unique_id(), $ToSend.text)
