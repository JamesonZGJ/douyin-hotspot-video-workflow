# State of Play 抖音快报

这是一个 HyperFrames 竖屏短视频项目，把 2026-06-03 索尼 State of Play 汇总成 60 秒左右的抖音快报。

## 当前内容

- 重点开头：影之刃零从 2026-09-09 延期到 2026-10-29。
- 官方素材：能稳定下载的用官方 YouTube 1080p 片段；遇到片头、黑场或年龄门的片段，改用官方截图。
- 画面：1080x1920 抖音竖屏，中部保留 3:2 游戏画面框，不强行铺满裁切。
- 旁白：已换成更有力的中文男声 `zh-CN-YunjianNeural`，游戏名按中文读法口播。
- 字幕：手工同步，避免本机 Whisper 不可用。
- GitHub 仓库只保存工作流，不保存官方素材、旁白音频和最终 MP4。

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
npm run render -- --fps 30 --quality high --output renders/stateofplay-douyin.mp4
```

## 搜索记录

- GitHub 可用方案：`bgutil-ytdlp-pot-provider`，用于给 yt-dlp 提供 YouTube PO Token。
- 实测结果：配合 `--remote-components ejs:github` 后，官方片段已成功下载。
- 下载规则已改成优先 1080p，并统一输出到 `assets/hd/`。
- HyperFrames TTS 中文在本机 Windows 下失败，原因是 espeak 数据路径缺失；已改用 `edge-tts` 中文男声。
- YouTube 后段实机片段如果触发年龄验证，需要浏览器 cookies；未获明确同意前不读取 cookies。
