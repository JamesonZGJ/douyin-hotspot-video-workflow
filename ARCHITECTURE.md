# 架构说明

- `index.html`：HyperFrames 主视频工程，负责竖屏画面、官方片段、字幕、转场和旁白音轨。
- `data/facts.json`：事实表，记录每个游戏的发布日期、延期信息、官方来源和片段来源。
- `data/timeline.json`：时间轴表，记录每段旁白对应的游戏画面和 3:2 画面框位置。
- `scripts/narration.zh.txt`：中文旁白稿。
- `assets/`：官方片段、官方图片和旁白音频。
- `assets/hd/`：1080p 官方动态片段。
- `tools/download-official-clips.ps1`：批量下载官方 YouTube 片段。
- `workflow.md`：复用工作流。
- `templates/hot-event-short-video/`：以后复用的固定式短视频模板。

调用关系：`facts.json` 提供事实依据，`timeline.json` 约束画面和旁白同步，`download-official-clips.ps1` 产出 `assets/hd/clip-*.mp4`，`index.html` 引用片段和旁白，HyperFrames 渲染成 `renders/stateofplay-douyin-v7.mp4`。
