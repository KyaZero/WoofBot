do_listen = (client, message) ->
    args = message.content.split " "
    cmd = args[0].toLowerCase()
    args = args.splice 1
    if cmd is "i'm" or cmd is "im"
        if Math.random() > 0.5
            message.channel.send "Hi #{args.join " "}, I'm dad!"

module.exports =
    admin: no
    name: "imdad"
    func: null
    listen: do_listen