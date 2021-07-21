// 新しいjsファイルを作ったらサーバーを再起動しよう
// ctrl+C サーバーを落とす
// bin/webpack-dev-server サーバーを起動

import $ from 'jquery'
// jQueryの読み込みを行う
import axios from 'modules/axios'

import Turbolinks from 'turbolinks'


import {
    listenInactiveHeartEvent,
    listenActiveHeartEvent
  } from 'modules/handle_heart'
// 作った外部ファイルから読み込んでる。読み込めるのはexportしたメソッドのみ。

const handleHeartDisplay = (hasLiked) => {
    if (hasLiked) {
      $('.active-heart').removeClass('hidden')
    } else {
      $('.inactive-heart').removeClass('hidden')
    }
  }

const handleCommentForm = () => {
  $('.show-comment-form').on('click', () => {
    $('.show-comment-form').addClass('hidden')
    $('.comment-text-area').removeClass('hidden')
  })
}

const appendNewComment = (comment) => {
  $('.comments-container').append(
    `<div class="article_comment"><p>${comment.content}</p></div>`
  )
}

document.addEventListener('DOMContentLoaded', () => {
    const dataset = $('#article-show').data()
    const articleId = dataset.articleId

    // ページが表示されたときにコメントを読み込んで表示する
    axios.get(`/api/articles/${articleId}/comments`)
    .then((response) => {
      const comments = response.data
      comments.forEach((comment) => {
        appendNewComment(comment)      })
    })

    handleCommentForm()

    $('.add-comment-button').on('click', () => {
        const content = $('#comment_content').val()
        if (!content) {
          window.alert('コメントを入力してください')
        } else {
          axios.post(`/api/articles/${articleId}/comments`, {
            comment: {content: content}
          })
            .then((res) => {
              const comment = res.data
              appendNewComment(comment)
              $('#comment_content').val('')
            })
        }
      })
    // if (!content) コンテントが存在してなければ
    // res responseの略
    // val (value)表記内容

    axios.get(`/api/articles/${articleId}/like`)
        // 変数展開するために``になってることに注意
        .then((response) => {
            const hasLiked = response.data.hasLiked
            handleHeartDisplay(hasLiked)
        })

    listenInactiveHeartEvent(articleId)
    listenActiveHeartEvent(articleId)

    })

// この辺まじでわけがわかんねええええええjavascriptわかんねええええ

// Turbolinks
// 普通のwebならDOMContentLoadedでいいが、Railsは読み込みを早くするためにturbolinksという機能を使っているためぐるぐるが起きず、DOM〜だと監視できない


// .then 上の処理が終わったらこの次を行う。ステータスコード200系
// .catch 上の処理が失敗したらこの次を行う。ステータスコード400系と500系