# 混音青春预告二剪

这是一个抖音竖屏预告卡模板，逻辑是：连续背景音乐 + 官方英文对白 + 中文字幕翻译 + 故事快切 + 媒体评分卡。

## 成片

- 输出文件：`renders/mixtape-trailer-card-v2.mp4`
- 分辨率：`1080x1920`
- 时长：约 `44 秒`
- 声音：关闭每段视频原声，单独铺一条连续背景音乐；有英文对白时压低背景音乐
- 旁白：不做中文旁白
- 画面：中间使用 `9:10` 游戏画面框，字体和标签仍按抖音竖屏尺寸设计
- 字幕：中文字幕按台词节奏逐字出现

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
npm run render -- --fps 30 --quality high --output renders/mixtape-trailer-card-v2.mp4
```

## 素材说明

官方 YouTube 预告尝试下载 2K，但触发机器人验证；用户已授权读取浏览器 cookies，本机 Chrome 数据库锁住、Edge DPAPI 解密失败，所以本版使用 Steam 官方 CDN 的 1080p 高码率素材完成。

素材不提交到 GitHub，只保留工程和流程。
