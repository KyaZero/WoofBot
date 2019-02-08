reddit = require "../commands/helpers/reddit_image.coffee"

valid_sorting = (arg) ->
    if arg?
        if arg is "hot" or arg is "new" or arg is "top" or arg is "controversial" or arg is "rising" or arg is "gilded"
            return true
        else
            return false
    else
        return false

valid_number = (arg) ->
    if arg?
        if isNaN arg
            return false
        else
            return true
    else
        return false

valid_statement = (arg) ->
    if arg?
        if arg is "yes" or arg is "no"
            return true
        else
            return false
    else
        return false

do_command = (client, message, args) ->
    sr = if args[0]? then args[0] else all
    mode = if valid_sorting args[1] then args[1] else "hot"
    nr = if valid_number args[2] then args[2] else -1
    allow_selftexts = if valid_statement args[3] then args[3] else yes
    links = [
        "https://www.reddit.com/r/#{sr}/#{mode}.json?limit=100"
    ]
    nsfw_allowed = false
    if message.channel.name.toLowerCase().includes("nsfw") or message.channel.nsfw
        nsfw_allowed = true
    reddit.image client, message, links, nr, nsfw_allowed

module.exports =
    admin: no
    bot: yes
    args: "subreddit name | new/hot/top | optionally post number | allow selftexts yes/no"
    name: "sr"
    help: "Crawls reddit for you."
    func: do_command