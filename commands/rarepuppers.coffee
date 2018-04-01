reddit = require "../commands/helpers/reddit_image.coffee"

links = ["https://www.reddit.com/r/rarepuppers.json?sort=new", "https://www.reddit.com/r/rarepuppers.json?sort=hot", "https://www.reddit.com/r/rarepuppers.json?sort=top"]

do_command = (client, message, args) ->
    reddit.image client, message, links

module.exports =
    admin: no
    bot: yes
    name: "pupper"
    help: "Sends you a rare pupper."
    func: do_command