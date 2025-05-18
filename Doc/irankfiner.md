# How to Use

## ~~Build From Source Code~~
安装脚本
```bash
./install.sh
```

- 遇到问题，报错提示需要`python < 3.9` `python-dev`

- 禁止使用参数`--sudo`避免绕过虚拟环境

- 每次需要删除`rm -rf /tmp/ppl`
- `.sh`有过时的pip指令，需要注释掉：
````bash
--process-dependency-links
````
- 部分使用http无法网络正常，需要ssh服务：
````bash
git config --global url."git@github.com:".insteadOf "https://github.com/"
````
- 与python3.8兼容的cython版本是0.29.14

- cython 0.29.14版本可能过高，需要补充
```bash
pip install pythran
```

- 仍然出错，修改cython到0.29.36

- 仍然出错，源码安装，再降级pythran版本
```bash
pip install --no-binary cython cython==0.29.36
pip install pythran==0.12.0
```

- 仍然存在报错，暂时放弃

## Use Executable
Download URL: https://github.com/jesusjda/pyRankFinder/releases/tag/v1.3.2
Please Download from version v1.3.2 and before;
Because v1.3.3 only have source code;

```bash
irankfinder/irankfinder --help
```

