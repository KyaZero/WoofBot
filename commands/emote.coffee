fs = require "fs"

do_command = (client, message, args) ->
    get_line client, (msg) ->
        message.channel.send msg

get_line = (client, callback) ->
    filename = "./data/emotes/emotes.txt"
    if Math.random() > 0.95
        filename = "./data/emotes/classic_emotes.txt"
    fs.readFile filename, "utf8", (err, data) ->
        if err 
            client.logger.error "Error reading file #{filename}, Error: #{err}"
        lines = data.split "\n"
        callback lines[Math.floor Math.random() * lines.length]

module.exports =
    admin: no #is it an admin only command?
    bot: yes #can the bot run this command?
    args: null #the argument documentation for the command
    name: "emote" #a command name, what you write to call it
    help: "sends an emote" #a help message
    func: do_command #do_command
    listen: null #do_listen