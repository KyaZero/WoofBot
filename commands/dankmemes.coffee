reddit = require "../commands/helpers/reddit_image.coffee"

links = [
    "https://www.reddit.com/r/dankmemes.json?sort=new?limit=100",
    "https://www.reddit.com/r/dankmemes.json?sort=hot?limit=100",
    "https://www.reddit.com/r/dankmemes.json?sort=top?limit=100"
]

do_command = (client, message, args) ->
    reddit.image client, message, links

module.exports =
    admin: no
    bot: yes
    name: "meme"
    help: "Sends a dank meme."
    func: do_command