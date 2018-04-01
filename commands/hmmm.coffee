reddit = require "../commands/helpers/reddit_image.coffee"

links = ["https://www.reddit.com/r/hmmm.json?sort=new", "https://www.reddit.com/r/hmmm.json?sort=hot", "https://www.reddit.com/r/hmmm.json?sort=top"]

do_command = (client, message, args) ->
    reddit.image client, message, links

module.exports =
    admin: no
    bot: yes
    name: "hmmm"
    help: "hmmm."
    func: do_command