<div id="top"></div>

[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![MIT License][license-shield]][license-url]


<!-- PROJECT LOGO -->
<br />
<div align="center">
	<a href="https://github.com/MoonGrt/FPGA-cpu">
	<img src="images/logo.png" alt="Logo" width="80" height="80">
	</a>
<h3 align="center">FPGA-cpu</h3>
	<p align="center">
	This project is a 16-bit single-cycle CPU system implemented on FPGA, featuring a 100Hz clock frequency and Harvard architecture. It integrates peripherals such as LED, seven-segment display, UART, and switches, with support for UART debugging. It provides a comprehensive solution for embedded system development.
	<br />
	<a href="https://github.com/MoonGrt/FPGA-cpu"><strong>Explore the docs »</strong></a>
	<br />
	<br />
	<a href="https://github.com/MoonGrt/FPGA-cpu">View Demo</a>
	·
	<a href="https://github.com/MoonGrt/FPGA-cpu/issues">Report Bug</a>
	·
	<a href="https://github.com/MoonGrt/FPGA-cpu/issues">Request Feature</a>
	</p>
</div>


<!-- CONTENTS -->
<details open>
  <summary>Contents</summary>
  <ol>
    <li><a href="#file-tree">File Tree</a></li>
    <li><a href="#contributing">Contributing</a></li>
    <li><a href="#license">License</a></li>
    <li><a href="#contact">Contact</a></li>
    <li><a href="#acknowledgments">Acknowledgments</a></li>
  </ol>
</details>


<!-- FILE TREE -->
## File Tree

```
└─ Project
  ├─ CPU.xpr
  ├─ LICENSE
  ├─ README.md
  ├─ /code/
  ├─ /CPU.cache/
  ├─ /CPU.hw/
  ├─ /CPU.ip_user_files/
  ├─ /CPU.runs/
  ├─ /CPU.sim/
  ├─ /CPU.srcs/
  │ ├─ /sim_1/
  │ │ └─ /new/
  │ │   ├─ alu_sim.v
  │ │   ├─ cmp_sim.v
  │ │   ├─ sim.v
  │ │   └─ sim_uart.v
  │ └─ /sources_1/
  │   ├─ /ip/
  │   │ ├─ /cpuclk/
  │   │ │ ├─ cpuclk.dcp
  │   │ │ ├─ cpuclk.v
  │   │ │ ├─ cpuclk.veo
  │   │ │ ├─ cpuclk.xci
  │   │ │ ├─ cpuclk.xdc
  │   │ │ ├─ cpuclk.xml
  │   │ │ ├─ cpuclk_board.xdc
  │   │ │ ├─ cpuclk_clk_wiz.v
  │   │ │ ├─ cpuclk_ooc.xdc
  │   │ │ ├─ cpuclk_sim_netlist.v
  │   │ │ ├─ cpuclk_sim_netlist.vhdl
  │   │ │ ├─ cpuclk_stub.v
  │   │ │ ├─ cpuclk_stub.vhdl
  │   │ │ ├─ mmcm_pll_drp_func_7s_mmcm.vh
  │   │ │ ├─ mmcm_pll_drp_func_7s_pll.vh
  │   │ │ ├─ mmcm_pll_drp_func_us_mmcm.vh
  │   │ │ ├─ mmcm_pll_drp_func_us_pll.vh
  │   │ │ ├─ mmcm_pll_drp_func_us_plus_mmcm.vh
  │   │ │ ├─ mmcm_pll_drp_func_us_plus_pll.vh
  │   │ │ └─ /doc/
  │   │ │   └─ clk_wiz_v6_0_changelog.txt
  │   │ ├─ /data_mem/
  │   │ │ ├─ data_mem.dcp
  │   │ │ ├─ data_mem.veo
  │   │ │ ├─ data_mem.vho
  │   │ │ ├─ data_mem.xci
  │   │ │ ├─ data_mem.xml
  │   │ │ ├─ data_mem_ooc.xdc
  │   │ │ ├─ data_mem_sim_netlist.v
  │   │ │ ├─ data_mem_sim_netlist.vhdl
  │   │ │ ├─ data_mem_stub.v
  │   │ │ ├─ data_mem_stub.vhdl
  │   │ │ ├─ /doc/
  │   │ │ │ └─ dist_mem_gen_v8_0_changelog.txt
  │   │ │ ├─ /hdl/
  │   │ │ │ └─ dist_mem_gen_v8_0_vhsyn_rfs.vhd
  │   │ │ ├─ /sim/
  │   │ │ │ └─ data_mem.v
  │   │ │ ├─ /simulation/
  │   │ │ │ └─ dist_mem_gen_v8_0.v
  │   │ │ └─ /synth/
  │   │ │   └─ data_mem.vhd
  │   │ └─ /inst_mem/
  │   │   ├─ inst_mem.dcp
  │   │   ├─ inst_mem.mif
  │   │   ├─ inst_mem.veo
  │   │   ├─ inst_mem.vho
  │   │   ├─ inst_mem.xci
  │   │   ├─ inst_mem.xml
  │   │   ├─ inst_mem_sim_netlist.v
  │   │   ├─ inst_mem_sim_netlist.vhdl
  │   │   ├─ inst_mem_stub.v
  │   │   ├─ inst_mem_stub.vhdl
  │   │   ├─ /doc/
  │   │   │ └─ dist_mem_gen_v8_0_changelog.txt
  │   │   ├─ /sim/
  │   │   │ └─ inst_mem.v
  │   │   └─ /simulation/
  │   │     └─ dist_mem_gen_v8_0.v
  │   └─ /new/
  │     ├─ ALU.v
  │     ├─ Buffer.v
  │     ├─ BUS.v
  │     ├─ CMP.v
  │     ├─ counter.v
  │     ├─ cpu.v
  │     ├─ crtl.v
  │     ├─ deviceclk.v
  │     ├─ digit_tube.v
  │     ├─ EX.v
  │     ├─ ID.v
  │     ├─ IF.v
  │     ├─ Inctrl_led.v
  │     ├─ Inctrl_tube.v
  │     ├─ led.v
  │     ├─ OutCtrl_Switch.v
  │     ├─ para.v
  │     ├─ RAM.v
  │     ├─ REG.v
  │     ├─ Switch.v
  │     ├─ Timer.v
  │     ├─ top.v
  │     ├─ UART.v
  │     ├─ uart_recv.v
  │     ├─ uart_send.v
  │     └─ WB.v
  ├─ /document/
  └─ /images/

```


<!-- CONTRIBUTING -->
## Contributing
Contributions are what make the open source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.
If you have a suggestion that would make this better, please fork the repo and create a pull request. You can also simply open an issue with the tag "enhancement".
Don't forget to give the project a star! Thanks again!
1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request
<p align="right">(<a href="#top">top</a>)</p>


<!-- LICENSE -->
## License
Distributed under the MIT License. See `LICENSE` for more information.
<p align="right">(<a href="#top">top</a>)</p>


<!-- CONTACT -->
## Contact
MoonGrt - 1561145394@qq.com
Project Link: [MoonGrt/](https://github.com/MoonGrt/)
<p align="right">(<a href="#top">top</a>)</p>


<!-- ACKNOWLEDGMENTS -->
## Acknowledgments
* [Choose an Open Source License](https://choosealicense.com)
* [GitHub Emoji Cheat Sheet](https://www.webpagefx.com/tools/emoji-cheat-sheet)
* [Malven's Flexbox Cheatsheet](https://flexbox.malven.co/)
* [Malven's Grid Cheatsheet](https://grid.malven.co/)
* [Img Shields](https://shields.io)
* [GitHub Pages](https://pages.github.com)
* [Font Awesome](https://fontawesome.com)
* [React Icons](https://react-icons.github.io/react-icons/search)   
<p align="right">(<a href="#top">top</a>)</p>


<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[contributors-shield]: https://img.shields.io/github/contributors/MoonGrt/FPGA-cpu.svg?style=for-the-badge
[contributors-url]: https://github.com/MoonGrt/FPGA-cpu/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/MoonGrt/FPGA-cpu.svg?style=for-the-badge
[forks-url]: https://github.com/MoonGrt/FPGA-cpu/network/members
[stars-shield]: https://img.shields.io/github/stars/MoonGrt/FPGA-cpu.svg?style=for-the-badge
[stars-url]: https://github.com/MoonGrt/FPGA-cpu/stargazers
[issues-shield]: https://img.shields.io/github/issues/MoonGrt/FPGA-cpu.svg?style=for-the-badge
[issues-url]: https://github.com/MoonGrt/FPGA-cpu/issues
[license-shield]: https://img.shields.io/github/license/MoonGrt/FPGA-cpu.svg?style=for-the-badge
[license-url]: https://github.com/MoonGrt/FPGA-cpu/blob/master/LICENSE

