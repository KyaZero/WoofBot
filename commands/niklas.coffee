do_command = (client, message, args) ->
    message.channel.send "https://www.youtube.com/watch?v=f49ELvryhao"

do_listen = (client, message) ->
    if message.content.toLowerCase().includes "niklas" and Math.random < 0.05
        message.channel.send "https://www.youtube.com/watch?v=f49ELvryhao"

module.exports =
    admin: no
    bot: no
    name: "niklas"
    help: "oof"
    func: do_command
    listen: do_listen