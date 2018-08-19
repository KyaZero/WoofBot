do_command = (client, message, args) ->
    message.member.voiceChannel.leave()

module.exports =
    admin: no
    bot: no
    name: "leave"
    help: "Leaves your voice channel."
    func: do_command