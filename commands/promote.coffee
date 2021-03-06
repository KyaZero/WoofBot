fs = require "fs"

do_command = (client, message, args) ->
    admins = client.admins
    user = null
    if args.length > 0
        user = message.mentions.members.first().user;
    else
        user = message.author

    unless user?
        return

    client.logger.info "Trying to add: #{user?.id} (#{user?.username}) to the admin list..."

    unless user.id in admins
        admins.push user.id
        fs.writeFile "./data/admins.json", JSON.stringify(admins), "utf8", (err) ->
            if err
                client.logger.warn err
            client.logger.info "Added #{user?.id} (#{user?.username}) to the admin list!"
            message.channel.send "`Promoted #{user?.username} to admin status.`"
            client.admins = admins
    else
        client.logger.info "#{user?.id} (#{user?.username}) was already an admin!"

module.exports =
    admin: yes
    bot: no
    args: "none | user mention"
    name: "promote"
    help: "Promotes someone to admin."
    func: do_command