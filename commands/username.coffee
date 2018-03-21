do_command = (client, message, args) ->
    client.bot.user.setUsername args.join " "

module.exports =
    admin: yes
    name: "username"
    help: "Change the bot's username."
    func: do_command