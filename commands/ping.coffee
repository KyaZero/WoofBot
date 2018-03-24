do_command = (client, message, args) ->
    message.reply "pong!"

module.exports =
    admin: no
    bot: yes
    name: "ping"
    help: "Sends a pong."
    func: do_command