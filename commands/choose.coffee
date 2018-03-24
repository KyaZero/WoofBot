do_command = (client, message, args) ->
    unless args.length > 0
        return
    choices = (args.join " ").split ","
    message.channel.send choices[Math.floor Math.random() * choices.length]

module.exports =
    admin: no
    bot: yes
    args: "comma-separated text"
    name: "choose"
    help: "Let the bot pick something."
    func: do_command