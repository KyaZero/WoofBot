round = 1
chance = 1/6

make_emoji = (num) ->
    switch num
        when 1
            ":one:"
        when 2
            ":two:"
        when 3
            ":three:"
        when 4
            ":four:"
        when 5
            ":five:"
        when 6
            ":six:"
        when 7
            ":seven:"
        when 8
            ":eight:"
        when 9
            ":nine:"
        else
            "i br0ke"

do_command = (client, message, args) ->
    unless Math.random() < chance
        message.channel.send "#{if args? then args.join " " else }" + " " + make_emoji(round++) + " " + ":gun:"
        chance += 1/6
    else
        message.channel.send "#{if args? then args.join " " else }" + " " + ":boom:" + " " + ":gun:"
        round = 1
        chance = 1/6

module.exports =
    admin: no
    bot: yes
    args: "none | text"
    name: "revolver"
    help: "Play a game of russian roulette!"
    func: do_command