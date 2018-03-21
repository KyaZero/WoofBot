do_command = (client, message, args) ->
    message.channel.send args.join " "

module.exports =
    admin: yes
    name: "say"
    help: "Makes the bot say something"
    func: do_command