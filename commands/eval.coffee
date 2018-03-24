do_command = (client, message, args) ->
    try 
        message.channel.send "`#{eval args.join " "}`"
    catch e
        client.logger.warn "#{message.author.tag}: \"#{client.config.prefix}eval #{args}\" caused the error: #{e}"

module.exports =
    admin: yes
    bot: no
    args: "condition/statement"
    name: "eval"
    help: "Evaluates a condition/statement."
    func: do_command