cls

$aaa = "c:\Praxio\GlobusWeb\GlobusWeb.Abastecimento\"
$aaa = "c:\Praxio\Testes2\"

Get-ChildItem -Path $aaa -Filter "package.json" -Depth 2 -Recurse -ErrorAction SilentlyContinue |
				Where-Object { $_.DirectoryName -notmatch "node_modules|dist"} |
				ForEach-Object {

        $achouAlteracao = git diff "^origin/develop" -- $_.FullName
        if (-not [string]::IsNullOrEmpty($achouAlteracao)) {
            "ok"
        }



}