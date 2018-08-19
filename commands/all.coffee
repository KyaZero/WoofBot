

reddit = require "../commands/helpers/reddit_image.coffee"

links = [
    "https://www.reddit.com/r/all/new.json?limit=100"
    ]

do_command = (client, message, args) ->
    reddit.image client, message, links, -1, yes, no

module.exports =
    admin: no
    bot: no
    name: "all"
    help: "Sends something..."
    func: do_command