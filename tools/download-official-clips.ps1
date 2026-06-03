chcp 65001 | Out-Null
$ErrorActionPreference = "Stop"
$env:PATH = "$PWD\.venv\Scripts;$PWD\node_modules\ffmpeg-static;$PWD\node_modules\ffprobe-static\bin\win32\x64;$PWD\tools;$env:PATH"
$node = "D:\Soft\nodejs\node.exe"
$server = "$PWD\tools\bgutil-ytdlp-pot-provider\server"
$ffmpeg = "$PWD\node_modules\ffmpeg-static"
New-Item -ItemType Directory -Force -Path "assets\hd" | Out-Null

$clips = @(
  @{ name = "phantom-blade-zero-main"; url = "https://www.youtube.com/watch?v=ZX8mHo0aSbc"; section = "*00:00:04-00:00:16" },
  @{ name = "wolverine-main"; url = "https://www.youtube.com/watch?v=OiBo_NgYI5Q"; section = "*00:00:06-00:00:14" },
  @{ name = "god-of-war-laufey"; url = "https://www.youtube.com/watch?v=HLMX2w3cwuE"; section = "*00:00:07-00:00:12" },
  @{ name = "until-dawn-2"; url = "https://www.youtube.com/watch?v=QpVZ9OvRLZI"; section = "*00:00:05-00:00:10" },
  @{ name = "silent-hill-townfall"; url = "https://www.youtube.com/watch?v=eXLfSEipn7I"; section = "*00:00:05-00:00:10" },
  @{ name = "control-resonant"; url = "https://www.youtube.com/watch?v=TAzxTMaA6j4"; section = "*00:00:06-00:00:11" },
  @{ name = "onimusha"; url = "https://www.youtube.com/watch?v=LNq35HHUtNc"; section = "*00:00:06-00:00:11" },
  @{ name = "rayman-retold"; url = "https://www.youtube.com/watch?v=TKfG9hiueak"; section = "*00:00:06-00:00:11" },
  @{ name = "ace-combat-8"; url = "https://www.youtube.com/watch?v=cW6zBuO7sb4"; section = "*00:00:06-00:00:11" },
  @{ name = "marvel-tokon"; url = "https://www.youtube.com/watch?v=cen2Lbmmo_Q"; section = "*00:00:06-00:00:11" },
  @{ name = "marathon-s2"; url = "https://www.youtube.com/watch?v=-WVhTcByDyY"; section = "*00:00:06-00:00:11" },
  @{ name = "dune-awakening"; url = "https://www.youtube.com/watch?v=iCKflvFn4p4"; section = "*00:00:06-00:00:11" }
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
    -o "assets/hd/clip-$($clip.name).%(ext)s" `
    $clip.url
}
