// 新しいjsファイルを作ったらサーバーを再起動しよう
// ctrl+C サーバーを落とす
// bin/webpack-dev-server サーバーを起動

import $ from 'jquery'
// jQueryの読み込みを行う

import axios from 'axios'
// axiosというライブラリの読み込み

import Turbolinks from 'turbolinks'

import { csrfToken } from 'rails-ujs'
axios.defaults.headers.common['X-CSRF-Token'] = csrfToken()
//   postはgetと違って不正に利用される可能性があるのでajaxでpostするときは
//   ターミナルで yarn add rails-ujs を実行したあと、ここで鍵を設定しておく


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
    axios.get(`/articles/${articleId}/comments`)
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
          axios.post(`/articles/${articleId}/comments`, {
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

    axios.get(`/articles/${articleId}/like`)
        // 変数展開するために``になってることに注意
        .then((response) => {
            const hasLiked = response.data.hasLiked
            handleHeartDisplay(hasLiked)
        })

        $('.inactive-heart').on('click', () => {
            axios.post(`/articles/${articleId}/like`)
              .then((response) => {
                if (response.data.status === 'ok') {
                    $('.active-heart').removeClass('hidden')
                    $('.inactive-heart').addClass('hidden')
                  }
              })
              .catch((e) => {
                window.alert('Error')
                console.log(e)
              })
          })
        
          $('.active-heart').on('click', () => {
            axios.delete(`/articles/${articleId}/like`)
              .then((response) => {
                if (response.data.status === 'ok') {
                    $('.active-heart').addClass('hidden')
                    $('.inactive-heart').removeClass('hidden')
                  }
              })
              .catch((e) => {
                window.alert('Error')
                console.log(e)
              })
          })
    })
// この辺まじでわけがわかんねええええええjavascriptわかんねええええ

// Turbolinks
// 普通のwebならDOMContentLoadedでいいが、Railsは読み込みを早くするためにturbolinksという機能を使っているためぐるぐるが起きず、DOM〜だと監視できない
