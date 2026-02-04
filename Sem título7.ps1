cls
try {
			$iPGateway = (Get-NetRoute -DestinationPrefix '0.0.0.0/0').NextHop
			$route = route -p add 189.1.167.83 mask 255.255.255.255 $iPGateway
Write-Host "xxxxxxx   $route"
		} catch {
			Write-Host "##[warning]Não foi possivel adicionar o IP"
		}