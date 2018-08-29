param ([String] $LatestCommit, [String] $PrevCommit)
function Copy-New-Item {
	$SourceFilePath =$args[0]
	$DestinationFilePath =$args[1]
	
	if(-not(Test-Path $DestinationFilePath))
	{
		New-Item-ItemType File -Path $DestinationFilePath -Force
	}
	Copy-Item -Verbose -Path $SourceFilePath -Destination $DestinationFilePath -Force
	}
	git diff --name-only $LatestCommit $PrevCommit --relative > lastcommitchanges.txt $path = $PSScriptRoot 
	write-output "`n"|out-file lastcommitchanges.txt -append
	$s1=@()
	$Files =Get-Content-Path "$path\lastcommitchanges.txt" #Give the file path which has Github's latest file list
	for($i2=0;$i2 -lt $Files.Length; $i2++)
	{
		$s1+=$path+"\"+$Files[$i2].Replace("/","\")
		#Add Source (Git master branch) reference base path instead of "C:\CICD\"
	}
	$s11=@()
	for($i2=0;$i2 -lt $Files.Length;$i2++)
	{
		$s11+=$path+"\Delta\"+$Files[$i2].Replace("/","\")
		#Give the Delta drive Path instead of "C:\Devopp\Delta"
	}
	$s2=$s1.Count
	$s2.GetType()
	$master=Get_ChildItem $path"\src" -recurse
	#Get the files from latest commit in Git
	#master.fullname
	foreach($m in $master)
	{
		for($i2=0;$i2 -lt $s1.length; $i2 ++)
		{
			if($m.fullname -contains $s1[$i2])
			{
				$folder=$m.fullname
				Copy-New-Item $folder $s11[$i2]
			}
			else 
			{
			#write-host "Files do not exist in latest build: $s1[$i2]" `n"
			}
			
		}
		####Read META File into Delta ####
		for($i2=0;$i2 -lt $s1.length;$i2++)
		{
			if($m.fullname -Contains $s1[$i2]+"-meta.xml")
			{
				$folder=$m.fullname
				$s12=$s11[$i2]+"-meta.xml"
				Copy-New-Item $folder $s12
				}
				else 
				{
					#write-host "Files do not exist in latest build: $s1[$i2]" 
				}
			}
		}
	
	