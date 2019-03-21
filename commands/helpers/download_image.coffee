request = require "request"    
fs = require "fs"

download_image = (uri, filename, callback) ->
    request.head uri, (err, res, body) ->
        console.log "content-type", res.headers["content-type"]
        console.log "content-length", res.headers["content-length"]
        request(uri).pipe(fs.createWriteStream(filename)).on("close", callback)

module.exports =
    image = download_image