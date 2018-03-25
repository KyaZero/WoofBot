fs = require "fs"

do_command = (client, message, args) ->
    ignored = client.ignored
    channel = null
    if args.length > 0
        channel = message.mentions.channels.first()
    else
        channel = if message.channel? then message.channel else null

    unless channel?
        client.logger.info "Returned because channel was null!"
        return

    client.logger.info "Trying to remove #{channel?.id} (#{channel?.name}) from the ignore list"

    for k, v of ignored
        if channel.id in v
            exists = true
    
    unless exists
        client.logger.info "#{channel?.id} (#{channel?.name}) didnt exist in the ignore list!"

    if channel.guild.id of ignored
        index = ignored[channel.guild.id].indexOf(channel.id)
        if index isnt -1
            ignored[channel.guild.id].splice(index, 1)
    else
        client.logger.warn "??????"

    fs.writeFile "./data/ignorelist.json", JSON.stringify(ignored), "utf8", (err) ->
        if err
            client.logger.warn err
        client.logger.info "Removed #{channel?.id} (#{channel?.name}) from the ignore list!"
        message.channel.send "`Started listening to #{channel?.name} again!`"
        client.ignored = ignored

module.exports =
    admin: yes
    bot: no
    args: "none | channel mention"
    name: "listen"
    help: "Listens to a channel again."
    func: do_command