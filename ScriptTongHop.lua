--[[ ONE FOR ALL GOS
	Script dùng để tổng hợp tất cả các script hiện tại của phần mềm GOS.
	Trang chủ GOS: gamingonsteroids.com
	Script được làm bởi R-N. Khi copy, di chuyển script vui lòng để lại nguồn.
--------------------------------------------------------------------------------]]
require('Inspired')

if not FileExist(COMMON_PATH.."SmiteGod.lua") then
 print("Khong tim thay SmiteGod trong thu muc, vui long cho")
 DownloadFileAsync("https://raw.githubusercontent.com/qqwer1/GoS-Lua/master/SmiteGod.lua", COMMON_PATH.."SmiteGod.lua", function() PrintChat("Cap nhat hoan tat SmiteGod. Hay nhan F6 x2 de load lai script tong hop!") end) return
end

class "OneFile"
function OneFile:__init()
    self:ChampSupported()
    Callback.Add("Load", function() self:CheckUpdate() end)
    self:LoadMenu()
	self:LoadScriptChamp()
	self:LoadUtility()
end

function OneFile:ChampSupported()
    self.supported = {
        ["Aatrox"] = {"Toxic Aatrox", "Question Aatrox"},
		["Ahri"] = {"CS Ahri"},
		["Akali"] = {"Shadow Akali", "KMS Akali"},
		["Alistar"] = {"CS Alistar"},
		["Annie"] = {"PAM Annie"},
		["Ashe"] = {"CS Ashe", "ADC Main Ashe"},
		["Azir"] = {"CS Azir"},
		["Blitzcrank"] = {"CS Blitzcrank", "SxcSAIO Blitzcrank"},
		["Corki"] = {"SxcSAIO Corki", "ADC Main Corki"},
		["Darius"] = {"Simple Darius"},
		["Diana"] = {"KMS Diana", "ADC Main Diana"},
		["DrMundo"] = {"SxcSAIO Mundo"},
		["Draven"] = {"CS Draven"},
		["Elise"] = {"Steroided Spider Elise"},
		["Evelynn"] = {"Spooks Master Evelynn"},
		["Ezreal"] = {"ADC Main Ezreal", "SxcSAIO Ezreal"},
		["Fiora"] = {"Simple Fiora"},
		["Fizz"] = {"Toxic Fizz"},
		["Garen"] = {"Simple Garen", "SxcSAIO Garen", "Garen AutoUlt"},
		["Graves"] = {"ADC Main Graves"},
		["Jhin"] = {"Royal Jhin", "High Noon Jhin"},
		["Jinx"] = {"SxcSAIO Jinx"},
		["Kalista"] = {"CS Kalista", "SxcSAIO Kalista", "ADC Main Kalista"},
		["Karma"] = {"The Annoying Prick"},
		["Karthus"] = {"Rx Karthus", "Simple Karthus"},
		["Katarina"] = {"CS Katarina"},
		["Kayle"] = {"Royal Kayle", "Simple Kayle"},
		["Kennen"] = {"KennenBae"},
		["KhaZix"] = {"InnateSeries KhaZix"},
		["KogMaw"] = {"NEETSeries Kog'Maw", "SxcSAIO Kog'Maw"},
		["LeBlanc"] = {"KMS LeBlanc"},
		["LeeSin"] = {"CS Lee Sin"},
		["Leona"] = {"SxcSAIO Leona"},
		["Lissandra"] = {"KMS Lissandra"},
		["Lucian"] = {"ADC Main Lucian"},
		["Lulu"] = {"LuluBae"},
		["Lux"] = {"ILux", "SxcSAIO Lux"},
		["MasterYi"] = {"Alpha Strike MasterYi"},
		["MissFortune"] = {"ADC Main Miss Fortune"},
		["Morgana"] = {"InnateSeries Morgana"},
		["Nami"] = {"SxcSAIO Nami"},
		["Nasus"] = {"Siphoning Strikes", "SxcSAIO Nasus"},
		["Oriana"] = {"KMS Oriana"},
		["Poppy"] = {"SxcSAIO Poppy"},
		["Rengar"] = {"The Pridestalker Rengar"},
		["Rumble"] = {"SxcSAIO Rumble"},
		["Ryze"] = {"CS Ryze"},
		["Sona"] = {"Rx Sona"},
		["Soraka"] = {"SxcSAIO Soraka"},
		["Swain"] = {"SxcSAIO Swain"},
		["Teemo"] = {"OK Teemo"},
		["Thresh"] = {"SxcSAIO Thresh"},
		["Tristana"] = {"ADC Main Tristana"},
		["Tryndamere"] = {"Simple Tryndamere"},
		["TwistedFate"] = {"KMS Twisted Fate"},
		["Twitch"] = {"ADC Main Twitch"},
		["Varus"] = {"Piercing Arrow Varus"},
		["Vayne"] = {"CS Vayne", "Simple Vayne", "SxcSAIO Vayne"},
		["Veigar"] = {"Tiny Veigar"},
		["Vi"] = {"The Heartbreaker Vi"},
		["Viktor"] = {"KMS Viktor"},
		["Vladimir"] = {"Simple Vladimir"},
		["Xerath"] = {"NEET Series Xerath", "Simple Xerath"},
		["XinZhao"] = {"Simple XinZhao"},
		["Yasuo"] = {"KMS Yasuo"},
		["Yorick"] = {"The Undefeated Yorick"},
		["Zac"] = {"Elastic Slingshot Zac"},
		["Zed"] = {"KMS Zed", "Zed Shadow"},
		["Ziggs"] = {"EloBommer Ziggs"},
		["Zilean"] = {"Rx Zilean"}
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
			self.cfg.u:Boolean("e1", "Load Challenger Humanizer", true, function() self:PrintUtility(self.cfg.u.e1:Value(), "Challenger Humanizer") end)
			self.cfg.u:Boolean("e2", "Load Challenger BaseUlt", false, function() self:PrintUtility(self.cfg.u.e2:Value(), "Challenger BaseUlt") end)
			self.cfg.u:Boolean("e3", "Load Challenger Awareness", true, function() self:PrintUtility(self.cfg.u.e3:Value(), "Challenger Awareness") end)
			self.cfg.u:Boolean("e4", "Load Challenger Activator", true, function() self:PrintUtility(self.cfg.u.e4:Value(), "Challenger Activator") end)
			self.cfg.u:Boolean("e5", "Load Skin Changer", false, function() self:PrintUtility(self.cfg.u.e5:Value(), "Skin Changer") end)
			self.cfg.u:Boolean("e6", "Load Paint (DmgCheck)", false, function() self:PrintUtility(self.cfg.u.e6:Value(), "Paint") end)
			self.cfg.u:Boolean("e7", "Load SmoothEvade", true, function() self:PrintUtility(self.cfg.u.e7:Value(), "SmoothEvade") end)
			self.cfg.u:Boolean("e8", "Load Aimbot", false, function() self:PrintUtility(self.cfg.u.e8:Value(), "AimBot") end)
			self.cfg.u:Boolean("e9", "Load SmiteGod", false, function() self:PrintUtility(self.cfg.u.e8:Value(), "SmiteGod") end)
end

function OneFile:LoadScriptChamp()
   local n, v = myHero.charName, self.cfg.c.p:Value()
    if n == "Aatrox" then
      if v == 1 then
        require('Toxic Aatrox')
      elseif v == 2 then
        require('Questionmark')
      end
    elseif n == "Ahri" and v == 1 then require('ChallengerSeries')
    elseif n == "Akali" then
      if v == 1 then
        require('Akali')
      elseif v == 2 then
        require('KrystraMidBundle')
      end
    elseif n == "Alistar" and v == 1 then require('ChallengerSeries')
    elseif n == "Annie" and v == 1 then require('annie')
    elseif n == "Ashe" then
      if v == 1 then
        require('ChallengerSeries')
      elseif v == 2 then
        require('ADC Main')
      end
    elseif n == "Azir" and v == 1 then require('ChallengerSeries')
    elseif n == "Blitzcrank" then
      if v == 1 then
        require('ChallengerSeries')
      elseif v == 2 then
        require('SxcSAIO')
      end
    elseif n == "Corki" then
      if v == 1 then
        require('SxcSAIO')
      elseif v == 2 then
        require('ADC Main')
      end
    elseif n == "Darius" and v == 1 then require('simple darius')
    elseif n == "Diana" then
      if v == 1 then
        require('KrystraMidBundle')
      elseif v == 2 then
        require('Diana')
      end
    elseif n == "DrMundo" and v == 1 then require('SxcSAIO')
    elseif n == "Draven" and v == 1 then require('ChallengerSeries')
    elseif n == "Elise" and v == 1 then require('Elise')
    elseif n == "Evelynn" and v == 1 then require('eve')
    elseif n == "Ezreal" then
      if v == 1 then
        require('ADC Main')
      elseif v == 2 then
        require('SxcSAIO')
      end
    elseif n == "Fiora" and v == 1 then require('simple fiora')
    elseif n == "Fizz" and v == 1 then require('Toxic fizz')
    elseif n == "Garen" then
      if v == 1 then
        require('simple garen')
      elseif v == 2 then
        require('SxcSAIO')
      elseif v == 3 then
        require('Garen')
      end
    elseif n == "Graves" and v == 1 then require('ADC Main')
    elseif n == "Jhin" then
      if v == 1 then
        require('RoyalJhin')
      elseif v == 2 then
        require('Jhin')
      end
    elseif n == "Jinx" and v == 1 then require('SxcSAIO')
    elseif n == "Kalista" then
      if v == 1 then
        require('ChallengerSeries')
      elseif v == 2 then
        require('SxcSAIO')
      elseif v == 3 then
        require('ADC Main')
      end
    elseif n == "Karma" and v == 1 then require('Karma')
    elseif n == "Karthus" then
      if v == 1 then
        require('Karthus')
      elseif v == 2 then
        require('simple karthus')
      end
    elseif n == "Katarina" and v == 1 then require('ChallengerSeries')
    elseif n == "Kayle" then
      if v == 1 then
        require('RoyalKayle')
      elseif v == 2 then
        require('simple kayle')
      end
    elseif n == "Kennen" and v == 1 then require('kennenBae')
    elseif n == "KhaZix" and v == 1 then require('IS_khazix')
    elseif n == "KogMaw" then
      if v == 1 then
        require('NEETSeries')
      elseif v == 2 then
        require('SxcSAIO')
      end
    elseif n == "LeBlanc" and v == 1 then require('KrystraMidBundle')
    elseif n == "LeeSin" and v == 1 then require('ChallengerSeries')
    elseif n == "Leona" and v == 1 then require('SxcSAIO')
    elseif n == "Lissandra" and v == 1 then require('KrystraMidBundle')
    elseif n == "Lucian" and v == 1 then require('ADC Main')
    elseif n == "Lulu" and v == 1 then require('LuluBae')
    elseif n == "Lux" then
      if v == 1 then
        require('ILux')
      elseif v == 2 then
        require('SxcSAIO')
      end
    elseif n == "MasterYi" and v == 1 then require('MasterYi')
    elseif n == "MissFortune" and v == 1 then require('ADC Main')
    elseif n == "Morgana" and v == 1 then require('IS_morgana')
    elseif n == "Nami" and v == 1 then require('SxcSAIO')
    elseif n == "Nasus" then
      if v == 1 then
        require('Nasus')
      elseif v == 2 then
        require('SxcSAIO')
      end
    elseif n == "Oriana" and v == 1 then require('KrystraMidBundle')
    elseif n == "Poppy" and v == 1 then require('SxcSAIO')
    elseif n == "Rengar" and v == 1 then require('Rengar - the Pridestalker')
    elseif n == "Rumble" and v == 1 then require('SxcSAIO')
    elseif n == "Ryze" and v == 1 then require('ChallengerSeries')
    elseif n == "Sona" and v == 1 then require('SonaNDe')
    elseif n == "Soraka" and v == 1 then require('SxcSAIO')
    elseif n == "Swain" and v == 1 then require('SxcSAIO')
    elseif n == "Teemo" and v == 1 then require('Teemo')
    elseif n == "Thresh" and v == 1 then require('SxcSAIO')
    elseif n == "Tristana" and v == 1 then require('ADC Main')
    elseif n == "Tryndamere" and v == 1 then require('simple tryndamere')
    elseif n == "TwistedFate" and v == 1 then require('KrystraMidBundle')
    elseif n == "Twitch" and v == 1 then require('ADC Main')
    elseif n == "Varus" and v == 1 then require('Varus')
    elseif n == "Vayne" then
      if v == 1 then
        require('ChallengerSeries')
      elseif v == 2 then
        require('simple vayne')
      elseif v == 3 then
        require('SxcSAIO')
      end
    elseif n == "Veigar" and v == 1 then require('Veigar')
    elseif n == "Vi" and v == 1 then require('Vi')
    elseif n == "Viktor" and v == 1 then require('KrystraMidBundle')
    elseif n == "Vladimir" and v == 1 then require('simple vladimir')
    elseif n == "Xerath" then
      if v == 1 then
        require('NEETSeries')
      elseif v == 2 then
        require('simple xerath')
      end
    elseif n == "XinZhao" and v == 1 then require('simple xinZhao')
    elseif n == "Yasuo" and v == 1 then require('KrystraMidBundle')
    elseif n == "Yorick" and v == 1 then require('yorick')
    elseif n == "Zac" and v == 1 then require('Zac')
    elseif n == "Zed" then
      if v == 1 then
        require('KrystraMidBundle')
      elseif v == 2 then
        require('Zed')
      end
    elseif n == "Ziggs" and v == 1 then require('Ziggs')
    elseif n == "Zilean" and v == 1 then require('Zilean')
    end
end

function OneFile:LoadUtility()
	if self.cfg.u.e1:Value() then require('ChallengerHumanizer') end
	if self.cfg.u.e2:Value() then require('ChallengerBaseult') end
	if self.cfg.u.e3:Value() then require('ChallengerAwareness') end
	if self.cfg.u.e4:Value() then require('ChallengerActivator') end
	if self.cfg.u.e5:Value() then require('SkinChanger') end
	if self.cfg.u.e6:Value() then require('draw') end
	if self.cfg.u.e7:Value() then require('SmoothEvade') end
	if self.cfg.u.e8:Value() then require('Aimbot') end
	if self.cfg.u.e9:Value() then require('SmiteGod') end
end

function OneFile:PrintScriptChange()
    if self.supported[myHero.charName] == nil then return end
    self:Print("Da chuyen sang su dung script "..self.supported[myHero.charName][self.cfg.c.p:Value()]..". Nhan F6 x2 de thay doi.")
end

function OneFile:PrintUtility(boolean, text)
    local current = boolean == true and "Bat" or "Tat"
    self:Print("F6 x2 de "..current.." '"..text.."'")
end

function OneFile:CheckUpdate()
    self.Update = {}
    self.Update.ScriptVersion = 0.022
    self.Update.UseHttps = true
    self.Update.Host = "raw.githubusercontent.com"
    self.Update.VersionPath = "/solotanktank/Script/master/ScriptTongHop.version"
    self.Update.ScriptPath = "/solotanktank/Script/master/ScriptTongHop.lua"
    self.Update.SavePath = SCRIPT_PATH.."/KhongDuocBoTickScriptNay.lua"
    self.Update.CallbackUpdate = function(NewVersion) self:Print("Da cap nhat len phien ban "..NewVersion..". F6 x2 de tai lai script.") end
    self.Update.CallbackNoUpdate = function(NewVersion) self:Print("Ban da su dung phien ban moi nhat ("..NewVersion..")") self:Hello() end
    self.Update.CallbackNewVersion = function(NewVersion) self:Print("Da tim thay phien ban moi ("..NewVersion.."). Vui long doi cap nhat...") end
    self.Update.CallbackError = function() self:Print("Da co loi xay ra khi kiem tra cap nhat. Vui long kiem tra lai Internet") end
    AutoUpdater(self.Update.ScriptVersion, self.Update.UseHttps, self.Update.Host, self.Update.VersionPath, self.Update.ScriptPath, self.Update.SavePath, self.Update.CallbackUpdate, self.Update.CallbackNoUpdate, self.Update.CallbackNewVersion, self.Update.CallbackError)
end

function OneFile:Print(text)
    PrintChat(string.format("<font color=\"#4169E1\"><b>[Script TongHop]:</b></font><font color=\"#FFFFFF\"> %s</font>",tostring(text)))
end

function OneFile:Hello()
   if self.supported[myHero.charName] ~= nil then
    PrintChat(string.format("<font color=\"#4169E1\"><b>[Script TongHop]:</b></font><font color=\"#FFFFFF\"> Script tuong dang su dung: %s</font>",self.supported[myHero.charName][self.cfg.c.p:Value()]))
   else
    PrintChat(string.format("<font color=\"#4169E1\"><b>[Script TongHop]:</b></font><font color=\"#FFFFFF\"> Tuong ban dang dung hien khong co script nao ho tro.</font>"))
   end
    PrintChat(string.format("<font color=\"#4169E1\"><b>[Script TongHop]:</b></font><font color=\"#FFFFFF\"> Script duoc viet boi R-N. Good Luck <u>%s</u></font>",GetUser()))
end

if OneFile then OneFile() end
