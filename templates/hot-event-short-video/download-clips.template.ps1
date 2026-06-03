chcp 65001 | Out-Null
$ErrorActionPreference = "Stop"
$env:PATH = "$PWD\.venv\Scripts;$PWD\node_modules\ffmpeg-static;$PWD\node_modules\ffprobe-static\bin\win32\x64;$PWD\tools;$env:PATH"
$node = "D:\Soft\nodejs\node.exe"
$server = "$PWD\tools\bgutil-ytdlp-pot-provider\server"
$ffmpeg = "$PWD\node_modules\ffmpeg-static"

$clips = @(
  @{ name = "example"; url = "https://www.youtube.com/watch?v=VIDEO_ID"; section = "*00:00:08-00:00:16" }
)

foreach ($clip in $clips) {
  Write-Host "Downloading $($clip.name)"
  .\.venv\Scripts\python.exe -m yt_dlp `
    --extractor-args "youtubepot-bgutilscript:server_home=$server" `
    --js-runtimes "node:$node" `
    --remote-components ejs:github `
    --no-playlist `
    --ffmpeg-location "$ffmpeg" `
    --force-keyframes-at-cuts `
    -f "bv*[vcodec^=avc1][height<=1080][ext=mp4]/bv*[height<=1080][ext=mp4]/bv*[height<=1080]/best[height<=1080]" `
    --download-sections $clip.section `
    -o "assets/clip-$($clip.name).%(ext)s" `
    $clip.url
}
