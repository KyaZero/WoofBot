fs = require "fs"

do_command = (client, message, args) ->
    # if message.author.bot
    #     return
    admins = client.admins
    user = message.mentions.members.first();
    unless user?
        return

    client.logger.info "Trying to remove: #{user?.id} (#{user?.user.username}) from the admin list..."
    
    if user.id in client.admins
        index = admins.indexOf(user.id)
        if index isnt -1
            admins.splice(index, 1)
        fs.writeFile "./data/admins.json", JSON.stringify(admins), "utf8", (err) ->
            if err
                client.logger.warn err
            client.logger.info "Removed #{user.id} (#{user.user.username}) from the admin list!"
            message.channel.send "`Demoted #{user.user.username} to plebian status.`"
            client.admins = admins
    else
        client.logger.info "#{user.id} (#{user.user.username}) didnt exist in the admin list!"

module.exports =
    admin: yes
    args: "user mention"
    name: "demote"
    help: "Demotes someone to plebian status."
    func: do_command