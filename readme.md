# DWT windows version mylocal build

* If you are building a dwt Windows library, % rdmd build.d creates DWT libraries in /lib/xxxx

* Aug-18-2017 Problem 'Library can not be created with 'dmd -m64 -O -inline -release ' with
  'dmd Internal error: backend \ cgcod.c 1841 ' error.
```
  location: org.eclipse.swt.win32.win32.x86/src/org/eclipse/swt/custom/CBanner.d:177
  In for loop
    double t = cast (double) i / cast (double) count;
      Changed to the following
    int t = i / count;
      Bezier(.. function has not been confirmed
```


----------------

# DWT window版のローカルビルドです。

* % rdmd build.d で DWT のライブラリを一括で作成します ./lib/xxxx

* StyledText() [エディタ機能]はIMEや漢字処理はできない問題(漢字を入力するとクラッシュ)
swt は内部文字は uft-16 で実装、これに対して dwt は内部文字列 utf-8 に実装されているようだが正しく動作してしていない

* 2017-08-18 dmd -m64 -O -inline -release で dmd Internal error: backend\cgcod.c 1841 コンパイルできない問題
```
  location: org.eclipse.swt.win32.win32.x86/src/org/eclipse/swt/custom/CBanner.d:177
  for ループ中 の
    double t = cast(double) i / cast(double) count;
      を以下に変更
    int t = i / count;
      なおbezier(.. 関数の動作確認はしていない
```

