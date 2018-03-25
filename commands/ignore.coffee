fs = require "fs"

do_command = (client, message, args) ->
    ignored = client.ignored
    channel = null
    if args.length > 0
        channel = message.mentions.channels.first()
    else
        channel = if message.channel? then message.channel else null

    unless channel?
        return
    
    client.logger.info "Trying to add #{channel?.id} (#{channel?.name}) to the ignore list"

    for k, v of ignored
        if channel.id in v
            return client.logger.info "#{channel?.id} (#{channel?.name}) was already ignored!"

    if channel.guild.id of ignored
        ignored[channel.guild.id].push channel.id
    else
        ignored[channel.guild.id] = [ channel.id ]

    fs.writeFile "./data/ignorelist.json", JSON.stringify(ignored), "utf8", (err) ->
        if err
            client.logger.warn err
        client.logger.info "Added #{channel?.id} (#{channel?.name}) to the ignore list!"
        message.channel.send "`Added channel: #{channel?.name} to the ignore list.`"
        client.ignored = ignored

module.exports = 
    admin: yes
    bot: no
    args: "none | channel mention"
    name: "ignore"
    help: "Ignores a channel"
    func: do_command