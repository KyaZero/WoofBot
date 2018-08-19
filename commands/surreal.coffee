reddit = require "../commands/helpers/reddit_image.coffee"

links = [
    "https://www.reddit.com/r/surrealmemes/new.json?limit=100",
    "https://www.reddit.com/r/surrealmemes/hot.json?limit=100"
    ]

do_command = (client, message, args) ->
    reddit.image client, message, links

module.exports =
    admin: no
    bot: yes
    name: "surreal"
    help: "Sends you a surreal meme."
    func: do_command