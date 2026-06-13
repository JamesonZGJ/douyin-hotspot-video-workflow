# Nintendo Direct 6.10.2026 多游戏汇总时间轴

总时长：约 2 分 39 秒  
旁白：`assets/audio/narration-v5.mp3`  
成片：`renders/nintendo-direct-2026-douyin-v5.mp4`

## 成片结构

| 时间段 | 内容 | 画面素材 |
|---|---|---|
| 0:00 - 0:31 | 最大爆点：《塞尔达传说：时之笛》重制 | Zelda |
| 0:31 - 0:54 | 《王国之心4》、鬼武者、Devil May Cry、P 的谎言、合金装备 | KH4 / third-party |
| 0:54 - 1:16 | 《星际火狐》、Nintendo Switch Sports Resort、《斯普拉遁 涂击队》、《节奏天国 奇迹之星》 | first-party clips |
| 1:16 - 1:38 | 《Pokémon Pokopia》免费更新和付费新增内容 | Pokémon Pokopia |
| 1:38 - 1:57 | Xenoblade Genesis、火焰纹章新作、《勇者斗恶龙 怪物仙境》 | JRPG clips |
| 1:57 - 2:19 | The Duskbloods、《咚奇刚 蕉力全开》、最终幻想、Rayman、Minecraft | mid-section clips |
| 2:19 - 2:39 | 结论：王炸在前，但牌桌铺开了 | release cards |

## 口径

| 项目 | 结论 |
|---|---|
| 日期 | 标题按北京时间写 6.10；官方页面原始日期是美国时间 2026-06-09 |
| 风格 | 沿用 State of Play / Xbox 快报模板，并参考玩游戏的阿舔的短视频节奏 |
| 声音 | 改用 `zh-CN-YunxiNeural` 年轻男声，语速 `+20%` |
| 画面 | 使用用户下载的完整发布会视频裁出 17 段动态片段，开头改为《时之笛》重制 |
| 评论分析 | 融进结尾：老 IP 多，但这次阵容厚度确实变强 |
| 游戏名 | 口播使用中文和玩家熟悉叫法，官方台港写法保留在 facts.json |

## 验证

| 检查项 | 结果 |
|---|---|
| HyperFrames lint | 0 错误，0 警告 |
| HyperFrames validate | 0 错误，1 个浏览器 AudioContext 警告 |
| HyperFrames inspect | 0 个布局问题 |
| ffprobe | 成片有 1080x1920 视频流和 AAC 音频流 |
| 抽帧 | 开头、塞尔达、第三方、星际火狐、宝可梦、JRPG、咚奇刚、结尾均已检查 |
