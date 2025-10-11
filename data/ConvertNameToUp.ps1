$diretorio = "monster\"  # Substitua pelo caminho do diretório onde seus arquivos XML estão localizados

$files = Get-ChildItem -Path $diretorio -Filter *.xml

foreach ($file in $files) {
    [xml]$xml = Get-Content $file.FullName
    
    foreach ($monster in $xml.SelectNodes("//monster")) {
        $name = $monster.GetAttribute("name")
        $culture = [System.Globalization.CultureInfo]::InvariantCulture
        $capitalizedName = $culture.TextInfo.ToTitleCase($name)
        $monster.SetAttribute("name", $capitalizedName)
    }
    
    $xml.Save($file.FullName)
}