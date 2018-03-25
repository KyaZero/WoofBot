do_command = (client, message, args) ->
    embed = []
    for k, v of client.ignored
        guild = client.bot.guilds.get k
        channels = []
        for id in v
            channel = client.bot.channels.get id
            channels.push "##{channel?.name}\n"
        obj = 
            name: "#{guild?.name}"
            value: channels.join ""
        if channels.length > 0
            embed.push obj
    
    if embed.length > 0
        message.channel.send
                "embed":
                    "author":
                        "name": client.bot.user.username
                        "icon_url": client.bot.user.avatarURL
                    "description": "The ignored channels:"
                    "color": 11111111
                    "fields": embed
    else
        message.channel.send "`There were no ignored channels!`"

module.exports =
    admin: no
    bot: yes
    name: "ignored"
    help: "Lists the ignored channels in this bot."
    func: do_command