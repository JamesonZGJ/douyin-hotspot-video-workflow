# 热点短视频工作流

这是一个把当天时事热点整理成 60 秒左右抖音竖屏快报的工作流。

它适合处理发布会、突发新闻、行业热点、娱乐事件、游戏新闻等内容：先核事实，再写中文旁白，再配官方或可信素材，最后生成可发抖音的视频工程。

## 当前示例

- 示例项目：2026-06-03 索尼 State of Play 抖音快报。
- 重点写法：先讲最影响讨论度的消息，再快速扫完整场重点。
- 官方素材：能稳定下载的用官方 1080p 片段；遇到片头、黑场或年龄门的片段，改用官方截图。
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

## 复用方式

1. 用 `data/facts.json` 记录事实、时间、来源和素材。
2. 用 `scripts/narration.zh.txt` 写 55 到 65 秒中文旁白。
3. 用 `data/timeline.json` 对齐旁白和画面。
4. 用 `index.html` 生成 1080x1920 竖屏视频。
5. 用 `templates/hot-event-short-video/` 作为下一条热点视频的固定模板。

## 搜索记录

- GitHub 可用方案：`bgutil-ytdlp-pot-provider`，用于给 yt-dlp 提供 YouTube PO Token。
- 实测结果：配合 `--remote-components ejs:github` 后，官方片段已成功下载。
- 下载规则已改成优先 1080p，并统一输出到 `assets/hd/`。
- HyperFrames TTS 中文在本机 Windows 下失败，原因是 espeak 数据路径缺失；已改用 `edge-tts` 中文男声。
- YouTube 后段实机片段如果触发年龄验证，需要浏览器 cookies；未获明确同意前不读取 cookies。
