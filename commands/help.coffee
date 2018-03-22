do_command = (client, message, args) ->
    cmd = args[0]
    if args.length > 0
        if cmd of client.commands and client.commands[cmd].help
            message.channel.send "`#{client.config.prefix + cmd} #{if client.commands[cmd].args? then "(" + client.commands[cmd].args + ") " else ""}: \"#{client.commands[cmd].help}\"`"
        else 
            message.channel.send "`There is no command with the name \"#{cmd}\"!`"
    else
        unless Object.keys(client.commands).length > 0
            return
        help = []
        for name, command of client.commands
            if command.help
                obj = 
                    name: "#{client.config.prefix + name} #{if command.args? then "(" + command.args + ")" else ""}"
                    value: "#{command.help} #{if command.admin is yes then "(Admin Only!)" else ""}"
                help.push obj
        message.channel.send 
            "embed": 
                "author": 
                    "name": client.bot.user.username
                    "icon_url": client.bot.user.avatarURL
                "description": "The commands you can use!"
                "color": 11111111
                "fields": help

module.exports =
    admin: no
    args: "none | command"
    name: "help"
    help: "Gives some information about a command!"
    func: do_command