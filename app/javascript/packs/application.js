// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("@rails/activestorage").start()
require("channels")


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

require("trix")
require("@rails/actiontext")


// #####################JavaScript関連##############################

// yarnの導入はgemfileじゃなくてターミナルから導入する
// yarn add jquery
// package.jsonはjavascript版gemfileと思ってよし！

// JavaScriptの読み込みを早くするためにwebpackを入れる。
// ターミナルで bin/webpack-dev-server を実行してサーバーを立ち上げていると、変更して保存かけると自動でwebpackerに変更をかけてくれる。
// つまりjavascript周りをいじってる時はこのサーバーを立ち上げておこう。

// webpack モジュールパンドラと言われるやつ。複数のJavaスクリプトファイルを読み込んで一つのファイルに出力する

// axiosの導入
// yarn add axios をターミナルで実行
// application.js に import axios from 'axios' を記述



//   JavaScriptのデバッグ方法
//   debugger
//   prybybugのように処理を止める
//   検証中にしか起こらないので注意
//   console.log('aaaaaa')
//   みたいなのをどこかに入れておいて、エラーがそれの前に出てるのか後に出てるのかをみる(検証のmessageのところ)


// API
// ApplicationProgrammingInterfaceの略。プログラム同士の
// 繋ぎ込みを行うために存在するもの

// json ajaxの場合はリクエストに対してハッシュのようなデータを返す。このデータをjsonと呼ぶ。


