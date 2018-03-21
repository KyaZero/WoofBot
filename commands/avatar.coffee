do_command = (client, message, args) ->
    message.reply message.author.avatarURL

module.exports =
    admin: no
    name: "avatar"
    help: "Sends the link to your avatar."
    func: do_command