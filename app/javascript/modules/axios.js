import axios from 'axios'
// axiosというライブラリの読み込み

import {
  csrfToken
} from 'rails-ujs'

axios.defaults.headers.common['X-CSRF-Token'] = csrfToken()
//   postはgetと違って不正に利用される可能性があるのでajaxでpostするときは
//   ターミナルで yarn add rails-ujs を実行したあと、ここで鍵を設定しておく


export default axios

