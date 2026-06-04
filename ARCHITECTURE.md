# 架构说明

- `index.html`：HyperFrames 主视频工程，负责竖屏画面、官方片段、字幕、转场和旁白音轨。
- `data/facts.json`：事实表，记录事件、时间、关键点、官方来源和片段来源。
- `data/timeline.json`：时间轴表，记录每段旁白对应的画面和 3:2 画面框位置。
- `scripts/narration.zh.txt`：中文旁白稿。
- `assets/`：官方片段、官方图片和旁白音频。
- `assets/hd/`：1080p 官方动态片段。
- `tools/download-official-clips.ps1`：批量下载官方 YouTube 片段。
- `workflow.md`：复用工作流。
- `templates/hot-event-short-video/`：以后复用的固定式短视频模板。
- `mixtape-trailer-card/`：官方预告情绪卡子项目，使用连续背景音乐、关键英文对白、中文字幕和媒体评分卡。
- `mixtape-trailer-card/data/timeline.json`：记录每个预告片段的来源时间、成片时间和中文字幕。
- `mixtape-trailer-card/workflow.md`：同类“官方预告转抖音预告卡”的复用流程。

调用关系：`facts.json` 提供事实依据，`timeline.json` 约束画面和旁白同步，`download-official-clips.ps1` 产出 `assets/hd/clip-*.mp4`，`index.html` 引用片段和旁白，HyperFrames 渲染成抖音竖屏 MP4。

预告二剪调用关系：官方预告下载到子项目 `assets/source/`，FFmpeg 预切静音画面到 `assets/clips-v2/`，对白和背景音乐单独混成 `assets/audio/final-mix-v2.m4a`，`data/timeline.json` 记录片段和字幕，`index.html` 引用短片段并叠加中文翻译，HyperFrames 渲染成 `renders/mixtape-trailer-card-v2.mp4`。
