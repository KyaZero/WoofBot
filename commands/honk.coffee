do_listen = (client, message) ->
    args = message.content.split " "
    cmd = args[0].toLowerCase()
    args = args.splice 1
    if cmd is "honk"
        message.channel.send "get honked #{if args[0]? then args[0] else message.author.username} HONK ()>o <:kannaSUCC:306845931712675840>"

module.exports =
    listen: do_listen