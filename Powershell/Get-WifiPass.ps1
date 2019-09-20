function Get-WifiPasswords() {

    <#
        .SYNOPSIS
            Function to grab cleartext passwords from saved Wifi profiles from french and english systems.
            For Windows 8.1 and above, admin privileges are not required.
    #>

    $OSLanguage = Get-OSLanguage;
    if ($OSLanguage -eq "fr-FR") {
        $listProfiles = netsh wlan show profiles | Select-String -Pattern "Profil Tous les utilisateurs" | %{ ($_ -split ":")[-1].Trim() };
        $listProfiles | foreach {
            $profileInfo = netsh wlan show profiles name=$_ key=clear;
            $SSID = $profileInfo | Select-String -Pattern "Nom du SSID" | %{ ($_ -split ":")[-1].Trim() };
            $Key = $profileInfo | Select-String -Pattern "Contenu" | %{ ($_ -split ":")[-1].Trim() };
            if ($Key -ne $null) {
                [PSCustomObject]@{
                    WifiProfileName = $SSID;
                    Password = $Key
                } | Format-Table -AutoSize
            }
        }
    }
    elseif ($OSLanguage -eq "en-US") {
        $listProfiles = netsh wlan show profiles | Select-String -Pattern "All User Profile" | %{ ($_ -split ":")[-1].Trim() };
        $listProfiles | foreach {
            $profileInfo = netsh wlan show profiles name=$_ key="clear";
            $SSID = $profileInfo | Select-String -Pattern "SSID Name" | %{ ($_ -split ":")[-1].Trim() };
            $Key = $profileInfo | Select-String -Pattern "Key Content" | %{ ($_ -split ":")[-1].Trim() };
            if ($Key -ne $null) {
                [PSCustomObject]@{
                    WifiProfileName = $SSID;
                    Password = $Key
                } | Format-Table -AutoSize
            }
        }
    }
}

function Get-OSLanguage {
    # Get system language
    return Get-WinSystemLocale | Select -ExpandProperty Name
}
