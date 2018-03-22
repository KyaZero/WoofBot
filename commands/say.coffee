do_command = (client, message, args) ->
    unless args.length > 0
        return
    message.channel.send args.join " "

module.exports =
    admin: yes
    args: "text"
    name: "say"
    help: "Makes the bot say something"
    func: do_command