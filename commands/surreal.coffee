reddit = require "../commands/helpers/reddit_image.coffee"

links = ["https://www.reddit.com/r/surrealmemes.json?sort=new", "https://www.reddit.com/r/surrealmemes.json?sort=hot", "https://www.reddit.com/r/surrealmemes.json?sort=top"]

do_command = (client, message, args) ->
    reddit.image client, message, links

module.exports =
    admin: no
    bot: yes
    name: "surreal"
    help: "Sends you a surreal meme."
    func: do_command