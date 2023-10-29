# ProjectName

<!-- PROJECT SHIELDS -->
[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![MIT License][license-shield]][license-url]
[![LinkedIn][linkedin-shield]][linkedin-url]

<!-- PROJECT LOGO -->
<br />
<p align="center">
  <a href="https://github.com/MoonGrt/FPGA-cpu/">
    <img src="images/logo.png" alt="Logo" width="80" height="80">
  </a>
  <h3 align="center">FPGA-CPU</h3>
  <p align="center">
    16位单周期cpu
    <br />
    <a href="https://github.com/MoonGrt/FPGA-cpu"><strong>探索本项目的文档 ?</strong></a>
    <br />
    <br />
    <a href="https://github.com/MoonGrt/FPGA-cpu">查看Demo</a>
    ·
    <a href="https://github.com/MoonGrt/FPGA-cpu/issues">报告Bug</a>
    ·
    <a href="https://github.com/MoonGrt/FPGA-cpu/issues">提出新特性</a>
  </p>
</p>

16位单周期cpu。拥有外设：led、tube、uart、switch。支持uart debug。
 
## 目录

- [上手指南](#上手指南)
  - [开发前的配置要求](#开发前的配置要求)
- [文件目录说明](#文件目录说明)
- [框架](#使用到的框架)
- [贡献者](#贡献者)
  - [如何参与开源项目](#参与开源项目)
- [版本控制](#版本控制)
- [作者](#作者)
- [鸣谢](#鸣谢)

### 上手指南

…………………………………………………………………………………………

###### 开发前的配置要求

1. vivado 2018.3
2. 依元素科技 EES-331

### 文件目录说明

```
filetree 
├── README.md
├── cpu6_6.srcs
│  ├── sources_1
│  │  ├── bus
│  │  ├── cpu
│  │  ├── ip
│  │  ├── para.v
│  │  ├── top.v
```

### 框架

- [tinyrsic](https://github.com/liangkangnan/tinyriscv/tree/master)
- [BLGS](https://www.zhihu.com/column/c_1530950608688910336)

### 贡献者

请阅读**CONTRIBUTING.md** 查阅为该项目做出贡献的开发者。

#### 参与开源项目

贡献使开源社区成为一个学习、激励和创造的绝佳场所。你所作的任何贡献都是**非常感谢**的。

1. Fork the Project
2. Create your Feature Branch
3. Commit your Changes
4. Push to the Branch
5. Open a Pull Request

### 版本控制

该项目使用Git进行版本管理。您可以在repository参看当前可用版本。

### 作者

1561145394@qq.com
 *您也可以在贡献者名单中参看所有参与该项目的开发者。*

### 鸣谢

- [GitHub Pages](https://pages.github.com)
- [xxxxxxxxxxxxxx](https://xxxx)
- [xxxxxxxxxxxxxx](https://xxxx)

<!-- links -->
[contributors-shield]: https://img.shields.io/github/contributors/MoonGrt/FPGA-cpu.svg?style=flat-square
[contributors-url]: https://github.com/MoonGrt/FPGA-cpu/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/MoonGrt/FPGA-cpu.svg?style=flat-square
[forks-url]: https://github.com/MoonGrt/FPGA-cpu/network/members
[stars-shield]: https://img.shields.io/github/stars/MoonGrt/FPGA-cpu.svg?style=flat-square
[stars-url]: https://github.com/MoonGrt/FPGA-cpu/stargazers
[issues-shield]: https://img.shields.io/github/issues/MoonGrt/FPGA-cpu.svg?style=flat-square
[issues-url]: https://img.shields.io/github/issues/MoonGrt/FPGA-cpu.svg
[license-shield]: https://img.shields.io/github/license/MoonGrt/FPGA-cpu.svg?style=flat-square
[license-url]: https://github.com/MoonGrt/FPGA-cpu/blob/master/LICENSE.txt
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=flat-square&logo=linkedin&colorB=555
[linkedin-url]: https://linkedin.com/in/shaojintian
