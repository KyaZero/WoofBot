request = require "request"

links = []

get_image = (client, html) ->
    obj = JSON.parse html
    rnd = Math.floor Math.random() * obj.data.children.length
    unless obj?.data?.children?.images? or obj.data.children[rnd].data.url.includes ".png" or obj.data.children[rnd].data.url.includes ".jpg"
        src = obj.data.children[rnd].data.url
    else
        src = obj?.data?.children?[rnd].data.preview?.images[0].source.url
    unless src?
        client.logger.info src
        client.logger.info "its a broke thus we recurse"
        get_image client, html
        return " "
    unless src.toLowerCase().includes(".jpg") or src.toLowerCase().includes(".png") or src.toLowerCase().includes(".gif")
        client.logger.info "#{src} was not an image thus we recurse"
        get_image client, html
        return " "
    return src

random_image = (client, message, linkarray) ->
    links = linkarray
    request links[Math.floor Math.random() * links.length], (error, response, html) ->
        if error
            return client.logger.error error
        src = get_image client, html
        format = src.substring src.length - 4, src.length
        if format is ".png" or format is ".jpg"
            message.channel.send
                files: [src]
        else if src is " " or src is ""
            random_image client, message, linkarray
        else
            message.channel.send src

module.exports =
    image: random_image