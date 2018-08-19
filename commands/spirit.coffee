fs = require "fs"

do_command = (client, message, args) ->
    user = if args.length > 0 then args else message.author.username
    get_line client, (msg) ->
        message.channel.send "#{user}, your spirit animal is: #{msg}"

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
    args: "none | user" #the argument documentation for the command
    name: "spirit" #a command name, what you write to call it
    help: "shows you your spirit animal" #a help message
    func: do_command #do_command
    listen: null #do_listen