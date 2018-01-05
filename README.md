# 日常配置文件

这些是我在Linux下工作时候使用时一些软件的配置文件，希望各位能在配置这些软件的时候进行参考。

## zsh

在日常使用中使用zsh作为默认的shell环境，使用[oh-my-zsh](http://ohmyz.sh/)作为日常的的zsh的配置

在这个配置中，需要这些插件：

1. zsh-autosuggestions
2. zsh-syntax-highlighting
3. thefuck
4. fzf
5. docker

## vim 配置

在使用了[spf13](http://vim.spf13.com/)和[SpaceVim](http://spacevim.org/)的配置后，我认为一个轻便的vim配置才是适合我的。通过我使用一段时间后的感受来说，这两个vim的配置都是特别出色的，尤其是Spacevim的配置我特别喜欢。但是因为这两个配置支持的特性有点多，我目前还不能完全接受，所以我才写了一个适合我的版本的配置，当然也使其能完成我日常基本使用。

### 附加工具

对由于[YoucompleteMe](https://github.com/Valloric/YouCompleteMe)这个插件来说，其本身默认支持的Python是相当强的，但是我觉得他的C支持更好。使用这个插件的时候我建议升级本系统的Clang到最新，然后使用本地环境进行编译较好。

并且使用c的补全的话需要使用`clang`进行编译，还需要`cmake`工具，所以在使用的时候需要在之前安装这两个工具，同时还需要`typescript`，`go`，`tern`这些语言环境来支持

### vim-plug

```bash
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

## emacs 配置

配置这个emacs只是为了学习使用emacs而已，这里使用的是[Spacemacs](http://spacemacs.org/)的配置。因为其本身是一个非常好的配置了，我只是在其中加入了一些layer的配置，基本上能完成日常的开发工作。

## git配置

一些基本的git配置

