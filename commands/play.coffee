YTDL = require "ytdl-core"
videoInfo = require "youtube-info"
streamOptions = { }
servers = { }

get_info = (song, channel, post) ->
    videoInfo song.id, (err, info) ->
        if err
            console.error err
        minutes = Math.floor info.duration / 60
        seconds = info.duration - (60 * minutes)
        server = servers[channel.guild.id]
        if post
            channel.send "Now playing: #{info.title}. Length: #{minutes}m#{seconds}s"
        song.title = info.title

play = (connection, message) ->
    server = servers[message.guild.id]
    streamOptions = { seek: server.queue[0].seek, volume: server.queue[0].volume, bitrate: server.queue[0].bitrate };
    stream = YTDL server.queue[0].link, { filter : 'audioonly', quality: "highest" }

    get_info server.queue[0], message.channel, yes

    server.dispatcher = connection.playStream stream, streamOptions

    server.queue.shift()

    server.dispatcher.on "end", () ->
        if server.queue[0]
            play connection, message
        else
            connection.disconnect()

do_listen = (client, message) ->
    args = message.content.slice(client.config.prefix.length).split " "
    cmd = args[0].toLowerCase()
    args = args.splice 1
    server = servers[message.guild.id]
    if cmd is "skip"
        if server?.dispatcher
            server.dispatcher.end()
    if cmd is "stop"
        if message.guild.voiceConnection
            message.guild.voiceConnection.disconnect()
    if cmd is "volume"
        if server?.dispatcher
            streamOptions.volume = args[0]
            server.dispatcher.setVolume args[0]
            client.volume = args[0]
            message.channel.send "Volume has been changed to: #{args[0]}"
    if cmd is "queue"
        if server?.dispatcher or server?.queue.length is not 0
            yeet = []
            index = 0
            for song in server.queue
                obj = 
                    name: "Position: #{index}"
                    value: "Title: #{song.title}"
                yeet.push obj
                index += 1
            message.channel.send
                "embed": 
                    "author": 
                        "name": client.bot.user.username
                        "icon_url": client.bot.user.avatarURL
                    "description": "Songs in queue right now:"
                    "color": 11111111
                    "fields": yeet
        else
            return message.channel.send "The queue is empty."
            
do_command = (client, message, args) ->
    if not args[0]
        return message.react "❎" 

    if not (args[0].length is 11)
        return message.react "❎" 

    if not servers[message.guild.id]
        servers[message.guild.id] = {
            queue: []
        }
    
    server = servers[message.guild.id]

    song = 
        link: "https://www.youtube.com/watch?v=#{args[0]}"
        title: "none"
        id: args[0]
        seek: if args[1]? then args[1] else "0"
        bitrate: if args[2]? then args[2] else "48000"
        volume: if args[3]? then args[3] else client.volume

    get_info song, message.channel, no
    server.queue.push song
    message.react "✅"

    if not message.guild.voiceConnection
        message.member.voiceChannel?.join().then (connection) ->
            play connection, message

module.exports =
    bot: yes
    args: "youtube link | time in seconds | bitrate 0-48000 | volume"
    name: "play"
    help: "Plays songs from youtube\n!skip to go to the next song and !stop to stop the bot"
    func: do_command
    listen: do_listen