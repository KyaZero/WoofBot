request = require "request"
fs = require "fs"
download = require "../commands/helpers/download_image.coffee"

do_command = (client, message, args) ->
    if args.length is 0
        return message.channel.send "You need to use this command with a link"
    request.post
        url: "https://api.remove.bg/v1.0/removebg"
        formData: 
            image_url: args[0]
            size: "auto"
        headers: 
            "X-Api-Key": client.auth.remove_bg_apikey
        encoding: null
        (error, response, body) ->
            if error 
                return console.error "request failed: ", error
            if response.statusCode != 200
                return console.error "error: ", response.statusCode, body.toString "utf8"
            message.channel.send "",
                files: [body]

module.exports =
    admin: no
    bot: no
    args: "image link"
    name: "removebg"
    help: "Removes the background of an image"
    func: do_command