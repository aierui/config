


```js
//  浏览器 默认禁止复制，下面可开启复制

var eles = document.getElementsByTagName('*');
for (var i = 0; i < eles.length; i++) {
    eles[i].style.userSelect = 'text';
}
```
