首先将电脑语言改成英语，避免后续出现一系列恶心的鬼问题。

**如果系统是家庭版无法更改语言怎么办？重开吧。**



其次，课程官网的说明多读几遍（英文不好 ╮(╯﹏╰）╭， 嘤嘤嘤） 

但囿于经验不足，官网的说明我也一看的一知半解，因此某位不留名的仁兄所著的中文版《A Guide For CS 61A: Structure and Interpretation of Computer Programs》也给予了我很大帮助，感谢！

做题的简单步骤：

1. 将官网的lab下载到本地
2. 放到合适的文件夹内
3. 编辑完成后运行`python ok --local`

几个注意点：

1. 如果网站提示用python3，但在gitbash中使用python(我在gitbash的终端上执行`python3`会自动跳转到应用商店)

   ``` 
   Remember, if you are using Windows and the python3 command doesn't work, try using python or py. 
   ```

   

2. 本地测试即`ok`命令，务必添加`--local`，倘若没有此option，会提示输入UCB的邮箱（虽然我有，但太麻烦而且没必要），或者打开[网上测评系统]( https://okpy.org/)，需要enroll了这门课的学生才可以用捏

3. `-u`这个option是解锁本地测试的意思

4. parsons问题：需要正在ok.org上进行测试，如果你执行`python parsons`，又会提示输入UCB邮箱

暂时就这些了，happy coding!

## lab 00

具体参考[官网文档](https://ubuntu.com/tutorials/install-ubuntu-on-wsl2-on-windows-11-with-gui-support#1-overview) ，Windows 11系统配置Linux环境时，Ubuntu和WSL(Windows subsystem for linux preview)一点要安装在同一个磁盘（C盘，因为WSL只能安装在C盘），否则会报错。设置完用户名和密码以后，记得`sudo apt update`，然后`sudo apt full-upgrade`

python ok的使用也要了解个[大概](https://cs61a.org/articles/using-ok/#signing-in-with-ok),指令只有`python ok --local`会用到，编写自己的测试大体步骤是这样的：创建一个名为`mytests.rst`的文件，内容如

```rst
Suite alpha 
	>>> why - 'not'
	case zeus
		>>> hmm(why)
		'01101000 01101101 01101101 01101101'
		>>> inf_loop(10)
		'ok'
	case 1
		>>> cube(0)
		0
		>>> neverlucky()
		7
Suite lists
	>>> master = [1,2,3]
	>>> more = [4,5,6]
```

再用`python3 ok -t -v`测试，如果想只测试某块内容，使用`python3 ok -t --suite 1 --case 1`，查看通过率`python3 ok -t -cov`



**关于如何写doctest，我有一点人生的经验**

举个栗子咯！比如说这个`test.py`

```python
""" Generalization"""


def sum_naturals(n):
    """Sum the first N natural number.

    >>> sum_naturals(5)
    15
    """
    total, k = 0, 1
    while k <= n:
        total, k = total + k, k + 1
    return total


def sum_cubes(n):
    """ Sum the first N cubes of natural number.

    >>> sum_cubes(5)
    225
    """
    total, k = 0, 1
    while k <= n:
        total, k = total + pow(k, 3), k + 1
    return total

```

将vs code的命令行`bash`一下，颜色变化，黑化成功！

输入`python -m doctest test.py`，静默等待半小时，什么也不会发生。

再来个`test.py`升级版

```python
""" Generalization"""


def identify(k):
    return k


def cube(k):
    return pow(k, 3)


def summation(n, term):
    """Sum the first N terms of sequece.

    >>> summation(5, cube)
    225
    """
    total, k = 0, 1
    while k <= n:
        total, k = total + term(k), k + 1
    return total


def sum_naturals(n):
    """Sum the first N natural number.

    >>> sum_naturals(5)
    15
    """
    return summation(n, identify)


def sum_cubes(n):
    """ Sum the first N cubes of natural number.

    >>> sum_cubes(5)
    225
    """
    return summation(n, cube)

```

此时，把命令换成`python -m doctest -v test.py `,会有美好的事情发生

