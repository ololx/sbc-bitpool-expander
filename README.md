# sbc-bitpool-expander

This is a simple tool for the sound quality improving of wireless headphones with the sbc codec on a mac.

[![status](https://img.shields.io/badge/status-frozen-inactive?style=flat-square)](BADGES_GUIDE.md#status) [![version](https://img.shields.io/badge/version-2.2.0-informational?style=flat-square)](BADGES_GUIDE.md@version) [![oss lifecycle](https://img.shields.io/badge/oss_lifecycle-maintenance-important?style=flat-square)](BADGES_GUIDE.md#oss-lifecycle) [![maintenance](https://img.shields.io/badge/maintenance-yes-informational?style=flat-square)](BADGES_GUIDE.md#maintenance)  [![latest release date](https://img.shields.io/badge/latest_release_date-November_25,_2020-informational?style=flat-square)](BADGES_GUIDE.md#release-date) [![last commit](https://img.shields.io/badge/last_commit-November_25,_2020-informational?style=flat-square)](BADGES_GUIDE.md#commit-date)

[![license](https://img.shields.io/badge/license-MIT-informational?style=flat-square)](LICENSE) [![Contributor Covenant](https://img.shields.io/badge/Contributor%20Covenant-v2.0%20adopted-ff69b4.svg?style=flat-square)](code_of_conduct.md)

[![platform](https://img.shields.io/badge/platform-macOS_10.14+-important?style=flat-square)](https://en.wikipedia.org/wiki/Computing_platform)

---

## 📇 Table of Contents

- [About](#about)
- [Demo](#demo)
- [Features](#feature)
- [Getting Started](#getting-started)
- [Built With](#built-with)
- [Contributing](#contributing)
- [Code of Conduct](#code-of-conduct)
- [Versioning](#versioning)
- [Authors](#authors)
- [Licensing](#licensing)

## 📖 About

The sbc-bitpool-expander is a mac automator program, which executes a shell command to change the SBC encoding bitpool values. This changes could up the bitrate value till 357 kbit/s for SBC audio.

### Motivation

The SBC codec has many different parameters:

- Channels count and type: Joint Stereo, Stereo, Dual Channel, Mono;
- Frequency bands count: 4 or 8;
- Package blocks count: 4, 8, 12, 16;
- Quantization bit allocation algorithm: volume, SNR;
- bit pools max-min value: in  usually it's from 2 to 53.

***These parametters uses the bitpool value and affects the final audio quality.***

*For instance, Dual Channel mode encodes channels separately, using the entire bitpool for each channel. The forcing device to use Dual Channel instead of Joint Stereo, allos get an almost double bitrate with the same maximum bitpool value: 617 kbps.*

These fixed values, Bitpool and Bitrate, originate from a table with high-quality audio recommended values. But it's just a recommendations.
![The high-quality audio recommended values](https://github.com/ololx/sbc-bitpool-expander/blob/assets/about/high-quality-audio-recommended-values.png?raw=true)

The Bluetooth stack of macOS have artificial limitations on the maximum value of the bitpool parameter: 

- Min A2DP bit pool value is  among 2;
- Max A2DP bit pool value is  among 40;
- Fact A2DP bit pool value is dinamicaly and changes from max to min values.
  This limitations directly affects the maximum bitrate.

***Almost all headphones also limit the maximum bitpool value to 53. But such a bitrate will never be negotiated under normal conditions, on ordinary Bluetooth stacks on macOS.***

### How does it work?

The sbc-bitpool-expander is a mac automator program, which executes a shell command to change the SBC encoding bitpool values. This changes could up the bitrate value till 357 kbit/s for SBC audio. At launch, this tool setups the bit pool min value to 53. This setupping prevents the bit pool from being changing to the standard minimum values ​of 2 and affects the final bitrate and sound quality.

## 📸 Demo

### Usage

This animation demonstrates how is the simple to use this tool.

![The tool demo](https://github.com/ololx/sbc-bitpool-expander/blob/assets/demo/sbc-bitpool-expander-demo.gif?raw=true)

### Effect
This pictures demonstrates how the increasing bit rate from 261 kb/s (BEFORE) to 357 kb/s (AFTER) by the bitpool increases after launching this tool.

![The audio graph before usage](https://github.com/ololx/sbc-bitpool-expander/blob/assets/demo/before-usage.png?raw=true) ![The audio graph after usage](https://github.com/ololx/sbc-bitpool-expander/blob/assets/demo/after-usage.png?raw=true)

After launching this tool, the following lines will appear in the bluetoothaudiod macOS settings:

```bash
{
    ...
    "Apple Bitpool Max" = 64;
    "Apple Bitpool Min" = 53;
    "Apple Initial Bitpool" = 53;
    "Apple Initial Min" = 53;
    "Negotiated Bitpool" = 53;
    "Negotiated Bitpool Max" = 64;
    "Negotiated Bitpool Min" = 53;
    "Apple channel type" = "Dual Channel";
    ...
}
```

## 🎚 Features

- Increase the sbc bluetooth audio bit rate with in several click.

### To Do

- For more information on an upcoming development, please read the [todo](TODO.md) list.

### Changelog

- For more information on a releases, a features and a changes, please read the [changelog](CHANGELOG.md) notes.

## 🚦 Getting Started

These instructions allow to get a copy of this project and run it on a local machine.

### Prerequisites

Before using it, make sure that follows software are installed on the local machine:

- **[macOS](https://www.apple.com/ru/macos/what-is/)** - the operating system under which the process is executing;

If any of the listed programs is not installed, then it can be installed by instruction as described below.

1. #### macOS
    - Install macOS by [this](https://support.apple.com/ht201372) instruction.


### Installing

In order to install it is enough to download executable file `sbc bitpool expander.app` for the required release from this page:

```http
https://github.com/ololx/sbc-bitpool-expander/releases/
```

If you want to install the source files it is quite simple to clone or sonload this repository.

### Cloning

For the cloning this repository to a local machine, just use the follows link:

```http
https://github.com/ololx/sbc-bitpool-expander
```

### Using

For use it is required to:

1. Go to the directory where you download this tool (optionally):

   - via Finder;
   - via Terminal prompt; 

   ```bash
   cd /{path to parent dir with this repository}/
   ```

2. Launch the tool in macOS (optionally):

   - via double-click on `sbc bitpool expander.app`;
   - via Terminal prompt;

   ```bash
   open sbc\ bitpool\ expander.app
   ```
3. Set the required bitpool size values. In general, these will be the following settings:

```
- Current/Initial bitpool value is 53;
- Min bitpool value is 53;
- Max bitpool value is 64;
```

4. Enter the administrator credentials if necessary

5. Reconnect a headphones to a local machine via `Bluetooth`

### If you want a better result for your device 

NOTE: It's universal settings and it works for the most devices. Below you can find settings for better sound quality on your device.
If you want to watch your current settings:
```bash
sudo defaults read bluetoothaudiod 
```
or if you want reset it to default:
```bash
sudo defaults delete bluetoothaudiod
```
You may experement with "Apple Bitpool Min" setting. For example, the best sound on my device "Harman Kardon Go + Play" is on value 111:
```bash
sudo defaults write bluetoothaudiod "Apple Bitpool Min" -int 111
sudo defaults write bluetoothaudiod "Apple Bitpool Max" -int 111
```
And I got stable bit rate at 705 kb/s.

## 🛠 Built With

- **[Xcode](https://developer.apple.com/xcode/)** - the IDE for the `AppleScriptObjC` automatisation development.

## 🎉 Contributing

If you want to contribute this project - you are welcome and have fun.
Please visit the [contributing](CONTRIBUTING.md) section for details on this code of conduct, and the process for submitting pull requests.

## 📝 Code of Conduct

In order to ensure that all is welcoming, please review and abide by the [code of conduct](CODE_OF_CONDUCT.md).

## 🗒 Versioning

For the versioning is used [Semantic Versioning](http://semver.org/). For the versions available, see the [changelog](CHANGELOG.md) or the tags on this repository.

## ©️ Authors

* **Alexander A. Kropotin** - *initial work* - [ololx](https://github.com/ololx).

### Contributors ✨

#### Thanks goes to these wonderful people:

* **Roman** - *contributing* - [dE1l](https://github.com/dE1l).

## 🔏 Licensing

This project is licensed under the MIT license - see the [lisence](LICENSE) document for details.
