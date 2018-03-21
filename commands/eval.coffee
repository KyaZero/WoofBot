do_command = (client, message, args) ->
    try 
        message.channel.send "`#{eval args.join " "}`"
    catch e
        client.logger.error e

module.exports =
    admin: yes
    name: "eval"
    help: "Evaluates a condition/statement."
    func: do_command