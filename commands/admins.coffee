do_command = (client, message, args) ->
    admins = []
    for id in client.admins
        obj = 
            name: "#{client.bot.users.get(id)?.tag}"
            value: "-------------------------------"
        admins.push obj
    message.channel.send
            "embed":
                "author":
                    "name": client.bot.user.username
                    "icon_url": client.bot.user.avatarURL
                "description": "The admins:"
                "color": 11111111
                "fields": admins

module.exports =
    admin: no
    bot: yes
    name: "admins"
    help: "Lists the admins of this bot."
    func: do_command