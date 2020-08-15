//%attributes = {"invisible":true,"shared":true,"preemptive":"capable"}
  // File_DoesExist (filePath) : doesExist
  // File_DoesExist (text) : boolean
  // 
  // DESCRIPTION:
  //   Returns true if the file exists. 
  //   Any missing parent folders will be created if missing.
  //
C_TEXT:C284($1;$filePath)  // Path to file
C_BOOLEAN:C305($0;$doesExist)  // File does exist

$doesExist:=False:C215
If (Asserted:C1132(Count parameters:C259=1))
	$filePath:=$1
	
	If ($filePath#"")
		Folder_VerifyExistance (Folder_ParentName ($filePath))  // ensure the parent folder exists
		
		$doesExist:=(Test path name:C476($filePath)=Is a document:K24:1)
	End if 
	
End if 

$0:=$doesExist