request = require "request"

links = []

get_image = (client, html) ->
    obj = JSON.parse html
    value = {}
    is_comment = false
    unless obj.data?
        return "Reddit machine br0ke"
    rnd = Math.floor Math.random() * obj.data.children.length
    unless obj?.data?.children?.images? or obj.data.children[rnd].data.url.includes(".png") or obj.data.children[rnd].data.url.includes(".jpg")
        src = obj.data.children[rnd].data.url
        if src.toLowerCase().includes "comments"
            src = obj.data.children[rnd].data.selftext
            is_comment = true
    else
        src = obj?.data?.children?[rnd].data.preview?.images[0].source.url
    unless src?
        client.logger.info src
        client.logger.info "its a broke thus we recurse"
        get_image client, html
        return " "
    unless is_comment
        unless src.toLowerCase().includes(".jpg") or src.toLowerCase().includes(".png") or src.toLowerCase().includes(".gif") or src.toLowerCase().includes("gfycat") or src.toLowerCase().includes(".jpeg")
            client.logger.info "#{src} was not an image thus we recurse"
            get_image client, html
            return " "
    value.src = src
    value.is_comment = is_comment
    return value

random_image = (client, message, linkarray) ->
    links = linkarray
    request links[Math.floor Math.random() * links.length], (error, response, html) ->
        if error
            return client.logger.error error
        value = get_image client, html
        src = value.src

        if value.is_comment
            if src.length > 2000
                src = src.substring 0, 2000
            if src is " " or src is ""
                random_image client, message, linkarray
                return " "
            message.channel.send src
            return " "
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