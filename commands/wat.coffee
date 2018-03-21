do_listen = (client, message) ->
    if message.content.toLowerCase() == "wat"
        message.channel.fetchMessages(limit: 2).then (msg) ->
            message.channel.send("**" + msg.last().content + "**")

module.exports =
    admin: no
    name: "wat"
    func: null
    listen: do_listen