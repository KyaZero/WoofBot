YTDL = require "ytdl-core"
streamOptions = { seek: 0, volume: 0, bitrate: 48000 };
vc = null
stream = null

do_command = (client, message, args) ->
    streamOptions.volume = client.volume
    streamOptions.seek = if args[1]? then args[1] else "0"
    streamOptions.bitrate = if args[2]? then args[2] else "48000"
    vc = message.member.voiceChannel
    stream = YTDL "https://www.youtube.com/watch?v=#{args[0]}", { filter : 'audioonly', quality: "highest" }
    if vc
        vc.join().then (connection) ->
            dispatcher = connection.playStream stream, streamOptions
            connection.dispatcher.on "end", () ->
                connection.disconnect()

module.exports =
    args: "youtube link after the watch?v= | time in seconds | bitrate 0-48000"
    name: "play"
    help: "Plays songs from youtube"
    func: do_command