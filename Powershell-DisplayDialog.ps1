#create the hash table for the dialog reply. I named "dialogReply"
#see what I did there?
$dialogReply = [ordered]@{}

#this seems kludgy, and it is, but it works fairly well. I have't tested it with all the display dialog options, but it seems to work well
#the reason for piping this to osascript is because of how powershell deals with the levels of quoting in osascript, namely, poorly
$results = 'display dialog "this is a test" default answer "default answer" with icon caution'|/usr/bin/osascript

#split the string on a comma, and put each entry into an array
$results = $results.Split(",")

#go through the array and run trim() on all the array members to remove leading/trailing spaces
#then shove each one into a hash table. I would love to use convertfrom-stringdata, but you can't append with that
#and I kind of need appending. so we split each entry in $result and shove that into a hashtable. Ungainly, but it works
#and since the dialog reply in applescript is an applescript record, aka a hash table with a colon delimiter, 
#the assumptions I make here are safe.

foreach ($result in $results) {
     $result = $result.Trim()
     $temp = $result.Split(":")
     $dialogReply.Add($temp[0],$temp[1])
}
$dialogReply
