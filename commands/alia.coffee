YTDL = require "ytdl-core"
streamOptions = { seek: 0, volume: 0 };
vc = null
stream = null
do_command = (client, message, args) ->
    streamOptions.volume = client.volume
    vc = message.member.voiceChannel
    stream = YTDL 'https://www.youtube.com/watch?v=9sMDLv0GxRc', { filter : 'audioonly', quality: "lowest" }
    setTimeout do_meme, 1000

do_meme = () ->
    if vc
        vc.join().then (connection) ->
            dispatcher = connection.playStream stream, streamOptions
            connection.dispatcher.on "end", () ->
                connection.disconnect()

module.exports =
    admin: no
    bot: no
    name: "yeet"
    help: "Summons Ali-A to your voice channel"
    func: do_command