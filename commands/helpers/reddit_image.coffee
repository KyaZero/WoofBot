request = require "request"

get_image = (client, html, nr, selftext_allowed, nsfw_allowed, recursion_count = 0) ->
    obj = JSON.parse html
    value = {}
    is_comment = false
    is_selftext = false
    is_nsfw = false
    recursion_count += 1
    if recursion_count > 100
        return "god help us"
    unless obj.data?
        return "Reddit machine br0ke"
    if obj.data?.children is undefined or obj.data?.children.length is 0
        return undefined
    rnd = Math.floor Math.random() * obj.data.children.length
    unless nr is -1
        rnd = nr
    if obj?.data?.children[rnd]?.data?.over_18?
        is_nsfw = true
    unless obj?.data?.children?.images? or not (obj.data.children[rnd].data.url.includes(".png") or obj.data.children[rnd].data.url.includes(".jpg") or obj.data.children[rnd].data.url.includes("imgur"))
        src = obj.data.children[rnd].data.url
        value.title = obj.data.children[rnd].data.title
        if src.toLowerCase().includes "comments"
            src = obj.data.children[rnd].data.selftext
            is_comment = true
    else
        src = obj.data.children[rnd].data.url
        if obj.data.children[rnd].data.selftext.length > 0
            src = obj.data.children[rnd].data.selftext
            value.title = obj.data.children[rnd].data.title
            is_selftext = true
            if not selftext_allowed
                src = null
        # src = obj?.data?.children?[rnd].data.preview?.images[0].source.url
    unless src?
        client.logger.info obj.data.children[rnd].data.url
        client.logger.info "its a broke thus we recurse"
        return get_image client, html, nr, selftext_allowed, nsfw_allowed, recursion_count
    unless is_comment or is_selftext
        unless src.toLowerCase().includes(".jpg") or src.toLowerCase().includes(".png") or src.toLowerCase().includes(".gif") or src.toLowerCase().includes("gfycat") or src.toLowerCase().includes(".jpeg") or src.toLowerCase().includes("osu.ppy.sh/ss/")
            client.logger.info "#{src} was not an image thus we recurse"
            # console.log obj.data.children[rnd]
            return get_image client, html, nr, selftext_allowed, nsfw_allowed, recursion_count

    if is_nsfw and not nsfw_allowed
        client.logger.info "nsfw not allowed so recursing"
        return get_image client, html, nr, selftext_allowed, nsfw_allowed, recursion_count
    value.src = src
    value.is_comment = is_comment
    value.is_selftext = is_selftext
    value.is_nsfw = is_nsfw
    return value

random_image = (client, message, links, nr = -1, nsfw_allowed = yes, selftext_allowed = yes) ->
    request links[Math.floor Math.random() * links.length], (error, response, html) ->
        if error
            return client.logger.error error
        value = get_image client, html, nr, selftext_allowed, nsfw_allowed
        unless value
            return message.channel.send "Unknown subreddit or other error.."
        src = value.src
        title = if value.title? then "`#{value.title}`" else " "

        if value.is_comment or value.is_selftext
            if src.length > 2000
                src = src.substring 0, 1990
            if src is " " or src is ""
                random_image client, message, linkarray
                return " "
            message.channel.send "#{title}\n#{src}"
            return " "
        if src? 
            format = src.substring src.length - 4, src.length
        if format is ".png" or format is ".jpg"
            message.channel.send "#{title}",
                files: [src]
        else if src is " " or src is ""
            random_image client, message, linkarray
        else
            message.channel.send "#{title}\n#{src}"

module.exports =
    image: random_image