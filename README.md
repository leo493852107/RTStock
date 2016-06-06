===
# 想自己写一个10档股票行情(iOS版)，暂时命名为`实时股票`

===

## 使用的`API`接口是
```
https://app.leverfun.com/timelyInfo/timelyOrderForm?stockCode=300104
```

### 下面是返回的`json`格式数据
```
{
    code = 0;
    data =     {
        buyPankou =         (
                        {
                price = "54.71";
                volume = 74;
            },
                        {
                price = "54.7";
                volume = 9;
            },
                        {
                price = "54.69";
                volume = 10;
            },
                        {
                price = "54.68";
                volume = 225;
            },
                        {
                price = "54.67";
                volume = 3;
            },
                        {
                price = "54.66";
                volume = 75;
            },
                        {
                price = "54.65";
                volume = 15;
            },
                        {
                price = "54.64";
                volume = 2;
            },
                        {
                price = "54.62";
                volume = 9;
            },
                        {
                price = "54.61";
                volume = 53;
            }
        );
        match = "54.71";
        preClose = "56.31999969482422";
        sellPankou =         (
                        {
                price = "54.8";
                volume = 18;
            },
                        {
                price = "54.81";
                volume = 43;
            },
                        {
                price = "54.83";
                volume = 29;
            },
                        {
                price = "54.84";
                volume = 2;
            },
                        {
                price = "54.85";
                volume = 413;
            },
                        {
                price = "54.86";
                volume = 11;
            },
                        {
                price = "54.87";
                volume = 26;
            },
                        {
                price = "54.88";
                volume = 149;
            },
                        {
                price = "54.89";
                volume = 23;
            },
                        {
                price = "54.9";
                volume = 57;
            }
        );
        type = 1;
    };
    message = "";
    success = 1;
}
```
