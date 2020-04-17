# sbc-bitpool-expander

This is a simple tool for the sound quality improving of wireless headphones with the sbc codec on a mac.

[![status](https://img.shields.io/badge/status-frozen-inactive?style=flat-square)](BADGES_GUIDE.md#status) [![version](https://img.shields.io/badge/version-1.0.0-informational?style=flat-square)](BADGES_GUIDE.md@version) [![build](https://img.shields.io/badge/build-passing-success?style=flat-square)](BADGES_GUIDE.md#build) [![oss lifecycle](https://img.shields.io/badge/oss_lifecycle-maintenance-important?style=flat-square)](BADGES_GUIDE.md#oss-lifecycle) [![maintenance](https://img.shields.io/badge/maintenance-yes-informational?style=flat-square)](BADGES_GUIDE.md#maintenance)  [![latest release date](https://img.shields.io/badge/latest_release_date-April_03,_2020-informational?style=flat-square)](BADGES_GUIDE.md#release-date) [![last commit](https://img.shields.io/badge/last_commit-April_17,_2020-informational?style=flat-square)](BADGES_GUIDE.md#commit-date)

[![license](https://img.shields.io/badge/license-MIT-informational?style=flat-square)](LICENSE) [![Contributor Covenant](https://img.shields.io/badge/Contributor%20Covenant-v2.0%20adopted-ff69b4.svg)](code_of_conduct.md)

[![platform](https://img.shields.io/badge/platform-macOS_10.14+-important?style=flat-square)](https://en.wikipedia.org/wiki/Computing_platform)

---

## 📇 Table of Contents

- [About](#about)
-   [Demo](#demo)
-   [Features](#feature)
- [Getting Started](#getting-started)
- [Built With](#built-with)
-   [Contributing](#contributing)
-   [Code of Conduct](#code-of-conduct)
-   [Versioning](#versioning)
-   [Authors](#authors)
-   [Licensing](#licensing)

##  📖 About

The sbc-bitpool-expander is a mac automator program, which executes a shell command to change the SBC encoding bitpool values. This changes could up the bitrate value till 357 kbit/s for SBC audio.

### 	Motivation

The SBC codec has many different parameters:

- Channels count and type: Joint Stereo, Stereo, Dual Channel, Mono;
- Frequency bands count: 4 or 8;
- Package blocks count: 4, 8, 12, 16;
- Quantization bit allocation algorithm: volume, SNR;
- bit pools max-min value: in  usually it's from 2 to 53.

***These parametters uses the bitpool value and affects the final audio quality.***

*For instance, Dual Channel mode encodes channels separately, using the entire bitpool for each channel. The forcing device to use Dual Channel instead of Joint Stereo, allos get an almost double bitrate with the same maximum bitpool value: 617 kbps.*

These fixed values, Bitpool and Bitrate, originate from a table with high-quality audio recommended values. But it's just a recommendations.
![The high-quality audio recommended values](resources/about/high-quality-audio-recommended-values.png)

The Bluetooth stack of macOS have artificial limitations on the maximum value of the bitpool parameter: 

- Min A2DP bit pool value is  among 2;
- Max A2DP bit pool value is  among 40;
- Fact A2DP bit pool value is dinamicaly and changes from max to min values.
  This limitations directly affects the maximum bitrate.

***Almost all headphones also limit the maximum bitpool value to 53. But such a bitrate will never be negotiated under normal conditions, on ordinary Bluetooth stacks on macOS.***

### How does it work?

The sbc-bitpool-expander is a mac automator program, which executes a shell command to change the SBC encoding bitpool values. This changes could up the bitrate value till 357 kbit/s for SBC audio. At launch, this tool setups the bit pool min value to 53. This setupping prevents the bit pool from being changing to the standard minimum values ​of 2 and affects the final bitrate and sound quality.

## 📸 Demo

The demonstration shows how the increasing bit rate from 261 kb/s (BEFORE) to 357 kb/s (AFTER) by the bitpool increases after launching this tool.

![The audio graph before usage](resources/demo/before-usage.png){: .callout} ![The audio graph after usage](resources/demo/after-usage.png){: .callout}

After launching this tool, the following lines will appear in the bluetoothaudiod macOS settings:

```bash
{
    ...
    "Apple Bitpool Max" = 64;
    "Apple Bitpool Min" = 53;
    "Apple Initial Bitpool" = 53;
    "Apple Initial Min" = 53;
    "Apple channel type" = "Dual Channel";
    "Negotiated Bitpool" = 53;
    "Negotiated Bitpool Max" = 64;
    "Negotiated Bitpool Min" = 53;
    ...
}
```

## 🎚 Features

- Increase the sbc bluetooth audio bit rate with in one click.

### To Do

- For more information on an upcoming development, please read the [todo](TODO.md) list.

### Changelog

- For more information on a releases, a features and a changes, please read the [changelog](CHANGELOG.md) notes.

## 🚦 Getting Started

These instructions allow to get a copy of this project and run it on a local machine.

### Prerequisites

Before using it, make sure that follows software are installed on the local machine:

- **[macOS](https://www.apple.com/ru/macos/what-is/)** - the operating system under which the process is executing;
- **[Automator](https://support.apple.com/guide/automator/welcome/mac)** - the program for operations automation.

If any of the listed programs is not installed, then it can be installed by instruction as described below.

1. #### macOS
    - Install macOS by [this](https://support.apple.com/ht201372) instruction.

2. #### Automator

    - Automator is included on macOS. Just install the macOS.

### Installing

In order to install it is quite simple to clone or download this repository.

### Cloning

For the cloning this repository to a local machine, just use the follows link:

```http
https://github.com/ololx/sbc-bitpoll-expander
```

### Using

For use it is required to:

1. Go to the directory with this tool (optionally):

   - via Finder;
   - via Terminal prompt; 

   ```bash
   cd /{path to parent dir with this repository}/sbc-bitpoll-expander
   ```

2. Launch the tool in macOS (optionally):

   - via double-click on `sbc bitpool expander.app`;
   - via Terminal prompt;

   ```bash
   open sbc\ bitpool\ expander.app
   ```

3. Enter the administrator credentials if necessary

4. Reconnect a headphones to a local machine via `Bluetooth`

## 🛠 Built With

- **[Automator](https://support.apple.com/guide/automator/welcome/mac)** - the program for operations automation.

## 🎉 Contributing

If you want to contribute this project - you are welcome and have fun.
Please visit the [contributing](CONTRIBUTING.md) section for details on this code of conduct, and the process for submitting pull requests.

## 📝 Code of Conduct

In order to ensure that all is welcoming, please review and abide by the [code of conduct](CODE_OF_CONDUCT.md).

## 🗒 Versioning

For the versioning is used [Semantic Versioning](http://semver.org/). For the versions available, see the [changelog](CHANGELOG.md) or the tags on this repository.

## ©️ Authors

* **Alexander A. Kropotin** - *Initial work* - [ololx](https://github.com/ololx).

## 🔏 Licensing

This project is licensed under the MIT license - see the [lisence](LICENSE) document for details.
