--[[ ONE FOR ALL GOS
    Script dùng để tổng hợp tất cả các script hiện tại của tool GOS.
    Trang chủ GOS: gamingonsteroids.com
    Script được viết bởi RN. Khi copy/di chuyển vui lòng để lại nguồn
--------------------------------------------------------------------------------]]

class "OneFile"
function OneFile:__init()
    self:ChampSupported()
    self:CheckUpdate()
    self:LoadMenu()
    self:LoadScriptChamp()
    self:LoadUtility()
end

local function OneFile_Print(text)
    PrintChat(string.format("<font color=\"#4169E1\"><b>[Script TongHop]:</b></font><font color=\"#FFFFFF\"> %s</font>",tostring(text)))
end

local __require = require
local require = function(str) if FileExist(SCRIPT_PATH..str..".lua") then __require(str) else assert(1 == 2, "\nKhong tim thay file '"..SCRIPT_PATH..str..".lua'\nVui long download script nay hoac chon script khac") end end

function OneFile:ChampSupported()
    self.supported = {
        ["Aatrox"] = {"Toxic Aatrox", "Question Aatrox", "SL Aatrox"},
        ["Ahri"] = {"CS Ahri", "GamsOn Ahri"},
        ["Akali"] = {"Shadow Akali", "KMS Akali", "Eternal Akali"},
        ["Alistar"] = {"CS Alistar"},
        ["Annie"] = {"PAM Annie", "Bored Annie", "NEETSeries Annie"},
        ["Ashe"] = {"CS Ashe", "ADC Main Ashe"},
        ["Azir"] = {"CS Azir"},
        ["Blitzcrank"] = {"CS Blitzcrank", "SxcSAIO Blitzcrank", "SL Blitzcrank", "GamsOn Blitzcrank"},
        ["Corki"] = {"SxcSAIO Corki", "ADC Main Corki"},
        ["Darius"] = {"Simple Darius", "Icy Darius"},
        ["Diana"] = {"KMS Diana"},
        ["DrMundo"] = {"SxcSAIO Mundo", "Cloud Mundo"},
        ["Draven"] = {"CS Draven", "Cloud Draven"},
        ["Elise"] = {"Steroided Spider Elise", "QWER Elise"},
        ["Evelynn"] = {"Spooks Master Evelynn"},
        ["Ezreal"] = {"ADC Main Ezreal", "SxcSAIO Ezreal", "Eternal Ezreal"},
        ["Fiora"] = {"Simple Fiora"},
        ["Fizz"] = {"Toxic Fizz"},
        ["Garen"] = {"Simple Garen", "SxcSAIO Garen", "Garen AutoUlt", "Icy Garen"},
        ["Graves"] = {"ADC Main Graves"},
        ["Jhin"] = {"Royal Jhin", "High Noon Jhin"},
        ["Jinx"] = {"SxcSAIO Jinx", "SL Jinx"},
        ["Kalista"] = {"CS Kalista", "SxcSAIO Kalista", "ADC Main Kalista", "SL Kalista"},
        ["Karma"] = {"Karma Annoying Prick", "Meo Karma"},
        ["Karthus"] = {"Rx Karthus", "Simple Karthus"},
        ["Katarina"] = {"CS Katarina", "NEETSeries Katarina", "Katarina Easy"},
        ["Kayle"] = {"Royal Kayle", "Simple Kayle"},
        ["Kennen"] = {"KennenBae"},
        ["KhaZix"] = {"InnateSeries KhaZix"},
        ["KogMaw"] = {"NEETSeries Kog'Maw", "SxcSAIO Kog'Maw"},
        ["LeBlanc"] = {"KMS LeBlanc"},
        ["LeeSin"] = {"CS Lee Sin"},
        ["Leona"] = {"SxcSAIO Leona"},
        ["Lissandra"] = {"KMS Lissandra"},
        ["Lucian"] = {"ADC Main Lucian", "Cloud Lucian"},
        ["Lulu"] = {"LuluBae"},
        ["Lux"] = {"ILux", "SxcSAIO Lux"},
        ["MasterYi"] = {"Alpha Strike MasterYi"},
        ["MissFortune"] = {"ADC Main Miss Fortune"},
        ["Morgana"] = {"InnateSeries Morgana", "Meo Morgana"},
        ["Nami"] = {"SxcSAIO Nami", "Meo Nami"},
        ["Nasus"] = {"Siphoning Strikes", "SxcSAIO Nasus", "SL Nasus"},
        ["Oriana"] = {"KMS Oriana"},
        ["Poppy"] = {"SxcSAIO Poppy", "QWER Poppy"},
        ["Rengar"] = {"The Pridestalker Rengar", "Cloud Rengar"},
        ["Rumble"] = {"SxcSAIO Rumble"},
        ["Ryze"] = {"Noddy Ryze", "Corrupt Ryze"},
        ["Sona"] = {"Rx Sona"},
        ["Soraka"] = {"SxcSAIO Soraka", "SL Soraka"},
        ["Swain"] = {"SxcSAIO Swain"},
        ["Teemo"] = {"OK Teemo"},
        ["Thresh"] = {"SxcSAIO Thresh"},
        ["Tristana"] = {"ADC Main Tristana"},
        ["Tryndamere"] = {"Simple Tryndamere"},
        ["TwistedFate"] = {"KMS Twisted Fate"},
        ["Twitch"] = {"ADC Main Twitch"},
        ["Varus"] = {"Piercing Arrow Varus"},
        ["Vayne"] = {"CS Vayne", "Simple Vayne", "SxcSAIO Vayne", "SL Vayne", "Eternal Vayne"},
        ["Veigar"] = {"Tiny Veigar"},
        ["Vi"] = {"The Heartbreaker Vi"},
        ["Viktor"] = {"KMS Viktor"},
        ["Vladimir"] = {"Simple Vladimir", "SL Vladimir"},
        ["Xerath"] = {"NEET Series Xerath", "Simple Xerath"},
        ["XinZhao"] = {"Simple XinZhao"},
        ["Yasuo"] = {"KMS Yasuo", "Meo Yasuo"},
        ["Yorick"] = {"The Undefeated Yorick"},
        ["Zac"] = {"Elastic Slingshot Zac"},
        ["Zed"] = {"KMS Zed", "Zed Shadow"},
        ["Ziggs"] = {"EloBommer Ziggs"},
        ["Zilean"] = {"Rx Zilean", "Meo Zilean"},
        ["Kindred"] = {"SL Kindred", "QWER Kindred", "Eternal Kindred"},
        ["Sivir"] = {"SL Sivir", "ADC Main Sivir"},
        ["Velkoz"] = {"SL Velkoz", "Cloud Velkoz"},
        ["Taliyah"] = {"Platy Taliyah"},
        ["Nautilus"] = {"Meo Nautilus"},
        ["Braum"] = {"Meo Braum"},
        ["Volibear"] = {"Meo Volibear", "Platy Volibear"},
        ["Jax"] = {"Grandmaster Jax"},
        ["Riven"] = {"Eternal Riven"},
        ["MonkeyKing"] = {"Sibyl WuKong", "Eternal WuKong"},
        ["Trundle"] = {"Eternal Trundle"},
        ["Fiddlesticks"] = {"Platy Fidd"},
        ["Irelia"] = {"QWER Irelia", "Frosted Booty Irelia"},
        ["Nidalee"] = {"QWER Nidalee"},
        ["Olaf"] = {"Olaf the Berserker"},
        ["Cassiopeia"] = {"Zeyx Cassiopeia"},
        ["Talon"] = {"LB Talon"},
        ["Gangplank"] = {"Cloud Gangplank"},
        ["Ekko"] = {"Bored Ekko"},
        ["Shyvana"] = {"Noddy Shyvana"},
        ["TahmKench"] = {"Cloud TahmKench"},
        ["Mordekaiser"] = {"Zeyx Mordekaiser"},
        ["Bard"] = {"Bard Bae"},
        ["Taric"] = {"Taric Bae"},
        ["Janna"] = {"Meo Janna"},
        ["Udyr"] = {"Cloud Udyr"},
        ["Malphite"] = {"Custom Malphite"}
    }
end

function OneFile:LoadMenu()
	self.cfg = MenuConfig("OneFile", "Script Tong Hop")
		self.cfg:Menu("c", "Chon script cho "..myHero.charName)
		if self.supported[myHero.charName] ~= nil then
			self.cfg.c:DropDown("p", "Chon script:", 1, self.supported[myHero.charName], function() self:PrintScriptChange() end)
		else
			self.cfg.c:Info("info", "Tuong nay hien khong co script nao ho tro")
        end
		self.cfg:Menu("u", "Utility Scripts")
			self.cfg.u:Info("if1", "Day la nhung scripts ho tro")
			self.cfg.u:Info("if2", "Co the dung cho tat ca tuong")
			self.cfg.u:Boolean("e1", "Load Challenger Humanizer", false, function() self:PrintUtility(self.cfg.u.e1:Value(), "Challenger Humanizer") end)
			self.cfg.u:Boolean("e2", "Load Challenger Activator", false, function() self:PrintUtility(self.cfg.u.e2:Value(), "Challenger Activator") end)
			self.cfg.u:Boolean("e3", "Load SL Evade", false, function() self:PrintUtility(self.cfg.u.e3:Value(), "SL-Evade") end)
			self.cfg.u:Boolean("e4", "Load NEET's Tracker", false, function() self:PrintUtility(self.cfg.u.e4:Value(), "NEET's Tracker") end)
end

function OneFile:LoadScriptChamp()
   local n, v = myHero.charName, self.cfg.c.p:Value()
    if n == "Aatrox" then
      if v == 1 then
        require('Toxic Aatrox')
      elseif v == 2 then
        require('Questionmark')
      elseif v == 3 then
        require('SL-Series')
      end
    elseif n == "Aatrox" then
      if v == 1 then
        require('ChallengerSeries')
      elseif v == 2 then
        require('GSR Ahri')
      end
    elseif n == "Akali" then
      if v == 1 then
        require('Akali')
      elseif v == 2 then
        require('KrystraMidBundle')
      elseif v == 3 then
        require('Eternal Akali')
      end
    elseif n == "Alistar" then
      if v == 1 then
        require('ChallengerSeries')
      end
    elseif n == "Annie" then
      if v == 1 then
        require('annie')
      elseif v == 2 then
        require('Annie')
      elseif v == 3 then
        require('NEETSeries')
      end
    elseif n == "Ashe" then
      if v == 1 then
        require('ChallengerSeries')
      elseif v == 2 then
        require('ADC Main')
      end
    elseif n == "Azir" then
      if v == 1 then
        require('ChallengerSeries')
      end
    elseif n == "Blitzcrank" then
      if v == 1 then
        require('ChallengerSeries')
      elseif v == 2 then
        require('SxcSAIO')
      elseif v == 3 then
        require('SL-Series')
      elseif v == 4 then
        require('Blitzcrank')
      end
    elseif n == "Corki" then
      if v == 1 then
        require('SxcSAIO')
      elseif v == 2 then
        require('ADC Main')
      end
    elseif n == "Draven" then
      if v == 1 then
        require('ChallengerSeries')
      elseif v == 2 then
        require('Draven')
      end
    elseif n == "Darius" then
      if v == 1 then
        require('simple darius')
      elseif v == 2 then
        require('IcyDarius')
      end
    elseif n == "Diana" then
      if v == 1 then
        require('KrystraMidBundle')
      end
    elseif n == "DrMundo" then
      if v == 1 then
        require('SxcSAIO')
      elseif v == 2 then
        require('Mundo')
      end
    elseif n == "Diana" then
      if v == 1 then
        require('KrystraMidBundle')
      end
    elseif n == "Elise" then
      if v == 1 then
        require('Elise')
      elseif v == 2 then
        require('QWER Series')
      end
    elseif n == "Diana" then
      if v == 1 then
        require('KrystraMidBundle')
      end
    elseif n == "Ezreal" then
      if v == 1 then
        require('ADC Main')
      elseif v == 2 then
        require('SxcSAIO')
      elseif v == 3 then
        require('Eternal Ezreal')
      end
    elseif n == "Fiora" then
      if v == 1 then
        require('simple fiora')
      end
    elseif n == "Fizz" then
      if v == 1 then
        require('Toxic fizz')
      end
    elseif n == "Garen" then
      if v == 1 then
        require('simple garen')
      elseif v == 2 then
        require('SxcSAIO')
      elseif v == 3 then
        require('Garen')
      elseif v == 4 then
        require('IcyGaren')
      end
    elseif n == "Graves" then
      if v == 1 then
        require('ADC Main')
      end
    elseif n == "Jhin" then
      if v == 1 then
        require('RoyalJhin')
      elseif v == 2 then
        require('Jhin')
      end
    elseif n == "Jinx" then
      if v == 1 then
        require('SxcSAIO')
      elseif v == 2 then
        require('SL-Series')
      end
    elseif n == "Kalista" then
      if v == 1 then
        require('ChallengerSeries')
      elseif v == 2 then
        require('SxcSAIO')
      elseif v == 3 then
        require('ADC Main')
      elseif v == 4 then
        require('SL-Series')
      end
    elseif n == "Karma" then
      if v == 1 then
        require('Karma')
      elseif v == 2 then
        require('Support Bundle')
      end
    elseif n == "Karthus" then
      if v == 1 then
        require('Karthus')
      elseif v == 2 then
        require('simple karthus')
      end
    elseif n == "Katarina" then
      if v == 1 then
        require('ChallengerSeries')
      elseif v == 2 then
        require('NEETSeries')
      elseif v == 3 then
        require('Katarina easy')
      end
    elseif n == "Kayle" then
      if v == 1 then
        require('RoyalKayle')
      elseif v == 2 then
        require('simple kayle')
      end
    elseif n == "Kennen" then
      if v == 1 then
        require('kennenBae')
      end
    elseif n == "KhaZix" then
      if v == 1 then
        require('IS_khazix')
      end
    elseif n == "KogMaw" then
      if v == 1 then
        require('NEETSeries')
      elseif v == 2 then
        require('SxcSAIO')
      end
    elseif n == "LeBlanc" then
      if v == 1 then
        require('KrystraMidBundle')
      end
    elseif n == "LeeSin" then
      if v == 1 then
        require('ChallengerSeries')
      end
    elseif n == "Leona" then
      if v == 1 then
        require('SxcSAIO')
      end
    elseif n == "Lissandra" then
      if v == 1 then
        require('KrystraMidBundle')
      end
    elseif n == "Lucian" then
      if v == 1 then
        require('ADC Main')
      elseif v == 2 then
        require('Lucian')
      end
    elseif n == "Lulu" then
      if v == 1 then
        require('luluBae')
      end
    elseif n == "Lux" then
      if v == 1 then
        require('ILux')
      elseif v == 2 then
        require('SxcSAIO')
      end
    elseif n == "MasterYi" then
      if v == 1 then
        require('MasterYi')
      end
    elseif n == "MissFortune" then
      if v == 1 then
        require('ADC Main')
      end
    elseif n == "Morgana" then
      if v == 1 then
        require('IS_morgana')
      elseif v == 2 then
        require('Support Bundle')
      end
    elseif n == "Nami" then
      if v == 1 then
        require('SxcSAIO')
      elseif v == 2 then
        require('Support Bundle')
      end
    elseif n == "Nasus" then
      if v == 1 then
        require('Nasus')
      elseif v == 2 then
        require('SxcSAIO')
      elseif v == 3 then
        require('SL-Series')
      end
    elseif n == "Oriana" then
      if v == 1 then
        require('KrystraMidBundle')
      end
    elseif n == "Poppy" then
      if v == 1 then
        require('SxcSAIO')
      elseif v == 2 then
        require('QWER Series')
      end
    elseif n == "Rengar" then
      if v == 1 then
        require('Rengar - the Pridestalker')
      elseif v == 2 then
        require('Rengar')
      end
    elseif n == "Rumble" then
      if v == 1 then
        require('SxcSAIO')
      end
    elseif n == "Ryze" then
      if v == 1 then
        require('Ryze')
      elseif v == 2 then
        require('CorruptRyze')
      end
    elseif n == "Sona" then
      if v == 1 then
        require('SonaNDe')
      end
    elseif n == "Soraka" then
      if v == 1 then
        require('SxcSAIO')
      elseif v == 2 then
        require('SL-Series')
      end
    elseif n == "Swain" then
      if v == 1 then
        require('SxcSAIO')
      end
    elseif n == "Teemo" then
      if v == 1 then
        require('Teemo')
      end
    elseif n == "Thresh" then
      if v == 1 then
        require('SxcSAIO')
      end
    elseif n == "Tristana" then
      if v == 1 then
        require('ADC Main')
      end
    elseif n == "Tryndamere" then
      if v == 1 then
        require('simple tryndamere')
      end
    elseif n == "TwistedFate" then
      if v == 1 then
        require('KrystraMidBundle')
      end
    elseif n == "Twick" then
      if v == 1 then
        require('ADC Main')
      end
    elseif n == "Varus" then
      if v == 1 then
        require('Varus')
      end
    elseif n == "Vayne" then
      if v == 1 then
        require('ChallengerSeries')
      elseif v == 2 then
        require('simple vayne')
      elseif v == 3 then
        require('SxcSAIO')
      elseif v == 4 then
        require('SL-Series')
      elseif v == 5 then
        require('Eternal Vayne')
      end
    elseif n == "Veigar" then
      if v == 1 then
        require('Veigar')
      end
    elseif n == "Vi" then
      if v == 1 then
        require('Vi')
      end
    elseif n == "Viktor" then
      if v == 1 then
        require('KrystraMidBundle')
      end
    elseif n == "Vladimir" then
      if v == 1 then
        require('simple vladimir')
      elseif v == 2 then
        require('SL-Series')
      end
    elseif n == "Xerath" then
      if v == 1 then
        require('NEETSeries')
      elseif v == 2 then
        require('simple xerath')
      end
    elseif n == "XinZhao" then
      if v == 1 then
        require('simple xinZhao')
      end
    elseif n == "Yasuo" then
      if v == 1 then
        require('KrystraMidBundle')
      elseif v == 2 then
        require('Project Yasuo')
      end
    elseif n == "Yorick" then
      if v == 1 then
        require('yorick')
      end
    elseif n == "Zac" then
      if v == 1 then
        require('Zac')
      end
    elseif n == "Zed" then
      if v == 1 then
        require('KrystraMidBundle')
      elseif v == 2 then
        require('Zed')
      end
    elseif n == "Ziggs" then
      if v == 1 then
        require('Ziggs')
      end
    elseif n == "Zilean" then
      if v == 1 then
        require('RxZilean')
      elseif v == 2 then
        require('Support Bundle')
      end
    elseif n == "Gangplank" then
      if v == 1 then
        require('Gangplank')
      end
    elseif n == "TahmKench" then
      if v == 1 then
        require('Kench')
      end
    elseif n == "Udyr" then
      if v == 1 then
        require('Udyr')
      end
    elseif n == "Velkoz" then
      if v == 1 then
        require('SL-Series')
      elseif v == 2 then
        require('Velkoz')
      end
    elseif n == "Kindred" then
      if v == 1 then
        require('SL-Series')
      elseif v == 2 then
        require('QWER Series')
      elseif v == 3 then
        require('Eternal Kindred')
      end
    elseif n == "Sivir" then
      if v == 1 then
        require('SL-Series')
      elseif v == 2 then
        require('ADC Main')
      end
    elseif n == "Nautilus" then
      if v == 1 then
        require('Support Bundle')
      end
    elseif n == "Janna" then
      if v == 1 then
        require('Support Bundle')
      end
    elseif n == "Volibear" then
      if v == 1 then
        require('Support Bundle')
      elseif v == 2 then
        require('')
      end
    elseif n == "Taliyah" then
      if v == 1 then
        require('Taliyah')
      end
    elseif n == "Braum" then
      if v == 1 then
        require('Support Bundle')
      end
    elseif n == "Jax" then
      if v == 1 then
        require('Jax')
      end
    elseif n == "Riven" then
      if v == 1 then
        require('CustomRiven')
      end
    elseif n == "MonkeyKing" then
      if v == 1 then
        require('Wukong')
      elseif v == 2 then
        require('EternalWukong')
      end
    elseif n == "Trundle" then
      if v == 1 then
        require('EternalTrundle')
      end
    elseif n == "Fiddlesticks" then
      if v == 1 then
        require('Fiddle')
      end
    elseif n == "Irelia" then
      if v == 1 then
        require('FrostedBootyBlade')
      elseif v == 2 then
        require('QWER Series')
      end
    elseif n == "Malphite" then
      if v == 1 then
        require('CustomMalphite')
      end
    elseif n == "Nidalee" then
      if v == 1 then
        require('QWER Series')
      end
    elseif n == "Olaf" then
      if v == 1 then
        require('Olaf')
      end
    elseif n == "Cassiopeia" then
      if v == 1 then
        require('Cassiopeia')
      end
    elseif n == "Talon" then
      if v == 1 then
        require('Talon_LBSeries')
      end
    elseif n == "Ekko" then
      if v == 1 then
        require('Ekko')
      end
    elseif n == "Shyvana" then
      if v == 1 then
        require('qwerShyv')
      end
    elseif n == "Mordekaiser" then
      if v == 1 then
        require('Mordekaiser')
      end
    elseif n == "Bard" then
      if v == 1 then
        require('bardBae')
      end
    elseif n == "Taric" then
      if v == 1 then
        require('TaricBae')
      end
    end
end

function OneFile:LoadUtility()
	if self.cfg.u.e1:Value() then require('ChallengerHumanizer') end
	if self.cfg.u.e2:Value() then require('ChallengerActivator') end
	if self.cfg.u.e3:Value() then require('SL-Evade') end
	if self.cfg.u.e4:Value() then require("NEET's Tracker") end
end

function OneFile:PrintScriptChange()
    if self.supported[myHero.charName] == nil then return end
    OneFile_Print("Da chuyen sang su dung script "..self.supported[myHero.charName][self.cfg.c.p:Value()]..". Nhan F6 x2 de thay doi.")
end

function OneFile:PrintUtility(boolean, text)
    local current = boolean == true and "Bat" or "Tat"
    OneFile_Print("F6 x2 de "..current.." '"..text.."'")
end

function OneFile:CheckUpdate()
    self.Update = {}
    self.Update.ScriptVersion = 0.022
    self.Update.UseHttps = true
    self.Update.Host = "raw.githubusercontent.com"
    self.Update.VersionPath = "/solotanktank/Script/master/ScriptTongHop.version"
    self.Update.ScriptPath = "/solotanktank/Script/master/1%20Key%20To%20Champion.lua"
    self.Update.SavePath = SCRIPT_PATH.."1 Key To Champion.lua"
    self.Update.CallbackUpdate = function(NewVersion) OneFile_Print("Da cap nhat len phien ban "..NewVersion..". F6 x2 de tai lai script.") end
    self.Update.CallbackNoUpdate = function(NewVersion) OneFile_Print("Ban da su dung phien ban moi nhat ("..NewVersion..")") self:Hello() end
    self.Update.CallbackNewVersion = function(NewVersion) OneFile_Print("Da tim thay phien ban moi ("..NewVersion.."). Vui long doi cap nhat...") end
    self.Update.CallbackError = function() OneFile_Print("Da co loi xay ra khi kiem tra cap nhat. Vui long kiem tra lai Internet") end
    AutoUpdater(self.Update.ScriptVersion, self.Update.UseHttps, self.Update.Host, self.Update.VersionPath, self.Update.ScriptPath, self.Update.SavePath, self.Update.CallbackUpdate, self.Update.CallbackNoUpdate, self.Update.CallbackNewVersion, self.Update.CallbackError)
end

function OneFile:Hello()
   if self.supported[myHero.charName] ~= nil then
    PrintChat(string.format("<font color=\"#4169E1\"><b>[Script TongHop]:</b></font><font color=\"#FFFFFF\"> Script tướng đang dùng: %s</font>",self.supported[myHero.charName][self.cfg.c.p:Value()]))
   else
    PrintChat(string.format("<font color=\"#4169E1\"><b>[Script TongHop]:</b></font><font color=\"#FFFFFF\"> Tướng bạn đang chơi hiện chưa có scipts nào hổ trợ.</font>"))
   end
    PrintChat(string.format("<font color=\"#4169E1\"><b>[Script TongHop]:</b></font><font color=\"#FFFFFF\"> Script Được Viết Bởi RN. <u>http://toollienminhmienphi.blogspot.com/</u></font>"))
end

if OneFile then OneFile() end
