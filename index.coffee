Discord = require "discord.js"
fs = require "fs"
log = require "winston"

log.remove log.transports.Console
log.add log.transports.Console, 
    colorize: true
log.level = "debug"

client =
    config: require "./data/config.json"
    auth: require "./data/auth.json"
    logger: log
    bot: new Discord.Client()
    commands: { }
    listeners: [ ]
    admins: require "./data/admins.json"

load_commands = ->
    command_list = fs.readdirSync "./commands/"
    for item in command_list
        if item.match /\.coffee$/
            delete require.cache[require.resolve "./commands/#{item}"]
            command = require "./commands/#{item}"
            client.commands[command.name] = command
            if command.listen?
                client.listeners.push command.listen

load_admins = ->
    client.logger.info "Found #{client.admins.length} admins!"

is_admin = (user) ->
    unless client.admins.length > 0
        return true
    if user.id in client.admins
        return true
    else 
        return false

load_everything = ->
    load_commands()
    load_admins()

client.bot.on "ready", ->
    client.logger.info "Logged in as #{client.bot.user.tag}"
    load_everything()

client.bot.on "debug", (message) ->
    if message.toLowerCase().includes "heartbeat"
        return
    if message.toLowerCase().includes "token"
        return
    client.logger.info message

client.bot.on "guildMemberAdd", (member) ->
    client.logger.info "User #{member.user.username} has joined the server!"
    role = if member.user.bot then message.guild.roles.find "name", "Not Bots" else message.guild.roles.find "name", "Bot Nation"
    member.addRole role 

client.bot.on "message", (message) ->
    for listener in client.listeners
        listener client, message

    if message.content.startsWith client.config.prefix
        args = message.content.slice(client.config.prefix.length).split " "
        cmd = args[0]
        args = args.splice 1
        client.logger.info "#{message.author.tag}: #{client.config.prefix}#{cmd} #{args}"
        if cmd of client.commands
            # if message.author.bot
            #     return client.logger.info "A bot tried to trigger the command #{client.config.prefix}#{cmd}"
            unless client.commands[cmd].func? 
                return
            if (client.commands[cmd].admin and is_admin message.author) or not client.commands[cmd].admin
                client.commands[cmd].func client, message, args
        
client.bot.login client.auth.token