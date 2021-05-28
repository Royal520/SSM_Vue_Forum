import {request} from "./request";

export function getArticleByArticleid(id){
  return request({
    url:'/article/getArticleByArticleid',
    params:{id:id}
  })
}


export function writeArticle(article) {

  let param = new URLSearchParams()
  param.append('text', article.txt)
  param.append('label',article.labels)
  param.append('plateid',article.plate)
  param.append('title',article.title)
  return request({
    url:'/article/write',
    data:param,
    method:'post'
  })


}

export function submitComment(data,fatherid,articleid) {
  let param = new URLSearchParams()
  param.append('content', data)
  param.append('articleid', articleid)
  param.append('fatherid', fatherid)
  return request({
    url:"/comment/submit",
    method:"post",
    data:param
  })
}

export function getComment(fatherid,articleid) {
  let param = new URLSearchParams()
  param.append('articleid', articleid)
  param.append('fatherid', fatherid)
  return request({
    url:"/comment/getComment",
    method:"post",
    data:param
  })
}
