fs = require "fs"

logspath = "./data/channel_logs/"

write_messages = (client, id, message) ->
    unless id?
        id = message.id
    fs.open "#{logspath}#{message.channel.guild.name}_#{message.channel.name}.txt", "a", (err, fd) ->
        if err
            client.logger.error "Error thrown while trying to open file: #{logspath}#{message.channel.guild.name}_#{message.channel.name}.txt"
        lastmsg = null
        message.channel.fetchMessages(limit: 100, before: id).then (messages) ->
            messages.array().forEach (msg, nr, array) ->
                if msg.author.id is client.bot.user.id
                    return
                fs.appendFile "#{logspath}#{message.channel.guild.name}_#{message.channel.name}.txt", array[nr].content + "\n", (err) ->
                    if err
                        client.logger.error "Error thrown while trying to append file: #{logspath}#{message.channel.guild.name}_#{message.channel.name}.txt"
            lastmsg = messages.last()
            if lastmsg is undefined
                return
            lastID = lastmsg.id
            fs.close fd, (err) ->
                if err
                    client.logger.error "Error thrown while trying to close file: #{logspath}#{message.channel.guild.name}_#{message.channel.name}.txt"
            write_messages client, lastID, message

do_command = (client, message, args) ->
    fs.open "#{logspath}#{message.channel.guild.name}_#{message.channel.name}.txt", 'w', (err, fd) ->
        if err
            client.logger.error err
        else
            client.logger.info "Wrote to #{logspath}#{message.channel.guild.name}_#{message.channel.name}.txt"
        fs.close fd, (err) ->
            if err
                client.logger.error err
    write_messages client, message.id, message

do_listen = (client, message) ->
    fs.open "#{logspath}#{message.channel.guild.name}_#{message.channel.name}.txt", "a+", (err, fd) ->
        if err
            client.logger.error "Error thrown while trying to open file: #{logspath}#{message.channel.guild.name}_#{message.channel.name}.txt"
        if message.author.id is client.bot.user.id
            return
        fs.appendFile "#{logspath}#{message.channel.guild.name}_#{message.channel.name}.txt", message + "\n", (err) ->
                if err
                    client.logger.error "Error thrown while trying to append file: #{logspath}#{message.channel.guild.name}_#{message.channel.name}.txt"
        fs.close fd, (err) ->
                if err
                    client.logger.error "Error thrown while trying to close file: #{logspath}#{message.channel.guild.name}_#{message.channel.name}.txt"

module.exports =
    admin: no
    bot: no
    name: "addchannel"
    help: "Adds the channel logs to the bot's vocabulary"
    func: do_command
    listen: do_listen