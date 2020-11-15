function Get-UserData ($select) {
    #basic,bars,icons,money,notifications,cooldowns,travel,education,messages,events,timestamp
    $url = 'https://api.torn.com/user/' + $UserID + '?selections=' + $select + '&key=' + $apiKey
    $web = Invoke-WebRequest -Uri $url
    $user = $web.content | ConvertFrom-Json
    Return $user
}
