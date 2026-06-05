# 混音青春预告二剪

这是一个抖音竖屏预告卡模板，逻辑是：一条官方预告原声音轨 + 中文字幕故事卡 + 快切情绪画面 + 媒体评分卡。

## 成片

- 输出文件：`renders/mixtape-trailer-card-v7-final.mp4`
- 分辨率：`1080x1920`
- 时长：约 `47 秒`
- 声音：关闭每段视频原声，整条成片只用 `steam2.mp4` 的连续官方预告原声，不拼接音乐块
- 旁白：不做中文旁白
- 画面：中间使用 `9:10` 游戏画面框，字体和标签仍按抖音竖屏尺寸设计
- 字幕：中文文案按故事逻辑出现，补齐“最后一晚、海边派对、找线索、去卡桑德拉、友情告别”的线索
- 修正：片段本身预裁成 `9:10`，避免横版信箱和灰底板；相邻片段按源视频时间顺序切，不重复倒回；评分卡上移，不挡左下角片名；结尾片名卡完整显示

## 本地运行

```powershell
npm run dev
```

## 检查

```powershell
npm run lint
npm run validate
npm run inspect -- --samples 12
```

## 渲染

```powershell
npm run render -- --fps 30 --quality high --output renders/mixtape-trailer-card-v7.mp4
..\node_modules\ffmpeg-static\ffmpeg.exe -y -i renders\mixtape-trailer-card-v7.mp4 -filter_complex "color=c=black:s=1080x1920:r=30:d=47[bg];[0:v]crop=972:1080:54:300[content];[bg][content]overlay=54:300:format=auto,format=yuv420p[v]" -map "[v]" -map 0:a -c:v libx264 -preset slow -crf 14 -c:a copy -shortest renders\mixtape-trailer-card-v7-final.mp4
```

## 素材说明

官方 YouTube 预告尝试下载 2K，但触发机器人验证；用户已授权读取浏览器 cookies，本机 Chrome 数据库锁住、Edge DPAPI 解密失败，所以本版使用 Steam 官方 CDN 的 1080p 高码率素材完成。

素材不提交到 GitHub，只保留工程和流程。
