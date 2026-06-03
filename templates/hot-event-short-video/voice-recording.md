# 自己录旁白的固定要求

录音文件放这里：

```text
assets/user-voice/narration-user.wav
```

录法：

- 直接完整读最终 `scripts/narration.zh.txt`。
- 环境安静，嘴离麦克风 15 到 25 厘米。
- 语气按游戏快报来，重点词加力，句尾别拖。
- 不要配背景音乐。
- 如果读错，停两秒，从上一句重读。

替换方式：

1. 把录音转成 `assets/narration-final.mp3`。
2. 用 ffprobe 看时长。
3. 按录音实际停顿重新更新 `timeline.template.json`。
4. 重新跑检查和渲染。

