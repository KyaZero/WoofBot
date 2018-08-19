do_command = (client, message, args) ->
    client.bot.user.setActivity args[2], { url: args[0], type: args[1] }

module.exports =
    admin: yes
    bot: yes
    args: "URL | PLAYING/STREAMING/LISTENING/WATCHING | Activity"
    name: "activity"
    help: "Changes the bot's activity"
    func: do_command