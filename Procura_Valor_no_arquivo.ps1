clear 

$diretorio = 'c:\Praxio\Praxio.RhTaOn\'

$arquivo = Get-ChildItem -Path 'c:\Praxio\Praxio.RhTaOn\' -Recurse -Filter appsettings.json -ErrorAction SilentlyContinue | Select-Object -First 1
$arquivo = Get-ChildItem -Path $diretorio -Recurse -Filter $nomeArquivo -ErrorAction SilentlyContinue | Select-Object -First 1

$achouElasticSearch = $false
if ($arquivo -ne $null) {
    $conteudo = Get-Content -Path $arquivo.FullName -Raw
    $achouElasticSearch = $conteudo.Contains("Elasticsearch") -and $conteudo.Contains("indexFormat")
}

$achouElasticSearch