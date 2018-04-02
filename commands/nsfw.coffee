reddit = require "../commands/helpers/reddit_image.coffee"

links = [
    "https://www.reddit.com/r/60fpsporn+Amateur+AmateurArchives+AnalPorn+Annoyedtobenude+AsianHotties+AsianHottiesGIFS+AsiansGoneWild+BeefFlaps+BigBoobsGW+Blondes+Blowjobs+Bondage+Boobies+Bottomless_Vixens+BrickHouse+BubbleButts+BustyPetite+CandidFashionPolice+Celebs+ChangingRooms+CollegeAmateurs+CosplayBoobs+Cumonin+DarkAngels+FTVgirls+FestivalSluts+Fingering+GWCouples+GWNerdy+Gingerpuss+GirlsFinishingTheJob+GirlsPlayingSports+GirlswithGlasses+GoneMild+HENTAI_GIF+HappyEmbarrassedGirls+HighHeels+Hot_Women_Gifs+Hotchickswithtattoos+JiggleFuck+LaundryDay+LegalTeens+LipsThatGrip+Models+MoxiiAndFriends+NSFW_Wallpapers+NSFW_nospam+Nipples+NoBSNSFW+NotSafeForNature+O_Faces+OnOff+Orgasms+PetiteGoneWild+Pics_NSFW+PornStars+PublicFlashing+RealGirls+SceneGirls+SexiestPetites+Smokin+SoFuckable+SocialMediaSluts+StealthVibes+Sukebei+Tgirls+TightShorts+TinyTits+TittyDrop+Unashamed+Upskirt+VolleyballGirls+WatchItForThePlot+WomenOfColor+WtSSTaDaMiT+XXX_Animated_Gifs+YogaPants+adultgifs+altgonewild+anal+ass+ass_cleavage+asshole+asslick+asstastic+beach+bikinibridge+boltedontits+boyshorts+braceface+burstingout+buttsex+camwhores+celebnsfw+cfnf+chixxx_gifs+cleavage+collegesluts+cosplaygirls+creampies+cumfetish+cumshot+cumsluts+datass+datgap+datgrip+dirtysmall+ecchi+facedownassup+femalepov+fitgirls+forcedorgasms+fuckyeahsexyteens+funsized+fuxtaposition+ginger+girlsflashing+girlsinyogapants+girlskissing+gloryhole+gonewild+gothsluts+happygaps+hardbodies+hentai+holdthemoan+hugeboobs+iWantToFuckHer+jilling+juicyasians+kpopfap+latinas+lesbian_pov+lesbians+lingerie+mandingo+milf+nsfw+nsfw2+nsfw_gifs+nsfwhardcore+nsfwoutfits+palegirls+panties+pantsu+passionx+pigtails+pinkshoes+pokies+porn+porninfifteenseconds+primes+pussy+randomsexiness+realbikinis+redheads+rule34+russiangirls+serafuku+sheerpanties+shewantstofuck+skinnytail+skivvies+slutsbedrunk+snapchat_sluts+snowgirls+suicidegirls+tanlines+thick+thighhighs+tightdresses+tits+trashyboners+treatemright+undies+videogamebabes+voluptuous+wifesharing+workgonewild+xart+xsmallgirls+yuri.json?sort=hot?limit=100",
    "https://www.reddit.com/r/60fpsporn+Amateur+AmateurArchives+AnalPorn+Annoyedtobenude+AsianHotties+AsianHottiesGIFS+AsiansGoneWild+BeefFlaps+BigBoobsGW+Blondes+Blowjobs+Bondage+Boobies+Bottomless_Vixens+BrickHouse+BubbleButts+BustyPetite+CandidFashionPolice+Celebs+ChangingRooms+CollegeAmateurs+CosplayBoobs+Cumonin+DarkAngels+FTVgirls+FestivalSluts+Fingering+GWCouples+GWNerdy+Gingerpuss+GirlsFinishingTheJob+GirlsPlayingSports+GirlswithGlasses+GoneMild+HENTAI_GIF+HappyEmbarrassedGirls+HighHeels+Hot_Women_Gifs+Hotchickswithtattoos+JiggleFuck+LaundryDay+LegalTeens+LipsThatGrip+Models+MoxiiAndFriends+NSFW_Wallpapers+NSFW_nospam+Nipples+NoBSNSFW+NotSafeForNature+O_Faces+OnOff+Orgasms+PetiteGoneWild+Pics_NSFW+PornStars+PublicFlashing+RealGirls+SceneGirls+SexiestPetites+Smokin+SoFuckable+SocialMediaSluts+StealthVibes+Sukebei+Tgirls+TightShorts+TinyTits+TittyDrop+Unashamed+Upskirt+VolleyballGirls+WatchItForThePlot+WomenOfColor+WtSSTaDaMiT+XXX_Animated_Gifs+YogaPants+adultgifs+altgonewild+anal+ass+ass_cleavage+asshole+asslick+asstastic+beach+bikinibridge+boltedontits+boyshorts+braceface+burstingout+buttsex+camwhores+celebnsfw+cfnf+chixxx_gifs+cleavage+collegesluts+cosplaygirls+creampies+cumfetish+cumshot+cumsluts+datass+datgap+datgrip+dirtysmall+ecchi+facedownassup+femalepov+fitgirls+forcedorgasms+fuckyeahsexyteens+funsized+fuxtaposition+ginger+girlsflashing+girlsinyogapants+girlskissing+gloryhole+gonewild+gothsluts+happygaps+hardbodies+hentai+holdthemoan+hugeboobs+iWantToFuckHer+jilling+juicyasians+kpopfap+latinas+lesbian_pov+lesbians+lingerie+mandingo+milf+nsfw+nsfw2+nsfw_gifs+nsfwhardcore+nsfwoutfits+palegirls+panties+pantsu+passionx+pigtails+pinkshoes+pokies+porn+porninfifteenseconds+primes+pussy+randomsexiness+realbikinis+redheads+rule34+russiangirls+serafuku+sheerpanties+shewantstofuck+skinnytail+skivvies+slutsbedrunk+snapchat_sluts+snowgirls+suicidegirls+tanlines+thick+thighhighs+tightdresses+tits+trashyboners+treatemright+undies+videogamebabes+voluptuous+wifesharing+workgonewild+xart+xsmallgirls+yuri.json?sort=new?limit=100"
    "https://www.reddit.com/r/nsfw.json?sort=new?limit=100",
    "https://www.reddit.com/r/nsfw.json?sort=hot?limit=100",
    "https://www.reddit.com/r/asiansgonewild.json?sort=new?limit=100",
    "https://www.reddit.com/r/asiansgonewild.json?sort=hot?limit=100",
    "https://www.reddit.com/r/petitegonewild.json?sort=new?limit=100",
    "https://www.reddit.com/r/petitegonewild.json?sort=hot?limit=100",
    "https://www.reddit.com/r/cosplaygirls.json?sort=new?limit=100",
    "https://www.reddit.com/r/cosplaygirls.json?sort=hot?limit=100",
    "https://www.reddit.com/r/nsfwcosplay.json?sort=new?limit=100",
    "https://www.reddit.com/r/nsfwcosplay.json?sort=hot?limit=100",
    "https://www.reddit.com/r/gonewild.json?sort=new?limit=100",
    "https://www.reddit.com/r/gonewild.json?sort=hot?limit=100",
    "https://www.reddit.com/r/hentai.json?sort=new?limit=100",
    "https://www.reddit.com/r/hentai.json?sort=hot?limit=100",
    "https://www.reddit.com/r/ecchi.json?sort=new?limit=100",
    "https://www.reddit.com/r/ecchi.json?sort=hot?limit=100"
    ]

do_command = (client, message, args) ->
    unless message.channel.name.toLowerCase().includes("nsfw")
        return message.channel.send "You cannot use this command in a non-nsfw channel! Call this command in a channel that has nsfw in the channel name!"
    reddit.image client, message, links

module.exports =
    admin: no
    bot: no
    name: "nsfw"
    help: "Sends nudes."
    func: do_command