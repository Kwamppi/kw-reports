ESX = exports["es_extended"]:getSharedObject()

function sendDiscordWebhook(message)
    local discordWebhookUrl = "WEBHOOK-HERE"

    local data = {
        content = message
    }

    PerformHttpRequest(discordWebhookUrl, function(err, text, headers)
    end, 'POST', json.encode(data), { ['Content-Type'] = 'application/json' })
end

RegisterCommand('report', function(source, args, rawCommand)

        local fullMessage = ""

        for k, v in pairs(args) do 
            fullMessage = fullMessage .. " " ..    v
        end

        local UserName = GetPlayerName(source)
        local DiscordIdentifier = GetPlayerIdentifierByType(source, 'discord')
        local RockstarIdentifier = GetPlayerIdentifierByType(source, 'license')
        local SteamIdentifier = GetPlayerIdentifierByType(source, 'steam')
        local DataAndTime = os.date("%d.%m.%Y at %H:%M")
        local discordMessage = '**send new log:**\n     Player: <@' .. DiscordIdentifier:gsub('discord:', '') .. '> send report'.. '\n     [Report info]: ' .. fullMessage:gsub(':', '') .. '' .. '\n       - Other Player data' .. '\n - [License]: ' .. RockstarIdentifier:gsub(':', '') .. '' .. '\n  - [Steam]: ' .. SteamIdentifier:gsub(':', '') .. '' .. '\n  - [Date and time]: ' .. DataAndTime:gsub('::', '') .. '' .. '\n  - [Playername]: ' .. UserName:gsub(':', '') .. ''
        sendDiscordWebhook(discordMessage)
end)
