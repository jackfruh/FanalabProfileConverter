write-host "this script will convert Fanalab Configuration files from UK format to US format"
write-host "(UK numbers like 84,7 will be replaced with 84.7)"

$filelist = get-childitem -filter "*.pws" -Path . -File
if ($(test-path -path "NA" ) -ne $true)
{
    new-item -path "NA" -ItemType Directory 
}

foreach ($file in $filelist)
{
    #create a new filename that ends in _NA before the extension:
    $newFilename = "NA\$($file.basename)_NA$($file.extension)"

    $content = get-content $file

    write-host "outputing North American format file $newfilename"
    $content.replace(",",".") | out-file $newFilename -NoClobber -Encoding utf8
    
}
write-host "Done"
