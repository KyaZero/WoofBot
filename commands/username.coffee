do_command = (client, message, args) ->
    unless args.length > 0
        return
    client.bot.user.setUsername args.join " "

module.exports =
    admin: yes
    bot: yes
    args: "name"
    name: "username"
    help: "Change the bot's username."
    func: do_command