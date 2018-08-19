reddit = require "../commands/helpers/reddit_image.coffee"

links = [
    "https://www.reddit.com/r/cursedimages/new.json?limit=100",
    "https://www.reddit.com/r/cursedimages/hot.json?limit=100"
]

do_command = (client, message, args) ->
    reddit.image client, message, links

module.exports =
    admin: no
    bot: yes
    name: "cursed"
    help: "cursed images... hmm"
    func: do_command