do_command = (client, message, args) ->
    message.reply "pong!"

module.exports =
    admin: no
    name: "ping"
    help: "Sends a pong."
    func: do_command