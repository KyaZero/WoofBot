do_command = (client, message, args) ->
    #you get here when the command is called
    
do_listen = (client, message) ->
    #you get here whenever a message is received by the bot

module.exports =
    admin: no #is it an admin only command?
    bot: no #can the bot run this command?
    args: null #the argument documentation for the command
    name: null #a command name, what you write to call it
    help: null #a help message
    func: null #do_command
    listen: null #do_listen