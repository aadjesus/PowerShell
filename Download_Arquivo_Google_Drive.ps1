clear

$id = "0BwFJ1e-J6SWqLWUyQ252WmNNTUE&export=download&authuser=0&resourcekey=0-wKSGyBNQ4npTxViq_bjCdg&confirm=t&uuid=d2eb7e87-a904-4968-9ef6-d5d652a2064b&at=AN_67v1UnpkOFRq6wy-BusyRUl4b:172970606650";

$url = "https://drive.usercontent.google.com/download?id=$id";

$output = "c:\tmp\arquivo.pdf";

$response = Invoke-WebRequest -Uri $url -OutFile $output ;
$response.StatusCode;