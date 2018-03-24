do_command = (client, message, args) ->
    if args[0]?.toLowerCase() is "big"
        message.channel.send if message.author.avatarURL? then message.author.avatarURL else "no avatar sry"
    else
        message.channel.send if message.author.avatarURL? then files: [ message.author.avatarURL.slice 0, message.author.avatarURL.length - 9 ] else "no avatar sry"
        
module.exports =
    admin: no
    bot: yes
    name: "avatar"
    args: "none | big"
    help: "Sends the link to your avatar."
    func: do_command