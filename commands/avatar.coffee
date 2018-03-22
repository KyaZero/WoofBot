do_command = (client, message, args) ->
    if args[0]?.toLowerCase() is "big"
        message.channel.send message.author.avatarURL
    else
        message.channel.send 
            files: [
                message.author.avatarURL.slice 0, message.author.avatarURL.length - 9
            ]
module.exports =
    admin: no
    name: "avatar"
    args: "none | big"
    help: "Sends the link to your avatar."
    func: do_command