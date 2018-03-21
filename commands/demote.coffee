fs = require "fs"

do_command = (client, message, args) ->
    admins = client.admins
    user = message.mentions.members.first();

    unless user?
        return

    client.logger.info "Trying to remove: #{user?.id} (#{user?.username}) from the admin list..."
    
    if user.id in client.admins
        index = admins.indexOf(user.id)
        if index isnt -1
            admins.splice(index, 1)
        fs.writeFile "./data/admins.json", JSON.stringify(admins), "utf8", (err) ->
            if err
                client.logger.warn err
            client.logger.info "Removed #{user.id} (#{user.username}) from the admin list!"
            client.admins = admins
    else
        client.logger.info "#{user.id} (#{user.username}) didnt exist in the admin list!"

module.exports =
    admin: yes
    name: "demote"
    help: "Demotes someone to plebian status."
    func: do_command