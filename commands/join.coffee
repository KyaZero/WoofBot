do_command = (client, message, args) ->
    if message.member.voiceChannel
        message.member.voiceChannel.join()

module.exports =
    admin: no
    bot: no
    name: "join"
    help: "Joins your voice channel."
    func: do_command