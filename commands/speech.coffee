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
    if message.content.toLowerCase() in message_triggers or Math.random() < 0.1 or message.content.toLowerCase() is lastmessage?.toLowerCase()
        return true 
    else
        return false

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
    unless message.channel.guild is undefined or message.author.bot
        if is_trigger message
            get_line client, (msg) ->
                if msg is " " or msg is "" or (msg.split " ").length > 15 or msg.substr 0, 1 is client.config.prefix
                    try
                        client.logger.info "Re-rolled a bad message. Message: #{msg}"
                        do_listen client, message
                        return
                    catch e
                        client.logger.error e
                try
                    if new RegExp("([a-zA-Z0-9]+://)?([a-zA-Z0-9_]+:[a-zA-Z0-9_]+@)?([a-zA-Z0-9.-]+\\.[A-Za-z]{2,4})(:[0-9]+)?(/.*)?").test msg or msg.includes ":"
                        message.channel.send "#{msg}"
                    else
                        message.channel.send "#{msg.toLowerCase()}"
                catch e
                    client.logger.error e
                lastmessage = msg

module.exports =
    listen: do_listen