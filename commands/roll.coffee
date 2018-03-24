do_command = (client, message, args) ->
    if args[0]?
        nr = unless isNaN args[0] then args[0] else 100
    else
        nr = 100
        
    if message.content.toLowerCase().includes "chance" or message.content.toLowerCase().includes "odds"
        percent = true
        nr = 100
    else 
        percent = false

    if nr < 0 then nr = 0
    message.channel.send "#{message.author.username} rolled #{Math.round(Math.random() * (nr))}#{if percent then "%!" else " points!"}"

module.exports =
    admin: no
    bot: yes
    args: "none | number | chance/odds"
    name: "roll"
    help: "Rolls a random number"
    func: do_command