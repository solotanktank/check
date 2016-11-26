--[[ All In One GOS
    Script dùng để tổng hợp tất cả các script hiện tại của tool GOS.
    Trang chủ GOS: gamingonsteroids.com
    Script được viết bởi NAV. Khi copy/di chuyển vui lòng để lại nguồn
--------------------------------------------------------------------------------]]
local STH_Ver = 0.01
local function STH_Print(text)
    PrintChat(string.format("<font color=\"#4169E1\"><b>[Script TongHop]:</b></font><font color=\"#FFFFFF\"> %s</font>",tostring(text)))
end
local function STH_Require(str) assert(FileExist(SCRIPT_PATH..str..".lua"), "\nKhong tim thay file '"..SCRIPT_PATH..str..".lua'\nVui long download script nay hoac chon script khac") require(str) end


local ScriptData = {
    ["Aatrox"] = {
        [1] = {"CSR Aatrox", "SL Aatrox"},
        [2] = {"ChallengerSeriesReborn", "SL-AIO"}
    },

    ["Ahri"] = {
        [1] = {"CSR Ahri", "SL Ahri"},
        [2] = {"ChallengerSeriesReborn", "SL-AIO"}
    },

    ["Akali"] = {
        [1] = {"CSR Akali", "Eternal Akali"},
        [2] = {"ChallengerSeriesReborn", "EternalAIO"}
    },

    ["Alistar"] = {
        [1] = {"CSR Alistar"},
        [2] = {"ChallengerSeriesReborn"}
    },

    ["Amumu"] = {
        [1] = {"CSR Amumu"},
        [2] = {"ChallengerSeriesReborn"}
    },

    ["Annie"] = {
        [1] = {"NS Annie", "PAMR Annie" },
        [2] = {"NEETSeries", "annie"}
    },

    ["Anivia"] = {
        [1] = {"SL Anivia"},
        [2] = {"SL-AIO" }
    },

    ["Ashe"] = {
        [1] = {"CSR Ashe", "ADCMain Ashe"},
        [2] = {"ChallengerSeriesReborn", "ADC Main"}
    },

    ["Azir"] = {
        [1] = {"CSR Azir"},
        [2] = {"ChallengerSeriesReborn"}
    },

    ["Bard"] = {
        [1] = {"Bard Bae"},
        [2] = {"bardBae"}
    },

    ["Blitzcrank"] = {
        [1] = {"CSR Blitzcrank", "SL Blitzcrank", "SPBundle Blitzcrank"},
        [2] = {"ChallengerSeriesReborn", "SL-AIO", "Support Bundle"}
    },

    ["Brand"] = {
        [1] = {"CSR Brand", "NFSS Brand"},
        [2] = {"ChallengerSeriesReborn", "Brand_NFSS"}
    },

    ["Braum"] = {
        [1] = {"SPBundle Braum"},
        [2] = {"Support Bundle"}
    },

    ["Caitlyn"] = {
        [1] = {"ADCMain Caitlyn"},
        [2] = {"ADC Main"}
    },

    ["Cassiopeia"] = {
        [1] = {"Salami Cassiopeia"},
        [2] = {"SalamiSeries-Cassiopeia"}
    },

    ["ChoGath"] = {
        [1] = {"TerrorVoid ChoGath"},
        [2] = {"ChoGath"}
    },

    ["Corki"] = {
        [1] = {"ADCMain Corki"},
        [2] = {"ADC Main"}
    },

    ["Draven"] = {
        [1] = {"CSR Draven", "SL Draven"},
        [2] = {"ChallengerSeriesReborn", "SL-AIO"}
    },

    ["Evelynn"] = {
        [1] = { },
        [2] = { }
    },

    ["Ezreal"] = {
        [1] = { },
        [2] = { }
    },

    ["Fiddlesticks"] = {
        [1] = {"The SM Evelynn"},
        [2] = {"eve"}
    },

    ["Garen"] = {
        [1] = {"Garen"},
        [2] = {"Garen"}
    },

    ["Gnar"] = {
        [1] = {"Hamster Doom Gnar"},
        [2] = {"Gnar"}
    },

    ["Graves"] = {
        [1] = {"ADCMain Graves"},
        [2] = {"ADC Main"}
    },

    ["Irelia"] = {
        [1] = {"Eternal Irelia"},
        [2] = {"EternalAIO"}
    },

    ["Janna"] = {
        [1] = {"SPBundle Janna"},
        [2] = {"Support Bundle"}
    },

    ["Jayce"] = {
        [1] = {"CSR Jayce"},
        [2] = {"ChallengerSeriesReborn"}
    },

    ["Jinx"] = {
        [1] = {"SL Jinx"},
        [2] = {"SL-AIO"}
    },

    ["Kalista"] = {
        [1] = {"ADCMain Kalista", "SL Kalista"},
        [2] = {"ADC Main", "SL-AIO"}
    },

    ["Karma"] = {
        [1] = {"SPBundle Karma", "Annoying Prick Karma"},
        [2] = {"Support Bundle", "Karma"}
    },

    ["Katarina"] = {
        [1] = {"QWER Katarina"},
        [2] = {"qwerKata"}
    },

    ["Kennen"] = {
        [1] = {"ADCMain Kennen"},
        [2] = {"ADC Main"}
    },

    ["Khazix"] = {
        [1] = {"SL Khazix"},  
        [2] = {"SL-AIO"}
    },

    ["Kindred"] = {
        [1] = {"SL Kindred"},
        [2] = {"SL-AIO"}
    },

    ["KogMaw"] = {
        [1] = {"NS KogMaw", "SL KogMaw", "Noddy Kogaw"},
        [2] = {"NEETSeries", "SL-AIO", "KogMaw"}
    },

    ["LeBlanc"] = {
        [1] = {"TheDeceiver LeBlanc"},
        [2] = {"LeBlanc"}
    },

    ["Malphite"] = {
        [1] = {"Eternal Malphite"},
        [2] = {"EternalAIO"}
    },

    ["Morgana"] = {
        [1] = {"SPBundle Morgana"},
        [2] = {"Support Bundle"}
    },

    ["Nami"] = {
        [1] = {"SPBundle Nami"},
        [2] = {"Support Bundle"}
    },

    ["Nasus"] = {
        [1] = {"SL Nasus"},
        [2] = {"SL-AIO"}
    },

    ["Nautilus"] = {
        [1] = {"SPBundle Nautilus"},
        [2] = {"Support Bundle"}
    },

    ["Nocturne"] = {
        [1] = {"SL Nocturne"},
        [2] = {"SL-AIO"}
    },

    ["Nunu"] = {
        [1] = {"K7 Nunu"},
        [2] = {"K7Nunu"}
    },

    ["Orianna"] = {
        [1] = {"SL Orianna"},
        [2] = {"SL-AIO"}
    },

    ["Rengar"] = {
        [1] = {"Shulepin Rengar"},
        [2] = {"Rengar"}
    },

    ["Riven"] = {
        [1] = {"Eternal Riven"},
        [2] = {"EternalAIO"}
    },

    ["Ryze"] = {
        [1] = {"Noddy Ryze"},
        [2] = {"Ryze"}
    },

    ["Shyvana"] = {
        [1] = {"Noddy Shyvana"},
        [2] = {"qwerShyv"}
    },

    ["Sivir"] = {
        [1] = {"SL Sivir"},
        [2] = {"SL-AIO"}
    },

    ["Soraka"] = {
        [1] = {"SL Soraka"},
        [2] = {"SL-AIO"}
    },

    ["Swain"] = {
        [1] = {"Shulepin Swain"},
        [2] = {"Swain"}
    },

    ["Syndra"] = {
        [1] = {"CSR Syndra"},
        [2] = {"ChallengerSeriesReborn"}
    },

    ["Taliyah"] = {
        [1] = {"Platy Taliyah"},
        [2] = {"Taliyah"}
    },

    ["Talon"] = {
        [1] = {"Shulepin Talon"},
        [2] = {"Talon"}
    },

    ["Teemo"] = {
        [1] = {"K7 Teemo"},
        [2] = {"K7Teemo"}
    },

    ["Trundle"] = {
        [1] = {"Eternal Trundle"},
        [2] = {"EternalTrundle"}
    },

    ["TwistedFate"] = {
        [1] = {"qwer TwistedFate"},
        [2] = {"qwerTF"}
    },

    ["Twitch"] = {
        [1] = {"ADCMain Twitch"},
        [2] = {"ADC Main"}
    },

    ["Vayne"] = {
        [1] = {"SL Vayne"},
        [2] = {"SL-AIO"}
    },

    ["Velkoz"] = {
        [1] = {"SL Velkoz"},
        [2] = {"SL-AIO"}
    },

    ["Veigar"] = {
        [1] = {"SL Veigar"},
        [2] = {"SL-AIO"}
    }, 

    ["Vladimir"] = {
        [1] = {"SL Vladimir"},
        [2] = {"SL-AIO"}
    },

    ["Volibear"] = {
        [1] = {"Platy Volibear", "SPBundle Volibear"},
        [2] = {"Volibear", "Support Bundle"}
    },

    ["Xerath"] = {
        [1] = {"NS Xerath", "CSR Xerath"},
        [2] = {"NEETSeries", "ChallengerSeriesReborn"}
    },

    ["Zed"] = {
        [1] = {"SL Zed"},
        [2] = {"SL-AIO"}
    },

    ["Zilean"] = {
        [1] = {"SPBundle Zilean"},
        [2] = {"Support Bundle"}
    }
}

local ChampTable = ScriptData[myHero.charName]
local function PrintBatTat(bool, str)
    STH_Print("Nhan x2 F6 de "..(bool and "'Bat' " or "'Tat' ")..str)
end

local STHMenu = MenuConfig("STH", "Script Tong Hop")
STHMenu:Menu("Utlt", "Load Script Ho Tro")
STHMenu.Utlt:Boolean("NSA", "NS Awaraness", true, function(v) PrintBatTat(v, "NS Awaraness") end)
STHMenu.Utlt:Boolean("Rada", "Rada Tracker", false, function(v) PrintBatTat(v, "Rada Tracker") end)
STHMenu.Utlt:Boolean("CEvade", "Challenger Evade", false, function(v) PrintBatTat(v, "Challenger Evade") end)
STHMenu.Utlt:Boolean("EActivator", "Challenger Activator", false, function(v) PrintBatTat(v, "Challenger Activator") end)

if ChampTable then
    STHMenu:Menu("Champs", "Load Script Tuong")
    STHMenu.Champs:DropDown("load", "Chon Script Cho Tuong", 1, ChampTable[1], function(v) STH_Print("Nhan x2 F6 de chuyen sang dung '"..ChampTable[1][v].."' !") end)
else
    STHMenu:Info("NotSupported", "Tuong hien tai chua co script")
end
STHMenu:Info("sv", "STH Version: "..STH_Ver)

OnLoad(function()
    GetWebResultAsync("https://raw.githubusercontent.com/solotanktank/Script/master/ScriptTongHop.version", function(OnlineV)
        if tonumber(OnlineV) > STH_Ver then
            STH_Print("Da tim thay ban phien ban moi (v"..OnlineV.."). Vui long cho...")
            DownloadFileAsync("https://raw.githubusercontent.com/solotanktank/Script/master/1%20File_AIO", COMMON_PATH.."1 File_AIO.lua", function() STH_Print("Da cap nhat len phien ban moi (v"..OnlineV.."). Vui long an x2 F6!") end)
        else
            if ChampTable then
                PrintChat("<font color=\"#4169E1\"><b>[Script TongHop]:</b></font><font color=\"#FFFFFF\"> Script tuong dang dung: <b>%s</b></font>", ChampTable[1][STHMenu.Champs.load:Value()])
            else
                STH_Print("Hien chua co scripts nao ho tro cho tuong nay")
            end
            PrintChat("<font color=\"#4169E1\"><b>[Script TongHop]:</b></font><font color=\"#FFFFFF\"> Script duoc viet boi NAV. <u>http://toollienminhmienphi.blogspot.com/</u></font>")
        end
    end)
end)


do
    if ChampTable then STH_Require(ChampTable[2][STHMenu.Champs.load:Value()]) end
    if STHMenu.Utlt.NSA:Value() and ChampTable[2][STHMenu.Champs.load:Value()] ~= "NEETSeries" then STH_Require("NEETSeries") end
    if STHMenu.Utlt.Rada:Value() then STH_Require("RadarHack") end
    if STHMenu.Utlt.CEvade:Value() then STH_Require("ChallengerEvade") end
    if STHMenu.Utlt.EActivator:Value() then STH_Require("ChallengerActivator") end
end
