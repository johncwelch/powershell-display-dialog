# powershell-display-dialog
A way to use Applescript's display dialog with PowerShell.

One of the more annoying things with PowerShell on any platform is the lack of UI primitives. Simple things like a dialog box, an alert box, choosing from a list, choosing a file are really harder than they should be because on Windows, PowerShell relys on .Net to do any form of UI control. 

If you're used to AppleScript, where you have a variety of UI primitives available, this is really annoying. So I set out to create a way to use things like AppleScript's "Display Dialog" with PowerShell. 

The short answer is you can, the long answer is, using osascript with PowerShell is a pain in the keister, and the PS team should make this work better. Using osascript requires a lot of quoting that PowerShell just vomits all over. So you end up piping the command to osascript. If you read the code, this makes more sense. 

Luckily, since most AppleScript UI commands tend to return records, the data is predictably and reliably strutured, so getting it into a hash table or array is straightforward. In this example, we get it into a hashtable at the end. 

note that as long as it's a single step command, you should be able to use a variety of AppleScript UI primitives with powershell. 
