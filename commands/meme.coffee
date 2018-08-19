reddit = require "../commands/helpers/reddit_image.coffee"

links = [
    "https://www.reddit.com/r/dankmemes/new.json?limit=100",
    "https://www.reddit.com/r/dankmemes/hot.json?limit=100",
    "https://www.reddit.com/r/coaxedintoasnafu/new.json?limit=100",
    "https://www.reddit.com/r/coaxedintoasnafu/hot.json?limit=100",
    "https://www.reddit.com/r/prequelmemes/new.json?limit=100",
    "https://www.reddit.com/r/prequelmemes/hot.json?limit=100",
    "https://www.reddit.com/r/THE_PACK/new.json?limit=100",
    "https://www.reddit.com/r/cursedimages/new.json?limit=100",
    "https://www.reddit.com/r/cursedimages/hot.json?limit=100",
    "https://www.reddit.com/r/me_irl/new.json?limit=100",
    "https://www.reddit.com/r/me_irl/hot.json?limit=100",
    "https://www.reddit.com/r/2meirl4meirl/new.json?limit=100",
    "https://www.reddit.com/r/2meirl4meirl/hot.json?limit=100"
]

do_command = (client, message, args) ->
    reddit.image client, message, links

module.exports =
    admin: no
    bot: yes
    name: "meme"
    help: "Sends a dank meme."
    func: do_command