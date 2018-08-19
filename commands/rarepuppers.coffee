reddit = require "../commands/helpers/reddit_image.coffee"

links = [
    "https://www.reddit.com/r/rarepuppers/hot.json?limit=100",
    "https://www.reddit.com/r/rarepuppers/top.json?limit=100"
    ]

do_command = (client, message, args) ->
    reddit.image client, message, links

module.exports =
    admin: no
    bot: yes
    name: "pupper"
    help: "Sends you a rare pupper."
    func: do_command