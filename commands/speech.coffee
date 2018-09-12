fs = require "fs"

message_triggers = [
    "bot", 
    "boi",
    "oof",
    "owo",
    "haha",
    "woke"
]

lastmessage = null

is_trigger = (message) -> 
    for msg in message_triggers
        if message.content.toLowerCase().includes(msg.toLowerCase()) or Math.random() < 0.01 or message.content.toLowerCase() is lastmessage?.toLowerCase()
            return true 
    return false                

get_emote = (client, callback) ->
    filename = "./data/emotes/emotes.txt"
    if Math.random() > 0.95
        filename = "./data/emotes/classic_emotes.txt"
    fs.readFile filename, "utf8", (err, data) ->
        if err 
            client.logger.error "Error reading file #{filename}, Error: #{err}"
        lines = data.split "\n"
        callback lines[Math.floor Math.random() * lines.length]

okay_message = (msg, prefix) ->
    if not ((msg is " ") or (msg is "") or ((msg.split " ").length > 15) or ((msg.split " ").length < 2) or (msg.substr 0, 1 is prefix) or (msg.substr 0, 1 is ".") or (msg.substr 0, 1 is "+"))
        ok = yes
    if msg.includes "`"
        ok = no
    return ok

get_line = (client, callback) ->
    filename = "./data/channel_logs/"
    files = fs.readdirSync "./data/channel_logs/"
    unless files.length > 0
        client.logger.warn "There were no channels in #{filename}"
        return
    randfile = files[Math.floor Math.random() * files.length]
    filename += randfile
    fs.readFile filename, "utf8", (err, data) ->
        if err 
            client.logger.error "Error reading file #{filename}, Error: #{err}"
        lines = data.split "\n"
        callback lines[Math.floor Math.random() * lines.length]

do_listen = (client, message) ->
    unless message_triggers.includes client.bot.user.username
        message_triggers.push client.bot.user.username
    unless message.channel.guild is undefined or message.author.bot
        if is_trigger message
            get_line client, (msg) ->
                if not okay_message msg, client.config.prefix
                    try
                        client.logger.info "Re-rolled a bad message. Message: #{if (msg.split " ").length > 15 then "[long message]" else if (msg.split " ").length < 2 then "[short message]" else if (msg is " " or msg is "") then "[empty message]" else msg}"
                        do_listen client, message
                        return
                    catch e
                        client.logger.error e
                try
                    if new RegExp("([a-zA-Z0-9]+://)?([a-zA-Z0-9_]+:[a-zA-Z0-9_]+@)?([a-zA-Z0-9.-]+\\.[A-Za-z]{2,4})(:[0-9]+)?(/.*)?").test msg or msg.includes ":"
                        message.channel.send "#{msg}"
                    else
                        get_emote client, (emote) ->
                            message.channel.send "#{msg} #{if Math.random() > 0.5 then emote else ""}"
                catch e
                    client.logger.error e
                lastmessage = msg

module.exports =
    bot: yes
    listen: do_listen