Function Remove-OxyPageFile
{
    $pg = gwmi win32_pagefileusage
    if ($pg) {
        remove-item $pg.name -force
        $true
    }
    $false
}