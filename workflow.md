# 当天热点转抖音短视频工作流

## 1. 核事实

- 优先读官方公告、权威媒体、当事方社媒、原始视频源。
- 把事件名、发生时间、关键人物、结果、争议点、来源和素材写进 `data/facts.json`。
- 最影响讨论度的消息必须放开头，不塞到“补充几条”里。

## 2. 准备可信素材

先装工具：

```powershell
.\.venv\Scripts\python.exe -m pip install -U yt-dlp bgutil-ytdlp-pot-provider edge-tts
git clone --single-branch --branch 1.3.1 https://github.com/Brainicism/bgutil-ytdlp-pot-provider.git .\tools\bgutil-ytdlp-pot-provider
cd .\tools\bgutil-ytdlp-pot-provider\server
npm ci
npx tsc
cd ..\..\..
```

下载片段：

```powershell
powershell -ExecutionPolicy Bypass -File .\tools\download-official-clips.ps1
```

这个 GitHub provider 能处理 YouTube 的 PO Token / 机器人校验。若以后遇到必须登录的年龄门，再加 `--cookies-from-browser edge` 或 `--cookies-from-browser chrome`，但这会读取浏览器 cookies，需要你明确同意。

如果热点不是视频类事件，就改用官方图片、新闻截图、公开图表或自己生成的说明画面。

## 3. 生成旁白

当前使用中文男声：

```powershell
.\.venv\Scripts\edge-tts.exe --file .\scripts\narration.zh.txt --voice zh-CN-YunjianNeural --rate +32% --pitch +2Hz --write-media .\assets\narration-final.mp3 --write-subtitles .\assets\narration-final.vtt
```

如果要用你的声音：

- 直接完整读一遍 `scripts/narration.zh.txt`。
- 环境尽量安静，离麦克风 15 到 25 厘米。
- 语气按“热点快报”来：句尾别拖，重点词稍微加力。
- 输出 WAV 或 MP3，放到 `assets/user-voice/narration-user.wav`。
- 我把它替换成 `assets/narration-final.mp3` 后重新渲染。

## 4. 制作视频

- `index.html` 是 1080x1920 竖屏主工程。
- 主画面固定放在中部 3:2 画面框，避免竖屏强裁导致看不清。
- 动态片段优先使用 1080p，全部 `muted playsinline`。
- 每段画面时长跟着旁白走，旁白没讲完就不能切到下一款游戏。
- 旁白音轨只用 `assets/narration-final.mp3`。
- 字幕目前是手工同步，避免 Whisper 不可用时卡住。

## 5. 检查与渲染

```powershell
npm run lint
npm run validate
npm run inspect -- --samples 12
npm run render -- --fps 30 --quality high --output renders/stateofplay-douyin.mp4
```

验收标准：

- 视频 55 到 65 秒。
- 最大热点在前 10 秒讲清楚。
- 每个重点信息都有可信素材或清晰说明画面。
- 旁白流利，有情绪，不像念稿。
- lint 通过，inspect 无布局问题。

## 6. 官方预告二剪模式

适合游戏、电影、剧集预告，不走中文解说，走“连续官方预告原声 + 中文字幕故事卡 + 背书卡”的节奏。

| 步骤 | 做法 |
|---|---|
| 找素材 | 优先官方 YouTube 2K；不通时用 Steam、官网、PlayStation、Xbox 官方源 |
| 拆声音 | 优先直接用同一条官方预告原声贯穿全片 |
| 背景音乐 | 不要拼多段音乐；如需对白，必须来自同一条连续音轨 |
| 台词翻译 | 用转写工具抓英文，中文字幕只翻关键句，并按台词节奏逐字出现 |
| 画面比例 | 1080x1920 竖屏，中间用 9:10 画面框，不铺满裁切 |
| 快切 | 平均 1 到 3 秒一刀，故事段可以更快 |
| 背书 | 电影奖项换成媒体评分、媒体短评、Steam 评价 |
| 收口 | 片名或核心情绪，不加保存视频自带结尾 |
| 黑位检查 | 抽首帧左上角像素；如果背景不是 #000000，只替换外部背景，不要用全局 curves 压暗整条视频 |

示例项目：`mixtape-trailer-card/`。
