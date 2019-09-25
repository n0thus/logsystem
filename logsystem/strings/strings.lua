local strings = {
  en = {
    connected = "Connected",
    disconnected = "Disconnected",
    disconnectedByUser = "Disconnected by user",
    timeout = "Timed out / Crash",
    disconnectedQuitCommand = "Disconnected by F8 - quit",

    pnjsuicide = "PNJ/Suicide",
    killercoords = "Killer coords",
    targetcoords = "Target coords",

    localisation = "Localisation",

    resourceContainsCapital = "The resource name for logsystem contains capital letters. It will cause some issues with the UI.",
    newestVersion = "A newest version of logsystem is available (#newVersion#)",
    upToDate = "logsystem up to date !",
    verificationError = "logsystem : Verification of the version failed"
  },

  fr = {
    connected = "Connecté",
    disconnected = "Déconnecté",
    disconnectedByUser = "Déconnecté par l'utilisateur",
    timeout = "Timed out / Crash",
    disconnectedQuitCommand = "Déconnecté via F8 - quit",

    pnjsuicide = "PNJ/Suicide",
    killercoords = "Coordonnées du tueur",
    targetcoords = "Coordonnées de la victime",

    localisation = "Localisation",
    
    resourceContainsCapital = "Le nom de la resource pour logsystem contient des majuscules. Cela causera des problemes avec l'interface.",
    newestVersion = "Une nouvelle version du logsystem est disponible (#newVersion#)",
    upToDate = "logsystem a jour !",
    verificationError = "logsystem : La verification de la version a echouee"
  },

  br = {
    connected = "Conectado",
    disconnected = "Desconectado",
    disconnectedByUser = "Desconectado por usar",
    timeout = "Timed out / Crash",
    disconnectedQuitCommand = "Desconectado usando F8 - quit",

    pnjsuicide = "PNJ/Suicidio",
    killercoords = "Morreu local",
    targetcoords = "Alvo local",

    localisation = "Localização",

    resourceContainsCapital = "O nome do recurso para o sistema de logs contém letras maiúsculas. Isso causará alguns problemas com a interface do usuário.",
    newestVersion = "Uma versão mais recente do sistema de logs está disponível (#newVersion#)",
    upToDate = "Sistema de logs atualizado !",
    verificationError = "logsystem : A verificação da versão falhou"
  },

  nl = {
    connected = "Verbonden",
    disconnected = "Verbroken",
    disconnectedByUser = "Verbinding verbroken door gebruiker",
    timeout = "Time-out / crash",
    disconnectedQuitCommand = "Verbinding verbroken door F8 - quit",

    pnjsuicide = "PNJ/Zelfmoord",
    killercoords = "Moordenaar coördinaten",
    targetcoords = "Target coördinaten",

    localisation = "Localisatie",

    resourceContainsCapital = "De bronnaam voor het logsystem bevat hoofdletters. Het zal enkele problemen met de gebruikersinterface veroorzaken.",
    newestVersion = "Er is een nieuwste versie van logsystem beschikbaar (#newVersion#)",
    upToDate = "logsystem up-to-date!",
    verificationError = "logsystem : Verificatie van de versie is mislukt"
  },

  de = {
    connected = "Verbunden",
    disconnected = "Getrennt",
    disconnectedByUser = "Vom Benutzer getrennt",
    timeout = "Zeitüberschreitung / Absturz",
    disconnectedQuitCommand = "Verbindung getrennt durch F8 - quit",

    pnjsuicide = "PNJ/Selbstmord",
    killercoords = "Killer Koordinaten",
    targetcoords = "Target Koordinaten",

    localisation = "Lokalisierung",

    resourceContainsCapital = "Der Ressourcenname für log system enthält Großbuchstaben. Es wird einige Probleme mit der Benutzeroberfläche verursachen.",
    newestVersion = "Eine neueste Version von logsystem ist verfügbar (#newVersion#)",
    upToDate = "logsystem auf dem Laufenden!",
    verificationError = "logsystem : Überprüfung der Version fehlgeschlagen"
  },    
}

function getString(stringId, replaceArgs)
  local askedString = strings[config.language][stringId]

  if(replaceArgs ~= nil) then
    for toReplace,replaceWith in pairs(replaceArgs) do
      askedString = askedString:gsub(toReplace, replaceWith)
    end
  end

  return askedString
end
