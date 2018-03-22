do_command = (client, message, args) ->
    if message.author.bot
        return
    try 
        message.channel.send "`#{eval args.join " "}`"
    catch e
        client.logger.error e

module.exports =
    admin: yes
    args: "condition/statement"
    name: "eval"
    help: "Evaluates a condition/statement."
    func: do_command