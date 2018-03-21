do_command = (client, message, args) ->
    message.channel.send "#{message.author.username} was created at: #{message.author.createdAt}"

module.exports =
    admin: no
    name: "when"
    help: "Tells you when your account was made"
    func: do_command