do_command = (client, message, args) ->
    client.volume = args[0]

module.exports =
    bot: no #can the bot run this command?
    args: "number"
    name: "volume"
    help: "Changes the bot's volume"
    func: do_command