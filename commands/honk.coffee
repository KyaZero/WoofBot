do_listen = (client, message) ->
    args = message.content.split " "
    cmd = args[0].toLowerCase()
    args = args.splice 1
    if cmd is "honk"
        message.channel.send "Get honked #{if args[0]? then args[0] else message.author.username} HONK ()>o"

module.exports =
    listen: do_listen