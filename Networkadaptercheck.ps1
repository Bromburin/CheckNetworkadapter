# Liste der virtuellen Adaptertypen (ausgenommen von der Prüfung)
$virtuelleAdapterTypen = @("Hyper-V Virtual Ethernet Adapter", "Microsoft Wi-Fi Direct Virtual Adapter")

Get-NetAdapter | Where-Object {
    $_.Status -eq 'Up' -and 
    ($virtuelleAdapterTypen -notcontains $_.InterfaceDescription)
} | ForEach-Object {
    $adapterName = $_.Name
    $linkspeed = $_.LinkSpeed

    if ($linkspeed -notlike "*Gbps") {
        Write-Output "Adapter: $adapterName `nStatus: Fehler `nGeschwindigkeit: $linkspeed"
        # Hier können zusätzliche Aktionen eingefügt werden, z. B. Logging oder Benachrichtigung
    }
    else {
        Write-Output "Adapter: $adapterName `nStatus: OK `nGeschwindigkeit: $linkspeed"
    }
}
