local VERSION = "0.0.5"
function checkVersion()
  PerformHttpRequest("https://raw.githubusercontent.com/n0thus/logsystem/master/version.json", function(err, text, h)
    if err == 200 then
      local versionArray = json.decode(text)
      local gitVersion = versionArray.version

      if(VERSION ~= gitVersion) then
        print("^1\n=================================\n")
        local patchnoteArray = versionArray.patchnote
        local patchnote = ""
        for _, line in pairs(patchnoteArray) do
          patchnote = patchnote.."- "..line.."\n"
        end

        print(getString("newestVersion", {["#newVersion#"]=gitVersion}))
        print(patchnote)
        print("\n=================================^0\n")
      else
        print("^2"..getString("upToDate").."^0")
      end
    else
      print("^1"..getString("verificationError").."^0")
    end
  end, "GET")
end



Citizen.CreateThread(function()
  if(config.autoCheckVersion) then
    checkVersion()
  end
end)
